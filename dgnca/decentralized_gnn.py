from tensorflow import keras
import tensorflow as tf
from spektral.layers import GeneralConv
from spektral.models import GeneralGNN
import numpy as np


class GeneralConvWrapper(GeneralConv):

    def build(self, input_shape):
        # GeneralConv expects a list of shapes
        return super().build([input_shape])

    def call(self, x, **kwargs):
        # Overriding call here to not call propagate

        x = tf.matmul(x, self.kernel)
        if self.use_bias:
            x = tf.nn.bias_add(x, self.bias)
        if self.use_batch_norm:
            x = self.batch_norm(x)
        x = self.dropout(x)
        x = self.activation(x)

        # Skip propagation
        return tf.math.reduce_sum(x, axis=1)


class DecentralizedGNN(GeneralGNN):

    def __init__(self, 
                 output, 
                 activation=None,
                 hidden=256,
                 message_passing=4,
                 pre_process=2,
                 post_process=2,
                 connectivity="cat",
                 batch_norm=True,
                 dropout=0,
                 aggregate="sum",
                 hidden_activation="prelu",
                 pool="sum"):
       
        super().__init__(output, activation, hidden, message_passing, 
                         pre_process, post_process, connectivity, 
                         batch_norm, dropout, aggregate, hidden_activation, pool)
        
        gnn_weights = self.gnn[0].get_weights()
        self.gnn = GeneralConvWrapper(hidden, batch_norm, dropout, aggregate, hidden_activation)
        self.gnn.set_weights(gnn_weights)
    
    def load_weights_from_spektral(self, spektral_model, layer_mapping: dict):
        for spek_name, dec_name in layer_mapping.items():
            spek_weights = spektral_model.get_layer(name=spek_name).get_weights()
            self.get_layer(name=dec_name).set_weights(spek_weights)
    
    def call(self, x: tf.Tensor):
        out = self.pre(x)
        z = self.gnn(out[:, 1:])
        out = self.connectivity([z, out[:, 0, ...]])

        out = self.post(out)

        return out