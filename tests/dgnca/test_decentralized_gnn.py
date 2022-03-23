import pytest
from spektral.models import GeneralGNN
from spektral.data.graph import Graph
import shutil
import numpy as np
import tensorflow as tf
import keras

from dgnca import DecentralizedGNN
import os
# os.environ['TF_DETERMINISTIC_OPS'] = '1'
tf.random.set_seed(1)
rng = np.random.default_rng(seed=1)


a = np.ones([10,10])
a[list(range(10)), list(range(10))] = 0
graph = Graph(x=rng.uniform(size=[10, 256]).astype(np.float32), a=a)
model =  GeneralGNN(256, message_passing=1, pool=None, batch_norm=False, hidden_activation="relu")


@pytest.fixture(scope="session", autouse=True)
def setup():
    model([graph.x[np.newaxis, ...], tf.sparse.from_dense(graph.a)])
    x = keras.Input([10, 256])
    a = keras.Input([10], sparse=True)
    keras.Model(inputs=[x, a], outputs=model.call([x, a])).summary()
    model.save("test_model")
    yield
    shutil.rmtree("test_model")

def test_load_from_file():
    keras.backend.clear_session()

    loaded_model = keras.models.load_model("test_model")

    dec_model = DecentralizedGNN(256, message_passing=1, pool=None, batch_norm=False, hidden_activation="relu")
    dec_model(graph.x[np.newaxis, ...])

    x = keras.Input([10, 256])
    keras.Model(inputs=x, outputs=dec_model.call(x)).summary()

    weight_mapping = {"mlp": "mlp", "mlp_1": "mlp_1", "general_conv": "general_conv_wrapper"}
    dec_model.load_weights_from_spektral(loaded_model, weight_mapping)

    local_x = dec_model(graph.x[np.newaxis, ...])[0]
    global_x = loaded_model([graph.x[np.newaxis, ...], tf.sparse.from_dense(graph.a)])[0, 0]
    
    tf.debugging.assert_near(local_x, global_x, summarize=5)
                        

def test_load_from_file_set_zero():
    keras.backend.clear_session()

    loaded_model = keras.models.load_model("test_model")

    for layer in loaded_model.layers:
        if layer.name == "mlp":
            layer.set_weights([np.zeros([256, 256]), np.zeros(256), np.zeros([256, 256]), np.zeros(256)])
        elif layer.name == "mlp_1":
            layer.set_weights([np.zeros([512, 256]), np.zeros(256), np.zeros([256, 256]), np.zeros(256)])
        elif layer.name == "general_conv":
            layer.set_weights([np.zeros([256, 256]), np.zeros(256)])
        elif layer.name == "concatenate":
            pass
        else:
            assert False

    dec_model = DecentralizedGNN(256, message_passing=1, pool=None, batch_norm=False, hidden_activation="relu")
    dec_model(graph.x[np.newaxis, ...])

    x = keras.Input([10, 256])
    keras.Model(inputs=x, outputs=dec_model.call(x)).summary()

    weight_mapping = {"mlp": "mlp", "mlp_1": "mlp_1", "general_conv": "general_conv_wrapper"}
    dec_model.load_weights_from_spektral(loaded_model, weight_mapping)

    local_x = dec_model(graph.x[np.newaxis, ...])[0]
    global_x = loaded_model([graph.x[np.newaxis, ...], tf.sparse.from_dense(graph.a)])[0, 0]
    
    tf.debugging.assert_near(local_x, global_x, summarize=5)
    tf.debugging.assert_equal(local_x, tf.zeros_like(local_x), summarize=5)
    tf.debugging.assert_equal(global_x, tf.zeros_like(global_x), summarize=5)
                        