??
??
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( ?
l
BatchMatMulV2
x"T
y"T
output"T"
Ttype:
2		"
adj_xbool( "
adj_ybool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
?
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
?
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ??
@
StaticRegexFullMatch	
input

output
"
patternstring
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
-
Tanh
x"T
y"T"
Ttype:

2
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
?
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments"Tnumsegments
output"T" 
Ttype:
2	"
Tindicestype:
2	" 
Tnumsegmentstype0:
2	
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68??
u
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*
shared_namedense/kernel
n
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	?*
dtype0
m

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_name
dense/bias
f
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:?*
dtype0
z
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*
shared_namedense_1/kernel
s
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
??*
dtype0
q
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namedense_1/bias
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:?*
dtype0
?
2while/gnnca_simple/general_gnn/general_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*C
shared_name42while/gnnca_simple/general_gnn/general_conv/kernel
?
Fwhile/gnnca_simple/general_gnn/general_conv/kernel/Read/ReadVariableOpReadVariableOp2while/gnnca_simple/general_gnn/general_conv/kernel* 
_output_shapes
:
??*
dtype0
?
0while/gnnca_simple/general_gnn/general_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*A
shared_name20while/gnnca_simple/general_gnn/general_conv/bias
?
Dwhile/gnnca_simple/general_gnn/general_conv/bias/Read/ReadVariableOpReadVariableOp0while/gnnca_simple/general_gnn/general_conv/bias*
_output_shapes	
:?*
dtype0
z
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*
shared_namedense_2/kernel
s
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel* 
_output_shapes
:
??*
dtype0
q
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namedense_2/bias
j
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes	
:?*
dtype0
y
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*
shared_namedense_3/kernel
r
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes
:	?*
dtype0
p
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_3/bias
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:*
dtype0

NoOpNoOp
?a
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?a
value?aB?a B?a
?
mp
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
		steps


signatures*
?

config
connectivity
pre
gnn
post
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses*
J
0
1
2
3
4
5
6
7
8
9*
J
0
1
2
3
4
5
6
7
8
9*
* 
?
 non_trainable_variables

!layers
"metrics
#layer_regularization_losses
$layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 
* 

%serving_default* 
* 
?
&	variables
'trainable_variables
(regularization_losses
)	keras_api
*__call__
*+&call_and_return_all_conditional_losses* 
?

,config
-mlp
.	variables
/trainable_variables
0regularization_losses
1	keras_api
2__call__
*3&call_and_return_all_conditional_losses*

40*
?

5config
6mlp
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses*
J
0
1
2
3
4
5
6
7
8
9*
J
0
1
2
3
4
5
6
7
8
9*
* 
?
=non_trainable_variables

>layers
?metrics
@layer_regularization_losses
Alayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
LF
VARIABLE_VALUEdense/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
JD
VARIABLE_VALUE
dense/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUEdense_1/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEdense_1/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUE2while/gnnca_simple/general_gnn/general_conv/kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUE0while/gnnca_simple/general_gnn/general_conv/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUEdense_2/kernel&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEdense_2/bias&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUEdense_3/kernel&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEdense_3/bias&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
* 

0*
* 
* 
* 
* 
* 
* 
* 
?
Bnon_trainable_variables

Clayers
Dmetrics
Elayer_regularization_losses
Flayer_metrics
&	variables
'trainable_variables
(regularization_losses
*__call__
*+&call_and_return_all_conditional_losses
&+"call_and_return_conditional_losses* 
* 
* 
* 
?
Glayer_with_weights-0
Glayer-0
Hlayer-1
Ilayer-2
Jlayer_with_weights-1
Jlayer-3
Klayer-4
Llayer-5
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses*
 
0
1
2
3*
 
0
1
2
3*
* 
?
Snon_trainable_variables

Tlayers
Umetrics
Vlayer_regularization_losses
Wlayer_metrics
.	variables
/trainable_variables
0regularization_losses
2__call__
*3&call_and_return_all_conditional_losses
&3"call_and_return_conditional_losses*
* 
* 
?
Xkwargs_keys
Ydropout

kernel
bias
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
^__call__
*_&call_and_return_all_conditional_losses*
* 
?
`layer_with_weights-0
`layer-0
alayer-1
blayer-2
clayer_with_weights-1
clayer-3
dlayer-4
elayer-5
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
j__call__
*k&call_and_return_all_conditional_losses*
 
0
1
2
3*
 
0
1
2
3*
* 
?
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses*
* 
* 
* 
 
0
1
42
3*
* 
* 
* 
* 
* 
* 
* 
* 
?

kernel
bias
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses*
?
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{_random_generator
|__call__
*}&call_and_return_all_conditional_losses* 
?
~	variables
trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?

kernel
bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses* 
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
 
0
1
2
3*
 
0
1
2
3*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses*
* 
* 
* 

-0*
* 
* 
* 
* 
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses* 

0
1*

0
1*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
Z	variables
[trainable_variables
\regularization_losses
^__call__
*_&call_and_return_all_conditional_losses
&_"call_and_return_conditional_losses*
* 
* 
?

kernel
bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses* 
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?

kernel
bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses* 
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
 
0
1
2
3*
 
0
1
2
3*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
f	variables
gtrainable_variables
hregularization_losses
j__call__
*k&call_and_return_all_conditional_losses
&k"call_and_return_conditional_losses*
* 
* 
* 

60*
* 
* 
* 

0
1*

0
1*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
w	variables
xtrainable_variables
yregularization_losses
|__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
~	variables
trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 

0
1*

0
1*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
.
G0
H1
I2
J3
K4
L5*
* 
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
* 
	
Y0* 
* 
* 
* 

0
1*

0
1*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 

0
1*

0
1*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
.
`0
a1
b2
c3
d4
e5*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
?
serving_default_args_0Placeholder*+
_output_shapes
:?????????d*
dtype0* 
shape:?????????d
{
serving_default_args_0_1Placeholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????
s
serving_default_args_0_2Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
a
serving_default_args_0_3Placeholder*
_output_shapes
:*
dtype0	*
shape:
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_args_0serving_default_args_0_1serving_default_args_0_2serving_default_args_0_3dense/kernel
dense/biasdense_1/kerneldense_1/bias2while/gnnca_simple/general_gnn/general_conv/kernel0while/gnnca_simple/general_gnn/general_conv/biasdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *-
f(R&
$__inference_signature_wrapper_516105
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOpFwhile/gnnca_simple/general_gnn/general_conv/kernel/Read/ReadVariableOpDwhile/gnnca_simple/general_gnn/general_conv/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOpConst*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *(
f#R!
__inference__traced_save_517464
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense/kernel
dense/biasdense_1/kerneldense_1/bias2while/gnnca_simple/general_gnn/general_conv/kernel0while/gnnca_simple/general_gnn/general_conv/biasdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *+
f&R$
"__inference__traced_restore_517504??
?
a
E__inference_dropout_3_layer_call_and_return_conditional_losses_514980

inputs
identityR
IdentityIdentityinputs*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?	
?
?__inference_mlp_layer_call_and_return_conditional_losses_514754

inputs$
sequential_514744:	? 
sequential_514746:	?%
sequential_514748:
?? 
sequential_514750:	?
identity??"sequential/StatefulPartitionedCall?
"sequential/StatefulPartitionedCallStatefulPartitionedCallinputssequential_514744sequential_514746sequential_514748sequential_514750*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514571
IdentityIdentity+sequential/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?k
NoOpNoOp#^sequential/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?+
?
"__inference__traced_restore_517504
file_prefix0
assignvariableop_dense_kernel:	?,
assignvariableop_1_dense_bias:	?5
!assignvariableop_2_dense_1_kernel:
??.
assignvariableop_3_dense_1_bias:	?Y
Eassignvariableop_4_while_gnnca_simple_general_gnn_general_conv_kernel:
??R
Cassignvariableop_5_while_gnnca_simple_general_gnn_general_conv_bias:	?5
!assignvariableop_6_dense_2_kernel:
??.
assignvariableop_7_dense_2_bias:	?4
!assignvariableop_8_dense_3_kernel:	?-
assignvariableop_9_dense_3_bias:
identity_11??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_2?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*)
value BB B B B B B B B B B B ?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*@
_output_shapes.
,:::::::::::*
dtypes
2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOpAssignVariableOpassignvariableop_dense_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_1_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_1_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_4AssignVariableOpEassignvariableop_4_while_gnnca_simple_general_gnn_general_conv_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_5AssignVariableOpCassignvariableop_5_while_gnnca_simple_general_gnn_general_conv_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_6AssignVariableOp!assignvariableop_6_dense_2_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_7AssignVariableOpassignvariableop_7_dense_2_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_8AssignVariableOp!assignvariableop_8_dense_3_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_9AssignVariableOpassignvariableop_9_dense_3_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ?
Identity_10Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_11IdentityIdentity_10:output:0^NoOp_1*
T0*
_output_shapes
: ?
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_11Identity_11:output:0*)
_input_shapes
: : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?
?
C__inference_dense_1_layer_call_and_return_conditional_losses_517243

inputs5
!tensordot_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp|
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:?????????d?z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
a
E__inference_dropout_2_layer_call_and_return_conditional_losses_517330

inputs
identityS
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?L
?
?__inference_mlp_layer_call_and_return_conditional_losses_516553

inputsE
2sequential_dense_tensordot_readvariableop_resource:	??
0sequential_dense_biasadd_readvariableop_resource:	?H
4sequential_dense_1_tensordot_readvariableop_resource:
??A
2sequential_dense_1_biasadd_readvariableop_resource:	?
identity??'sequential/dense/BiasAdd/ReadVariableOp?)sequential/dense/Tensordot/ReadVariableOp?)sequential/dense_1/BiasAdd/ReadVariableOp?+sequential/dense_1/Tensordot/ReadVariableOp?
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0i
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:p
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       V
 sequential/dense/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:j
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:j
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: l
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: h
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
$sequential/dense/Tensordot/transpose	Transposeinputs*sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????m
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?j
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
sequential/dropout/IdentityIdentity!sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?
sequential/activation/ReluRelu$sequential/dropout/Identity:output:0*
T0*,
_output_shapes
:?????????d??
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       z
"sequential/dense_1/Tensordot/ShapeShape(sequential/activation/Relu:activations:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
&sequential/dense_1/Tensordot/transpose	Transpose(sequential/activation/Relu:activations:0,sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????o
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
sequential/dropout_1/IdentityIdentity#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
sequential/activation_1/ReluRelu&sequential/dropout_1/Identity:output:0*
T0*,
_output_shapes
:?????????d?~
IdentityIdentity*sequential/activation_1/Relu:activations:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?O
?
A__inference_mlp_1_layer_call_and_return_conditional_losses_516697

inputsJ
6sequential_1_dense_2_tensordot_readvariableop_resource:
??C
4sequential_1_dense_2_biasadd_readvariableop_resource:	?I
6sequential_1_dense_3_tensordot_readvariableop_resource:	?B
4sequential_1_dense_3_biasadd_readvariableop_resource:
identity??+sequential_1/dense_2/BiasAdd/ReadVariableOp?-sequential_1/dense_2/Tensordot/ReadVariableOp?+sequential_1/dense_3/BiasAdd/ReadVariableOp?-sequential_1/dense_3/Tensordot/ReadVariableOp?
-sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0m
#sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Z
$sequential_1/dense_2/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:n
,sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_2/Tensordot/GatherV2GatherV2-sequential_1/dense_2/Tensordot/Shape:output:0,sequential_1/dense_2/Tensordot/free:output:05sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)sequential_1/dense_2/Tensordot/GatherV2_1GatherV2-sequential_1/dense_2/Tensordot/Shape:output:0,sequential_1/dense_2/Tensordot/axes:output:07sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
#sequential_1/dense_2/Tensordot/ProdProd0sequential_1/dense_2/Tensordot/GatherV2:output:0-sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
%sequential_1/dense_2/Tensordot/Prod_1Prod2sequential_1/dense_2/Tensordot/GatherV2_1:output:0/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential_1/dense_2/Tensordot/concatConcatV2,sequential_1/dense_2/Tensordot/free:output:0,sequential_1/dense_2/Tensordot/axes:output:03sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
$sequential_1/dense_2/Tensordot/stackPack,sequential_1/dense_2/Tensordot/Prod:output:0.sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
(sequential_1/dense_2/Tensordot/transpose	Transposeinputs.sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
&sequential_1/dense_2/Tensordot/ReshapeReshape,sequential_1/dense_2/Tensordot/transpose:y:0-sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
%sequential_1/dense_2/Tensordot/MatMulMatMul/sequential_1/dense_2/Tensordot/Reshape:output:05sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????q
&sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?n
,sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_2/Tensordot/concat_1ConcatV20sequential_1/dense_2/Tensordot/GatherV2:output:0/sequential_1/dense_2/Tensordot/Const_2:output:05sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential_1/dense_2/TensordotReshape/sequential_1/dense_2/Tensordot/MatMul:product:00sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
+sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
sequential_1/dense_2/BiasAddBiasAdd'sequential_1/dense_2/Tensordot:output:03sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
sequential_1/dropout_2/IdentityIdentity%sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
sequential_1/activation_2/ReluRelu(sequential_1/dropout_2/Identity:output:0*
T0*,
_output_shapes
:?????????d??
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0m
#sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
$sequential_1/dense_3/Tensordot/ShapeShape,sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:n
,sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_3/Tensordot/GatherV2GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/free:output:05sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)sequential_1/dense_3/Tensordot/GatherV2_1GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/axes:output:07sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
(sequential_1/dense_3/Tensordot/transpose	Transpose,sequential_1/activation_2/Relu:activations:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????p
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:n
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
sequential_1/dropout_3/IdentityIdentity%sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????d?
sequential_1/activation_3/TanhTanh(sequential_1/dropout_3/Identity:output:0*
T0*+
_output_shapes
:?????????du
IdentityIdentity"sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp,^sequential_1/dense_2/BiasAdd/ReadVariableOp.^sequential_1/dense_2/Tensordot/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2Z
+sequential_1/dense_2/BiasAdd/ReadVariableOp+sequential_1/dense_2/BiasAdd/ReadVariableOp2^
-sequential_1/dense_2/Tensordot/ReadVariableOp-sequential_1/dense_2/Tensordot/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2^
-sequential_1/dense_3/Tensordot/ReadVariableOp-sequential_1/dense_3/Tensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
a
E__inference_dropout_2_layer_call_and_return_conditional_losses_515011

inputs
identityS
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
&__inference_mlp_1_layer_call_fn_515197
input_1
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_mlp_1_layer_call_and_return_conditional_losses_515173s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:U Q
,
_output_shapes
:?????????d?
!
_user_specified_name	input_1
?!
?
H__inference_general_conv_layer_call_and_return_conditional_losses_515387

inputs
inputs_1	
inputs_2
inputs_3	2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0u
MatMulBatchMatMulV2inputsMatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0z
BiasAddBiasAddMatMul:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?U
ReluReluBiasAdd:output:0*
T0*,
_output_shapes
:?????????d?G
ShapeShapeRelu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputs_1strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputs_1strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Relu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
	transpose	TransposeGatherV2:output:0transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
UnsortedSegmentSumUnsortedSegmentSumtranspose:y:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????e
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
transpose_1	TransposeUnsortedSegmentSum:output:0transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:?????????d?w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*W
_input_shapesF
D:?????????d?:?????????:?????????:: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
H__inference_sequential_1_layer_call_and_return_conditional_losses_515117
dense_2_input"
dense_2_515102:
??
dense_2_515104:	?!
dense_3_515109:	?
dense_3_515111:
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCalldense_2_inputdense_2_515102dense_2_515104*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_514880?
dropout_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_515011?
activation_2/PartitionedCallPartitionedCall"dropout_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_2_layer_call_and_return_conditional_losses_514898?
dense_3/StatefulPartitionedCallStatefulPartitionedCall%activation_2/PartitionedCall:output:0dense_3_515109dense_3_515111*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_514930?
dropout_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_3_layer_call_and_return_conditional_losses_514980?
activation_3/PartitionedCallPartitionedCall"dropout_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_3_layer_call_and_return_conditional_losses_514948x
IdentityIdentity%activation_3/PartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:[ W
,
_output_shapes
:?????????d?
'
_user_specified_namedense_2_input
?

?
while_cond_515935
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_less_steps4
0while_while_cond_515935___redundant_placeholder04
0while_while_cond_515935___redundant_placeholder14
0while_while_cond_515935___redundant_placeholder24
0while_while_cond_515935___redundant_placeholder34
0while_while_cond_515935___redundant_placeholder44
0while_while_cond_515935___redundant_placeholder54
0while_while_cond_515935___redundant_placeholder6	4
0while_while_cond_515935___redundant_placeholder74
0while_while_cond_515935___redundant_placeholder84
0while_while_cond_515935___redundant_placeholder95
1while_while_cond_515935___redundant_placeholder105
1while_while_cond_515935___redundant_placeholder11
while_identity
X

while/LessLesswhile_placeholderwhile_less_steps*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*Y
_input_shapesH
F: : : :d: ::::::::::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :($
"
_output_shapes
:d:

_output_shapes
: :

_output_shapes
::

_output_shapes
:
?
?
C__inference_dense_2_layer_call_and_return_conditional_losses_517311

inputs5
!tensordot_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp|
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:?????????d?z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
_
C__inference_dropout_layer_call_and_return_conditional_losses_514631

inputs
identityS
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
,__inference_general_gnn_layer_call_fn_516133
inputs_0

inputs	
inputs_1
inputs_2	
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_general_gnn_layer_call_and_return_conditional_losses_515305s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?	
?
A__inference_mlp_1_layer_call_and_return_conditional_losses_515173

inputs'
sequential_1_515163:
??"
sequential_1_515165:	?&
sequential_1_515167:	?!
sequential_1_515169:
identity??$sequential_1/StatefulPartitionedCall?
$sequential_1/StatefulPartitionedCallStatefulPartitionedCallinputssequential_1_515163sequential_1_515165sequential_1_515167sequential_1_515169*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_515057?
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????dm
NoOpNoOp%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
+__inference_sequential_layer_call_fn_514582
dense_input
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalldense_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514571t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
+
_output_shapes
:?????????d
%
_user_specified_namedense_input
?	
?
?__inference_mlp_layer_call_and_return_conditional_losses_514793

inputs$
sequential_514783:	? 
sequential_514785:	?%
sequential_514787:
?? 
sequential_514789:	?
identity??"sequential/StatefulPartitionedCall?
"sequential/StatefulPartitionedCallStatefulPartitionedCallinputssequential_514783sequential_514785sequential_514787sequential_514789*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514677
IdentityIdentity+sequential/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?k
NoOpNoOp#^sequential/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
G__inference_general_gnn_layer_call_and_return_conditional_losses_515305

inputs
inputs_1	
inputs_2
inputs_3	

mlp_515236:	?

mlp_515238:	?

mlp_515240:
??

mlp_515242:	?'
general_conv_515281:
??"
general_conv_515283:	? 
mlp_1_515295:
??
mlp_1_515297:	?
mlp_1_515299:	?
mlp_1_515301:
identity??$general_conv/StatefulPartitionedCall?mlp/StatefulPartitionedCall?mlp_1/StatefulPartitionedCall?
mlp/StatefulPartitionedCallStatefulPartitionedCallinputs
mlp_515236
mlp_515238
mlp_515240
mlp_515242*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_mlp_layer_call_and_return_conditional_losses_514754?
$general_conv/StatefulPartitionedCallStatefulPartitionedCall$mlp/StatefulPartitionedCall:output:0inputs_1inputs_2inputs_3general_conv_515281general_conv_515283*
Tin

2		*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_general_conv_layer_call_and_return_conditional_losses_515280?
concatenate/PartitionedCallPartitionedCall-general_conv/StatefulPartitionedCall:output:0$mlp/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_515293?
mlp_1/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0mlp_1_515295mlp_1_515297mlp_1_515299mlp_1_515301*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_mlp_1_layer_call_and_return_conditional_losses_515134y
IdentityIdentity&mlp_1/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp%^general_conv/StatefulPartitionedCall^mlp/StatefulPartitionedCall^mlp_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2L
$general_conv/StatefulPartitionedCall$general_conv/StatefulPartitionedCall2:
mlp/StatefulPartitionedCallmlp/StatefulPartitionedCall2>
mlp_1/StatefulPartitionedCallmlp_1/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?

?
-__inference_general_conv_layer_call_fn_516911
inputs_0

inputs	
inputs_1
inputs_2	
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0*
Tin

2		*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_general_conv_layer_call_and_return_conditional_losses_515280t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*W
_input_shapesF
D:?????????d?:?????????:?????????:: : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
a
C__inference_dropout_layer_call_and_return_conditional_losses_514511

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:?????????d?"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
X
,__inference_concatenate_layer_call_fn_516460
inputs_0
inputs_1
identity?
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_515293e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*C
_input_shapes2
0:?????????d?:?????????d?:V R
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/0:VR
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/1
?
?
+__inference_sequential_layer_call_fn_516781

inputs
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514677t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
I
-__inference_activation_3_layer_call_fn_517403

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_3_layer_call_and_return_conditional_losses_514948d
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
-__inference_gnnca_simple_layer_call_fn_515623
inputs_0

inputs	
inputs_1
inputs_2	
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515544s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
s
G__inference_concatenate_layer_call_and_return_conditional_losses_516467
inputs_0
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :|
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d?\
IdentityIdentityconcat:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*C
_input_shapes2
0:?????????d?:?????????d?:V R
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/0:VR
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/1
?
?
&__inference_mlp_1_layer_call_fn_516637

inputs
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_mlp_1_layer_call_and_return_conditional_losses_515173s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
q
G__inference_concatenate_layer_call_and_return_conditional_losses_515293

inputs
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :z
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d?\
IdentityIdentityconcat:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*C
_input_shapes2
0:?????????d?:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs:TP
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
D
(__inference_dropout_layer_call_fn_517180

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_514511e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
$__inference_mlp_layer_call_fn_514817
input_1
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_mlp_layer_call_and_return_conditional_losses_514793t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
+
_output_shapes
:?????????d
!
_user_specified_name	input_1
?

?
-__inference_general_conv_layer_call_fn_516923
inputs_0

inputs	
inputs_1
inputs_2	
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0*
Tin

2		*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_general_conv_layer_call_and_return_conditional_losses_515387t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*W
_input_shapesF
D:?????????d?:?????????:?????????:: : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
F
*__inference_dropout_2_layer_call_fn_517316

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_514891e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?"
?
H__inference_general_conv_layer_call_and_return_conditional_losses_515280

inputs
inputs_1	
inputs_2
inputs_3	2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0u
MatMulBatchMatMulV2inputsMatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0z
BiasAddBiasAddMatMul:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?g
dropout_4/IdentityIdentityBiasAdd:output:0*
T0*,
_output_shapes
:?????????d?`
ReluReludropout_4/Identity:output:0*
T0*,
_output_shapes
:?????????d?G
ShapeShapeRelu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputs_1strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputs_1strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Relu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
	transpose	TransposeGatherV2:output:0transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
UnsortedSegmentSumUnsortedSegmentSumtranspose:y:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????e
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
transpose_1	TransposeUnsortedSegmentSum:output:0transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:?????????d?w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*W
_input_shapesF
D:?????????d?:?????????:?????????:: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
(__inference_dense_2_layer_call_fn_517281

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_514880t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
F
*__inference_dropout_3_layer_call_fn_517384

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_3_layer_call_and_return_conditional_losses_514941d
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
+__inference_sequential_layer_call_fn_516768

inputs
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514571t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?J
?
?__inference_mlp_layer_call_and_return_conditional_losses_516611

inputsE
2sequential_dense_tensordot_readvariableop_resource:	??
0sequential_dense_biasadd_readvariableop_resource:	?H
4sequential_dense_1_tensordot_readvariableop_resource:
??A
2sequential_dense_1_biasadd_readvariableop_resource:	?
identity??'sequential/dense/BiasAdd/ReadVariableOp?)sequential/dense/Tensordot/ReadVariableOp?)sequential/dense_1/BiasAdd/ReadVariableOp?+sequential/dense_1/Tensordot/ReadVariableOp?
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0i
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:p
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       V
 sequential/dense/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:j
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:j
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: l
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: h
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
$sequential/dense/Tensordot/transpose	Transposeinputs*sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????m
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?j
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?|
sequential/activation/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       z
"sequential/dense_1/Tensordot/ShapeShape(sequential/activation/Relu:activations:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
&sequential/dense_1/Tensordot/transpose	Transpose(sequential/activation/Relu:activations:0,sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????o
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
sequential/activation_1/ReluRelu#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?~
IdentityIdentity*sequential/activation_1/Relu:activations:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515488

inputs
inputs_1	
inputs_2
inputs_3	%
general_gnn_515466:	?!
general_gnn_515468:	?&
general_gnn_515470:
??!
general_gnn_515472:	?&
general_gnn_515474:
??!
general_gnn_515476:	?&
general_gnn_515478:
??!
general_gnn_515480:	?%
general_gnn_515482:	? 
general_gnn_515484:
identity??#general_gnn/StatefulPartitionedCall?
#general_gnn/StatefulPartitionedCallStatefulPartitionedCallinputsinputs_1inputs_2inputs_3general_gnn_515466general_gnn_515468general_gnn_515470general_gnn_515472general_gnn_515474general_gnn_515476general_gnn_515478general_gnn_515480general_gnn_515482general_gnn_515484*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_general_gnn_layer_call_and_return_conditional_losses_515305
IdentityIdentity,general_gnn/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????dl
NoOpNoOp$^general_gnn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2J
#general_gnn/StatefulPartitionedCall#general_gnn/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?M
?
A__inference_mlp_1_layer_call_and_return_conditional_losses_516755

inputsJ
6sequential_1_dense_2_tensordot_readvariableop_resource:
??C
4sequential_1_dense_2_biasadd_readvariableop_resource:	?I
6sequential_1_dense_3_tensordot_readvariableop_resource:	?B
4sequential_1_dense_3_biasadd_readvariableop_resource:
identity??+sequential_1/dense_2/BiasAdd/ReadVariableOp?-sequential_1/dense_2/Tensordot/ReadVariableOp?+sequential_1/dense_3/BiasAdd/ReadVariableOp?-sequential_1/dense_3/Tensordot/ReadVariableOp?
-sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0m
#sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Z
$sequential_1/dense_2/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:n
,sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_2/Tensordot/GatherV2GatherV2-sequential_1/dense_2/Tensordot/Shape:output:0,sequential_1/dense_2/Tensordot/free:output:05sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)sequential_1/dense_2/Tensordot/GatherV2_1GatherV2-sequential_1/dense_2/Tensordot/Shape:output:0,sequential_1/dense_2/Tensordot/axes:output:07sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
#sequential_1/dense_2/Tensordot/ProdProd0sequential_1/dense_2/Tensordot/GatherV2:output:0-sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
%sequential_1/dense_2/Tensordot/Prod_1Prod2sequential_1/dense_2/Tensordot/GatherV2_1:output:0/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential_1/dense_2/Tensordot/concatConcatV2,sequential_1/dense_2/Tensordot/free:output:0,sequential_1/dense_2/Tensordot/axes:output:03sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
$sequential_1/dense_2/Tensordot/stackPack,sequential_1/dense_2/Tensordot/Prod:output:0.sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
(sequential_1/dense_2/Tensordot/transpose	Transposeinputs.sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
&sequential_1/dense_2/Tensordot/ReshapeReshape,sequential_1/dense_2/Tensordot/transpose:y:0-sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
%sequential_1/dense_2/Tensordot/MatMulMatMul/sequential_1/dense_2/Tensordot/Reshape:output:05sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????q
&sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?n
,sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_2/Tensordot/concat_1ConcatV20sequential_1/dense_2/Tensordot/GatherV2:output:0/sequential_1/dense_2/Tensordot/Const_2:output:05sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential_1/dense_2/TensordotReshape/sequential_1/dense_2/Tensordot/MatMul:product:00sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
+sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
sequential_1/dense_2/BiasAddBiasAdd'sequential_1/dense_2/Tensordot:output:03sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
sequential_1/activation_2/ReluRelu%sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0m
#sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
$sequential_1/dense_3/Tensordot/ShapeShape,sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:n
,sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_3/Tensordot/GatherV2GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/free:output:05sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)sequential_1/dense_3/Tensordot/GatherV2_1GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/axes:output:07sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
(sequential_1/dense_3/Tensordot/transpose	Transpose,sequential_1/activation_2/Relu:activations:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????p
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:n
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
sequential_1/activation_3/TanhTanh%sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????du
IdentityIdentity"sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp,^sequential_1/dense_2/BiasAdd/ReadVariableOp.^sequential_1/dense_2/Tensordot/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2Z
+sequential_1/dense_2/BiasAdd/ReadVariableOp+sequential_1/dense_2/BiasAdd/ReadVariableOp2^
-sequential_1/dense_2/Tensordot/ReadVariableOp-sequential_1/dense_2/Tensordot/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2^
-sequential_1/dense_3/Tensordot/ReadVariableOp-sequential_1/dense_3/Tensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
? 
?
__inference__traced_save_517464
file_prefix+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableopQ
Msavev2_while_gnnca_simple_general_gnn_general_conv_kernel_read_readvariableopO
Ksavev2_while_gnnca_simple_general_gnn_general_conv_bias_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop
savev2_const

identity_1??MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : ?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*)
value BB B B B B B B B B B B ?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableopMsavev2_while_gnnca_simple_general_gnn_general_conv_kernel_read_readvariableopKsavev2_while_gnnca_simple_general_gnn_general_conv_bias_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*s
_input_shapesb
`: :	?:?:
??:?:
??:?:
??:?:	?:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	?:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:%	!

_output_shapes
:	?: 


_output_shapes
::

_output_shapes
: 
?
I
-__inference_activation_1_layer_call_fn_517267

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_1_layer_call_and_return_conditional_losses_514568e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
ڹ
?
while_body_515936
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_steps_0j
Wwhile_gnnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resource_0:	?d
Uwhile_gnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource_0:	?m
Ywhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource_0:
??f
Wwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource_0:	?`
Lwhile_gnnca_simple_general_gnn_general_conv_matmul_readvariableop_resource_0:
??\
Mwhile_gnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resource_0:	?H
Dwhile_gnnca_simple_general_gnn_general_conv_strided_slice_1_inputs_0	q
]while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource_0:
??j
[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource_0:	?p
]while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource_0:	?i
[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource_0:
while_add_range_delta_0
while_identity
while_identity_1
while_identity_2
while_identity_3
while_stepsh
Uwhile_gnnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resource:	?b
Swhile_gnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource:	?k
Wwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource:
??d
Uwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource:	?^
Jwhile_gnnca_simple_general_gnn_general_conv_matmul_readvariableop_resource:
??Z
Kwhile_gnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resource:	?F
Bwhile_gnnca_simple_general_gnn_general_conv_strided_slice_1_inputs	o
[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource:
??h
Ywhile_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource:	?n
[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource:	?g
Ywhile_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource:
while_add_range_delta??Bwhile/gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp?Awhile/gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp?Jwhile/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp?Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp?Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp?Nwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp?Pwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp?Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?Pwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp?Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?
Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpReadVariableOpWwhile_gnnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resource_0*
_output_shapes
:	?*
dtype0?
Kwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"      ?
Ewhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReshapeReshapewhile_placeholder_1Twhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Reshape/shape:output:0*
T0*
_output_shapes
:	??
Dwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/MatMulMatMulNwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Reshape:output:0Twhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0* 
_output_shapes
:
???
Cwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/shapeConst*
_output_shapes
:*
dtype0*!
valueB"   d      ?
=while/gnnca_simple/general_gnn/mlp/sequential/dense/TensordotReshapeNwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/MatMul:product:0Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/shape:output:0*
T0*#
_output_shapes
:d??
Jwhile/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpReadVariableOpUwhile_gnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype0?
;while/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAddBiasAddFwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot:output:0Rwhile/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*#
_output_shapes
:d??
=while/gnnca_simple/general_gnn/mlp/sequential/activation/ReluReluDwhile/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd:output:0*
T0*#
_output_shapes
:d??
Nwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpYwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource_0* 
_output_shapes
:
??*
dtype0?
Mwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"      ?
Gwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReshapeReshapeKwhile/gnnca_simple/general_gnn/mlp/sequential/activation/Relu:activations:0Vwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Reshape/shape:output:0*
T0* 
_output_shapes
:
???
Fwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/MatMulMatMulPwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Reshape:output:0Vwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0* 
_output_shapes
:
???
Ewhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/shapeConst*
_output_shapes
:*
dtype0*!
valueB"   d      ?
?while/gnnca_simple/general_gnn/mlp/sequential/dense_1/TensordotReshapePwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/MatMul:product:0Nwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/shape:output:0*
T0*#
_output_shapes
:d??
Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpWwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype0?
=while/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAddBiasAddHwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot:output:0Twhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*#
_output_shapes
:d??
?while/gnnca_simple/general_gnn/mlp/sequential/activation_1/ReluReluFwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd:output:0*
T0*#
_output_shapes
:d??
Awhile/gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOpReadVariableOpLwhile_gnnca_simple_general_gnn_general_conv_matmul_readvariableop_resource_0* 
_output_shapes
:
??*
dtype0?
2while/gnnca_simple/general_gnn/general_conv/MatMulBatchMatMulV2Mwhile/gnnca_simple/general_gnn/mlp/sequential/activation_1/Relu:activations:0Iwhile/gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp:value:0*
T0*#
_output_shapes
:d??
Bwhile/gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOpReadVariableOpMwhile_gnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype0?
3while/gnnca_simple/general_gnn/general_conv/BiasAddBiasAdd;while/gnnca_simple/general_gnn/general_conv/MatMul:output:0Jwhile/gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp:value:0*
T0*#
_output_shapes
:d??
0while/gnnca_simple/general_gnn/general_conv/ReluRelu<while/gnnca_simple/general_gnn/general_conv/BiasAdd:output:0*
T0*#
_output_shapes
:d??
1while/gnnca_simple/general_gnn/general_conv/ShapeConst*
_output_shapes
:*
dtype0*!
valueB"   d      ?
?while/gnnca_simple/general_gnn/general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
??????????
Awhile/gnnca_simple/general_gnn/general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
??????????
Awhile/gnnca_simple/general_gnn/general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
9while/gnnca_simple/general_gnn/general_conv/strided_sliceStridedSlice:while/gnnca_simple/general_gnn/general_conv/Shape:output:0Hwhile/gnnca_simple/general_gnn/general_conv/strided_slice/stack:output:0Jwhile/gnnca_simple/general_gnn/general_conv/strided_slice/stack_1:output:0Jwhile/gnnca_simple/general_gnn/general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask?
Awhile/gnnca_simple/general_gnn/general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       ?
Cwhile/gnnca_simple/general_gnn/general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
Cwhile/gnnca_simple/general_gnn/general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
;while/gnnca_simple/general_gnn/general_conv/strided_slice_1StridedSliceDwhile_gnnca_simple_general_gnn_general_conv_strided_slice_1_inputs_0Jwhile/gnnca_simple/general_gnn/general_conv/strided_slice_1/stack:output:0Lwhile/gnnca_simple/general_gnn/general_conv/strided_slice_1/stack_1:output:0Lwhile/gnnca_simple/general_gnn/general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask?
Awhile/gnnca_simple/general_gnn/general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        ?
Cwhile/gnnca_simple/general_gnn/general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
Cwhile/gnnca_simple/general_gnn/general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
;while/gnnca_simple/general_gnn/general_conv/strided_slice_2StridedSliceDwhile_gnnca_simple_general_gnn_general_conv_strided_slice_1_inputs_0Jwhile/gnnca_simple/general_gnn/general_conv/strided_slice_2/stack:output:0Lwhile/gnnca_simple/general_gnn/general_conv/strided_slice_2/stack_1:output:0Lwhile/gnnca_simple/general_gnn/general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask?
9while/gnnca_simple/general_gnn/general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
4while/gnnca_simple/general_gnn/general_conv/GatherV2GatherV2>while/gnnca_simple/general_gnn/general_conv/Relu:activations:0Dwhile/gnnca_simple/general_gnn/general_conv/strided_slice_2:output:0Bwhile/gnnca_simple/general_gnn/general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*,
_output_shapes
:???????????
:while/gnnca_simple/general_gnn/general_conv/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
5while/gnnca_simple/general_gnn/general_conv/transpose	Transpose=while/gnnca_simple/general_gnn/general_conv/GatherV2:output:0Cwhile/gnnca_simple/general_gnn/general_conv/transpose/perm:output:0*
T0*,
_output_shapes
:???????????
>while/gnnca_simple/general_gnn/general_conv/UnsortedSegmentSumUnsortedSegmentSum9while/gnnca_simple/general_gnn/general_conv/transpose:y:0Dwhile/gnnca_simple/general_gnn/general_conv/strided_slice_1:output:0Bwhile/gnnca_simple/general_gnn/general_conv/strided_slice:output:0*
T0*
Tindices0	*#
_output_shapes
:d??
<while/gnnca_simple/general_gnn/general_conv/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
7while/gnnca_simple/general_gnn/general_conv/transpose_1	TransposeGwhile/gnnca_simple/general_gnn/general_conv/UnsortedSegmentSum:output:0Ewhile/gnnca_simple/general_gnn/general_conv/transpose_1/perm:output:0*
T0*#
_output_shapes
:d?x
6while/gnnca_simple/general_gnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :?
1while/gnnca_simple/general_gnn/concatenate/concatConcatV2;while/gnnca_simple/general_gnn/general_conv/transpose_1:y:0Mwhile/gnnca_simple/general_gnn/mlp/sequential/activation_1/Relu:activations:0?while/gnnca_simple/general_gnn/concatenate/concat/axis:output:0*
N*
T0*#
_output_shapes
:d??
Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOp]while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource_0* 
_output_shapes
:
??*
dtype0?
Qwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"      ?
Kwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReshapeReshape:while/gnnca_simple/general_gnn/concatenate/concat:output:0Zwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Reshape/shape:output:0*
T0* 
_output_shapes
:
???
Jwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMulMatMulTwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Reshape:output:0Zwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0* 
_output_shapes
:
???
Iwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/shapeConst*
_output_shapes
:*
dtype0*!
valueB"   d      ?
Cwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/TensordotReshapeTwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMul:product:0Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/shape:output:0*
T0*#
_output_shapes
:d??
Pwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOp[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype0?
Awhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAddBiasAddLwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot:output:0Xwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*#
_output_shapes
:d??
Cwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/activation_2/ReluReluJwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd:output:0*
T0*#
_output_shapes
:d??
Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp]while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource_0*
_output_shapes
:	?*
dtype0?
Qwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"      ?
Kwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReshapeReshapeQwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0Zwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Reshape/shape:output:0*
T0* 
_output_shapes
:
???
Jwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMulMatMulTwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Reshape:output:0Zwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*
_output_shapes
:	??
Iwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/shapeConst*
_output_shapes
:*
dtype0*!
valueB"   d      ?
Cwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/TensordotReshapeTwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMul:product:0Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/shape:output:0*
T0*"
_output_shapes
:d?
Pwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource_0*
_output_shapes
:*
dtype0?
Awhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAddBiasAddLwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot:output:0Xwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*"
_output_shapes
:d?
Cwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/activation_3/TanhTanhJwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd:output:0*
T0*"
_output_shapes
:d_
	while/addAddV2while_placeholderwhile_add_range_delta_0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: ?
while/Identity_3IdentityGwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/activation_3/Tanh:y:0^while/NoOp*
T0*"
_output_shapes
:d?

while/NoOpNoOpC^while/gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOpB^while/gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOpK^while/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpM^while/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpM^while/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpO^while/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpQ^while/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpS^while/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpQ^while/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpS^while/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "0
while_add_range_deltawhile_add_range_delta_0"?
Kwhile_gnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resourceMwhile_gnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resource_0"?
Jwhile_gnnca_simple_general_gnn_general_conv_matmul_readvariableop_resourceLwhile_gnnca_simple_general_gnn_general_conv_matmul_readvariableop_resource_0"?
Bwhile_gnnca_simple_general_gnn_general_conv_strided_slice_1_inputsDwhile_gnnca_simple_general_gnn_general_conv_strided_slice_1_inputs_0"?
Ywhile_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource_0"?
[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource]while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource_0"?
Ywhile_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource_0"?
[while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource]while_gnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource_0"?
Uwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resourceWwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource_0"?
Wwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resourceYwhile_gnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource_0"?
Swhile_gnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resourceUwhile_gnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource_0"?
Uwhile_gnnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resourceWwhile_gnnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resource_0")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"
while_stepswhile_steps_0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?: : : :d: : : : : : : :?????????: : : : : 2?
Bwhile/gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOpBwhile/gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp2?
Awhile/gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOpAwhile/gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp2?
Jwhile/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpJwhile/gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp2?
Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpLwhile/gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp2?
Lwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpLwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp2?
Nwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpNwhile/gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp2?
Pwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpPwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp2?
Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpRwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2?
Pwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpPwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp2?
Rwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpRwhile/gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :($
"
_output_shapes
:d:

_output_shapes
: :-)
'
_output_shapes
:?????????:

_output_shapes
: 
?
?
F__inference_sequential_layer_call_and_return_conditional_losses_514737
dense_input
dense_514722:	?
dense_514724:	?"
dense_1_514729:
??
dense_1_514731:	?
identity??dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCalldense_inputdense_514722dense_514724*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_514500?
dropout/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_514631?
activation/PartitionedCallPartitionedCall dropout/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_activation_layer_call_and_return_conditional_losses_514518?
dense_1/StatefulPartitionedCallStatefulPartitionedCall#activation/PartitionedCall:output:0dense_1_514729dense_1_514731*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_514550?
dropout_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_514600?
activation_1/PartitionedCallPartitionedCall"dropout_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_1_layer_call_and_return_conditional_losses_514568y
IdentityIdentity%activation_1/PartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:X T
+
_output_shapes
:?????????d
%
_user_specified_namedense_input
?
F
*__inference_dropout_1_layer_call_fn_517248

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_514561e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
c
E__inference_dropout_3_layer_call_and_return_conditional_losses_514941

inputs

identity_1R
IdentityIdentityinputs*
T0*+
_output_shapes
:?????????d_

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:?????????d"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
_
C__inference_dropout_layer_call_and_return_conditional_losses_517194

inputs
identityS
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
$__inference_mlp_layer_call_fn_516480

inputs
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_mlp_layer_call_and_return_conditional_losses_514754t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
c
E__inference_dropout_1_layer_call_and_return_conditional_losses_514561

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:?????????d?"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
,__inference_general_gnn_layer_call_fn_516161
inputs_0

inputs	
inputs_1
inputs_2	
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_general_gnn_layer_call_and_return_conditional_losses_515430s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?A
?
H__inference_sequential_1_layer_call_and_return_conditional_losses_517078

inputs=
)dense_2_tensordot_readvariableop_resource:
??6
'dense_2_biasadd_readvariableop_resource:	?<
)dense_3_tensordot_readvariableop_resource:	?5
'dense_3_biasadd_readvariableop_resource:
identity??dense_2/BiasAdd/ReadVariableOp? dense_2/Tensordot/ReadVariableOp?dense_3/BiasAdd/ReadVariableOp? dense_3/Tensordot/ReadVariableOp?
 dense_2/Tensordot/ReadVariableOpReadVariableOp)dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0`
dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       M
dense_2/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:a
dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/GatherV2GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/free:output:0(dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/GatherV2_1GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/axes:output:0*dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense_2/Tensordot/ProdProd#dense_2/Tensordot/GatherV2:output:0 dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense_2/Tensordot/Prod_1Prod%dense_2/Tensordot/GatherV2_1:output:0"dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/concatConcatV2dense_2/Tensordot/free:output:0dense_2/Tensordot/axes:output:0&dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense_2/Tensordot/stackPackdense_2/Tensordot/Prod:output:0!dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense_2/Tensordot/transpose	Transposeinputs!dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
dense_2/Tensordot/ReshapeReshapedense_2/Tensordot/transpose:y:0 dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense_2/Tensordot/MatMulMatMul"dense_2/Tensordot/Reshape:output:0(dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????d
dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?a
dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/concat_1ConcatV2#dense_2/Tensordot/GatherV2:output:0"dense_2/Tensordot/Const_2:output:0(dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense_2/TensordotReshape"dense_2/Tensordot/MatMul:product:0#dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_2/BiasAddBiasAdddense_2/Tensordot:output:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?o
dropout_2/IdentityIdentitydense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?m
activation_2/ReluReludropout_2/Identity:output:0*
T0*,
_output_shapes
:?????????d??
 dense_3/Tensordot/ReadVariableOpReadVariableOp)dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0`
dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       f
dense_3/Tensordot/ShapeShapeactivation_2/Relu:activations:0*
T0*
_output_shapes
:a
dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/GatherV2GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/free:output:0(dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/GatherV2_1GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/axes:output:0*dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense_3/Tensordot/ProdProd#dense_3/Tensordot/GatherV2:output:0 dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense_3/Tensordot/Prod_1Prod%dense_3/Tensordot/GatherV2_1:output:0"dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/concatConcatV2dense_3/Tensordot/free:output:0dense_3/Tensordot/axes:output:0&dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense_3/Tensordot/stackPackdense_3/Tensordot/Prod:output:0!dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense_3/Tensordot/transpose	Transposeactivation_2/Relu:activations:0!dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
dense_3/Tensordot/ReshapeReshapedense_3/Tensordot/transpose:y:0 dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense_3/Tensordot/MatMulMatMul"dense_3/Tensordot/Reshape:output:0(dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????c
dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:a
dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/concat_1ConcatV2#dense_3/Tensordot/GatherV2:output:0"dense_3/Tensordot/Const_2:output:0(dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense_3/TensordotReshape"dense_3/Tensordot/MatMul:product:0#dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_3/BiasAddBiasAdddense_3/Tensordot:output:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????dn
dropout_3/IdentityIdentitydense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????dl
activation_3/TanhTanhdropout_3/Identity:output:0*
T0*+
_output_shapes
:?????????dh
IdentityIdentityactivation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp^dense_2/BiasAdd/ReadVariableOp!^dense_2/Tensordot/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp!^dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2D
 dense_2/Tensordot/ReadVariableOp dense_2/Tensordot/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2D
 dense_3/Tensordot/ReadVariableOp dense_3/Tensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
d
H__inference_activation_1_layer_call_and_return_conditional_losses_517272

inputs
identityK
ReluReluinputs*
T0*,
_output_shapes
:?????????d?_
IdentityIdentityRelu:activations:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
-__inference_sequential_1_layer_call_fn_515081
dense_2_input
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalldense_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_515057s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
,
_output_shapes
:?????????d?
'
_user_specified_namedense_2_input
?
?
(__inference_dense_3_layer_call_fn_517349

inputs
unknown:	?
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_514930s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?>
?
F__inference_sequential_layer_call_and_return_conditional_losses_516899

inputs:
'dense_tensordot_readvariableop_resource:	?4
%dense_biasadd_readvariableop_resource:	?=
)dense_1_tensordot_readvariableop_resource:
??6
'dense_1_biasadd_readvariableop_resource:	?
identity??dense/BiasAdd/ReadVariableOp?dense/Tensordot/ReadVariableOp?dense_1/BiasAdd/ReadVariableOp? dense_1/Tensordot/ReadVariableOp?
dense/Tensordot/ReadVariableOpReadVariableOp'dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0^
dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:e
dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       K
dense/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:_
dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/GatherV2GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/free:output:0&dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/GatherV2_1GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/axes:output:0(dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:_
dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense/Tensordot/ProdProd!dense/Tensordot/GatherV2:output:0dense/Tensordot/Const:output:0*
T0*
_output_shapes
: a
dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense/Tensordot/Prod_1Prod#dense/Tensordot/GatherV2_1:output:0 dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ]
dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/concatConcatV2dense/Tensordot/free:output:0dense/Tensordot/axes:output:0$dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense/Tensordot/stackPackdense/Tensordot/Prod:output:0dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense/Tensordot/transpose	Transposeinputsdense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
dense/Tensordot/ReshapeReshapedense/Tensordot/transpose:y:0dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense/Tensordot/MatMulMatMul dense/Tensordot/Reshape:output:0&dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????b
dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?_
dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/concat_1ConcatV2!dense/Tensordot/GatherV2:output:0 dense/Tensordot/Const_2:output:0&dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense/TensordotReshape dense/Tensordot/MatMul:product:0!dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense/BiasAddBiasAdddense/Tensordot:output:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?f
activation/ReluReludense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0`
dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       d
dense_1/Tensordot/ShapeShapeactivation/Relu:activations:0*
T0*
_output_shapes
:a
dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/GatherV2GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/free:output:0(dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/GatherV2_1GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/axes:output:0*dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense_1/Tensordot/transpose	Transposeactivation/Relu:activations:0!dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????d
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?a
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?j
activation_1/ReluReludense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?s
IdentityIdentityactivation_1/Relu:activations:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/Tensordot/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2@
dense/Tensordot/ReadVariableOpdense/Tensordot/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
F
*__inference_dropout_3_layer_call_fn_517389

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_3_layer_call_and_return_conditional_losses_514980d
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
c
E__inference_dropout_2_layer_call_and_return_conditional_losses_517326

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:?????????d?"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
d
H__inference_activation_3_layer_call_and_return_conditional_losses_514948

inputs
identityJ
TanhTanhinputs*
T0*+
_output_shapes
:?????????dT
IdentityIdentityTanh:y:0*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
c
E__inference_dropout_3_layer_call_and_return_conditional_losses_517394

inputs

identity_1R
IdentityIdentityinputs*
T0*+
_output_shapes
:?????????d_

Identity_1IdentityIdentity:output:0*
T0*+
_output_shapes
:?????????d"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
F
*__inference_dropout_1_layer_call_fn_517253

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_514600e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
??
?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515916
inputs_0

inputs	
inputs_1
inputs_2	U
Bgeneral_gnn_mlp_sequential_dense_tensordot_readvariableop_resource:	?O
@general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource:	?X
Dgeneral_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource:
??Q
Bgeneral_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource:	?K
7general_gnn_general_conv_matmul_readvariableop_resource:
??G
8general_gnn_general_conv_biasadd_readvariableop_resource:	?\
Hgeneral_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource:
??U
Fgeneral_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource:	?[
Hgeneral_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource:	?T
Fgeneral_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource:
identity??/general_gnn/general_conv/BiasAdd/ReadVariableOp?.general_gnn/general_conv/MatMul/ReadVariableOp?7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp?9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp?9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp?;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp?=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp??general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp??general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?
9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpReadVariableOpBgeneral_gnn_mlp_sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0y
/general_gnn/mlp/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
/general_gnn/mlp/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       h
0general_gnn/mlp/sequential/dense/Tensordot/ShapeShapeinputs_0*
T0*
_output_shapes
:z
8general_gnn/mlp/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
3general_gnn/mlp/sequential/dense/Tensordot/GatherV2GatherV29general_gnn/mlp/sequential/dense/Tensordot/Shape:output:08general_gnn/mlp/sequential/dense/Tensordot/free:output:0Ageneral_gnn/mlp/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:|
:general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
5general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1GatherV29general_gnn/mlp/sequential/dense/Tensordot/Shape:output:08general_gnn/mlp/sequential/dense/Tensordot/axes:output:0Cgeneral_gnn/mlp/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:z
0general_gnn/mlp/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
/general_gnn/mlp/sequential/dense/Tensordot/ProdProd<general_gnn/mlp/sequential/dense/Tensordot/GatherV2:output:09general_gnn/mlp/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: |
2general_gnn/mlp/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
1general_gnn/mlp/sequential/dense/Tensordot/Prod_1Prod>general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1:output:0;general_gnn/mlp/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: x
6general_gnn/mlp/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
1general_gnn/mlp/sequential/dense/Tensordot/concatConcatV28general_gnn/mlp/sequential/dense/Tensordot/free:output:08general_gnn/mlp/sequential/dense/Tensordot/axes:output:0?general_gnn/mlp/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
0general_gnn/mlp/sequential/dense/Tensordot/stackPack8general_gnn/mlp/sequential/dense/Tensordot/Prod:output:0:general_gnn/mlp/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
4general_gnn/mlp/sequential/dense/Tensordot/transpose	Transposeinputs_0:general_gnn/mlp/sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
2general_gnn/mlp/sequential/dense/Tensordot/ReshapeReshape8general_gnn/mlp/sequential/dense/Tensordot/transpose:y:09general_gnn/mlp/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
1general_gnn/mlp/sequential/dense/Tensordot/MatMulMatMul;general_gnn/mlp/sequential/dense/Tensordot/Reshape:output:0Ageneral_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????}
2general_gnn/mlp/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?z
8general_gnn/mlp/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
3general_gnn/mlp/sequential/dense/Tensordot/concat_1ConcatV2<general_gnn/mlp/sequential/dense/Tensordot/GatherV2:output:0;general_gnn/mlp/sequential/dense/Tensordot/Const_2:output:0Ageneral_gnn/mlp/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
*general_gnn/mlp/sequential/dense/TensordotReshape;general_gnn/mlp/sequential/dense/Tensordot/MatMul:product:0<general_gnn/mlp/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpReadVariableOp@general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
(general_gnn/mlp/sequential/dense/BiasAddBiasAdd3general_gnn/mlp/sequential/dense/Tensordot:output:0?general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
*general_gnn/mlp/sequential/activation/ReluRelu1general_gnn/mlp/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpDgeneral_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0{
1general_gnn/mlp/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
1general_gnn/mlp/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
2general_gnn/mlp/sequential/dense_1/Tensordot/ShapeShape8general_gnn/mlp/sequential/activation/Relu:activations:0*
T0*
_output_shapes
:|
:general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
5general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2GatherV2;general_gnn/mlp/sequential/dense_1/Tensordot/Shape:output:0:general_gnn/mlp/sequential/dense_1/Tensordot/free:output:0Cgeneral_gnn/mlp/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:~
<general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
7general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1GatherV2;general_gnn/mlp/sequential/dense_1/Tensordot/Shape:output:0:general_gnn/mlp/sequential/dense_1/Tensordot/axes:output:0Egeneral_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:|
2general_gnn/mlp/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
1general_gnn/mlp/sequential/dense_1/Tensordot/ProdProd>general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2:output:0;general_gnn/mlp/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: ~
4general_gnn/mlp/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
3general_gnn/mlp/sequential/dense_1/Tensordot/Prod_1Prod@general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1:output:0=general_gnn/mlp/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: z
8general_gnn/mlp/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
3general_gnn/mlp/sequential/dense_1/Tensordot/concatConcatV2:general_gnn/mlp/sequential/dense_1/Tensordot/free:output:0:general_gnn/mlp/sequential/dense_1/Tensordot/axes:output:0Ageneral_gnn/mlp/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
2general_gnn/mlp/sequential/dense_1/Tensordot/stackPack:general_gnn/mlp/sequential/dense_1/Tensordot/Prod:output:0<general_gnn/mlp/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
6general_gnn/mlp/sequential/dense_1/Tensordot/transpose	Transpose8general_gnn/mlp/sequential/activation/Relu:activations:0<general_gnn/mlp/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
4general_gnn/mlp/sequential/dense_1/Tensordot/ReshapeReshape:general_gnn/mlp/sequential/dense_1/Tensordot/transpose:y:0;general_gnn/mlp/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
3general_gnn/mlp/sequential/dense_1/Tensordot/MatMulMatMul=general_gnn/mlp/sequential/dense_1/Tensordot/Reshape:output:0Cgeneral_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????
4general_gnn/mlp/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?|
:general_gnn/mlp/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
5general_gnn/mlp/sequential/dense_1/Tensordot/concat_1ConcatV2>general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2:output:0=general_gnn/mlp/sequential/dense_1/Tensordot/Const_2:output:0Cgeneral_gnn/mlp/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
,general_gnn/mlp/sequential/dense_1/TensordotReshape=general_gnn/mlp/sequential/dense_1/Tensordot/MatMul:product:0>general_gnn/mlp/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpBgeneral_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
*general_gnn/mlp/sequential/dense_1/BiasAddBiasAdd5general_gnn/mlp/sequential/dense_1/Tensordot:output:0Ageneral_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
,general_gnn/mlp/sequential/activation_1/ReluRelu3general_gnn/mlp/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
.general_gnn/general_conv/MatMul/ReadVariableOpReadVariableOp7general_gnn_general_conv_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
general_gnn/general_conv/MatMulBatchMatMulV2:general_gnn/mlp/sequential/activation_1/Relu:activations:06general_gnn/general_conv/MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
/general_gnn/general_conv/BiasAdd/ReadVariableOpReadVariableOp8general_gnn_general_conv_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
 general_gnn/general_conv/BiasAddBiasAdd(general_gnn/general_conv/MatMul:output:07general_gnn/general_conv/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
general_gnn/general_conv/ReluRelu)general_gnn/general_conv/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?y
general_gnn/general_conv/ShapeShape+general_gnn/general_conv/Relu:activations:0*
T0*
_output_shapes
:
,general_gnn/general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
??????????
.general_gnn/general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????x
.general_gnn/general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
&general_gnn/general_conv/strided_sliceStridedSlice'general_gnn/general_conv/Shape:output:05general_gnn/general_conv/strided_slice/stack:output:07general_gnn/general_conv/strided_slice/stack_1:output:07general_gnn/general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
.general_gnn/general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       ?
0general_gnn/general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
0general_gnn/general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
(general_gnn/general_conv/strided_slice_1StridedSliceinputs7general_gnn/general_conv/strided_slice_1/stack:output:09general_gnn/general_conv/strided_slice_1/stack_1:output:09general_gnn/general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
.general_gnn/general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        ?
0general_gnn/general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
0general_gnn/general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
(general_gnn/general_conv/strided_slice_2StridedSliceinputs7general_gnn/general_conv/strided_slice_2/stack:output:09general_gnn/general_conv/strided_slice_2/stack_1:output:09general_gnn/general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskq
&general_gnn/general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
!general_gnn/general_conv/GatherV2GatherV2+general_gnn/general_conv/Relu:activations:01general_gnn/general_conv/strided_slice_2:output:0/general_gnn/general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????|
'general_gnn/general_conv/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
"general_gnn/general_conv/transpose	Transpose*general_gnn/general_conv/GatherV2:output:00general_gnn/general_conv/transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
+general_gnn/general_conv/UnsortedSegmentSumUnsortedSegmentSum&general_gnn/general_conv/transpose:y:01general_gnn/general_conv/strided_slice_1:output:0/general_gnn/general_conv/strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????~
)general_gnn/general_conv/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$general_gnn/general_conv/transpose_1	Transpose4general_gnn/general_conv/UnsortedSegmentSum:output:02general_gnn/general_conv/transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?e
#general_gnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :?
general_gnn/concatenate/concatConcatV2(general_gnn/general_conv/transpose_1:y:0:general_gnn/mlp/sequential/activation_1/Relu:activations:0,general_gnn/concatenate/concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d??
?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOpHgeneral_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0
5general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
5general_gnn/mlp_1/sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
6general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ShapeShape'general_gnn/concatenate/concat:output:0*
T0*
_output_shapes
:?
>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2GatherV2?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/free:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
@general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
;general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1GatherV2?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axes:output:0Igeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
5general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ProdProdBgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:0?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
8general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
7general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod_1ProdDgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1:output:0Ageneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
7general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concatConcatV2>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/free:output:0>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axes:output:0Egeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_2/Tensordot/stackPack>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod:output:0@general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
:general_gnn/mlp_1/sequential_1/dense_2/Tensordot/transpose	Transpose'general_gnn/concatenate/concat:output:0@general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
8general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReshapeReshape>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/transpose:y:0?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
7general_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMulMatMulAgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/Reshape:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
8general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:??
>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1ConcatV2Bgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:0Ageneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_2:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
0general_gnn/mlp_1/sequential_1/dense_2/TensordotReshapeAgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMul:product:0Bgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOpFgeneral_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
.general_gnn/mlp_1/sequential_1/dense_2/BiasAddBiasAdd9general_gnn/mlp_1/sequential_1/dense_2/Tensordot:output:0Egeneral_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
0general_gnn/mlp_1/sequential_1/activation_2/ReluRelu7general_gnn/mlp_1/sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOpHgeneral_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0
5general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
5general_gnn/mlp_1/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
6general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ShapeShape>general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:?
>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2GatherV2?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/free:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
@general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
;general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1GatherV2?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axes:output:0Igeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
5general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ProdProdBgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:0?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
8general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
7general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod_1ProdDgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1:output:0Ageneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
7general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concatConcatV2>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/free:output:0>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axes:output:0Egeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_3/Tensordot/stackPack>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod:output:0@general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
:general_gnn/mlp_1/sequential_1/dense_3/Tensordot/transpose	Transpose>general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0@general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
8general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReshapeReshape>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/transpose:y:0?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
7general_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMulMatMulAgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/Reshape:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
8general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?
>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1ConcatV2Bgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:0Ageneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_2:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
0general_gnn/mlp_1/sequential_1/dense_3/TensordotReshapeAgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMul:product:0Bgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOpFgeneral_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
.general_gnn/mlp_1/sequential_1/dense_3/BiasAddBiasAdd9general_gnn/mlp_1/sequential_1/dense_3/Tensordot:output:0Egeneral_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
0general_gnn/mlp_1/sequential_1/activation_3/TanhTanh7general_gnn/mlp_1/sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????d?
IdentityIdentity4general_gnn/mlp_1/sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp0^general_gnn/general_conv/BiasAdd/ReadVariableOp/^general_gnn/general_conv/MatMul/ReadVariableOp8^general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp:^general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp:^general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp<^general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp>^general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp@^general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp>^general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp@^general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2b
/general_gnn/general_conv/BiasAdd/ReadVariableOp/general_gnn/general_conv/BiasAdd/ReadVariableOp2`
.general_gnn/general_conv/MatMul/ReadVariableOp.general_gnn/general_conv/MatMul/ReadVariableOp2r
7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp2v
9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp2v
9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp2z
;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp2~
=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp2?
?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2~
=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp2?
?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
+__inference_sequential_layer_call_fn_514701
dense_input
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalldense_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514677t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
+
_output_shapes
:?????????d
%
_user_specified_namedense_input
?
?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515544

inputs
inputs_1	
inputs_2
inputs_3	%
general_gnn_515522:	?!
general_gnn_515524:	?&
general_gnn_515526:
??!
general_gnn_515528:	?&
general_gnn_515530:
??!
general_gnn_515532:	?&
general_gnn_515534:
??!
general_gnn_515536:	?%
general_gnn_515538:	? 
general_gnn_515540:
identity??#general_gnn/StatefulPartitionedCall?
#general_gnn/StatefulPartitionedCallStatefulPartitionedCallinputsinputs_1inputs_2inputs_3general_gnn_515522general_gnn_515524general_gnn_515526general_gnn_515528general_gnn_515530general_gnn_515532general_gnn_515534general_gnn_515536general_gnn_515538general_gnn_515540*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_general_gnn_layer_call_and_return_conditional_losses_515430
IdentityIdentity,general_gnn/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????dl
NoOpNoOp$^general_gnn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2J
#general_gnn/StatefulPartitionedCall#general_gnn/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
a
E__inference_dropout_1_layer_call_and_return_conditional_losses_517262

inputs
identityS
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
-__inference_gnnca_simple_layer_call_fn_515595
inputs_0

inputs	
inputs_1
inputs_2	
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515488s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
H__inference_sequential_1_layer_call_and_return_conditional_losses_515057

inputs"
dense_2_515042:
??
dense_2_515044:	?!
dense_3_515049:	?
dense_3_515051:
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCallinputsdense_2_515042dense_2_515044*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_514880?
dropout_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_515011?
activation_2/PartitionedCallPartitionedCall"dropout_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_2_layer_call_and_return_conditional_losses_514898?
dense_3/StatefulPartitionedCallStatefulPartitionedCall%activation_2/PartitionedCall:output:0dense_3_515049dense_3_515051*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_514930?
dropout_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_3_layer_call_and_return_conditional_losses_514980?
activation_3/PartitionedCallPartitionedCall"dropout_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_3_layer_call_and_return_conditional_losses_514948x
IdentityIdentity%activation_3/PartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
__inference_steps_516075
inputs_0

inputs	
inputs_1
inputs_2		
steps 
while_input_5:	?
while_input_6:	?!
while_input_7:
??
while_input_8:	?!
while_input_9:
??
while_input_10:	?"
while_input_12:
??
while_input_13:	?!
while_input_14:	?
while_input_15:
identity??whileM
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :f
rangeRangerange/start:output:0stepsrange/delta:output:0*#
_output_shapes
:?????????H
subSubstepsrange/start:output:0*
T0*
_output_shapes
: T
floordivFloorDivsub:z:0range/delta:output:0*
T0*
_output_shapes
: O
modFloorModsub:z:0range/delta:output:0*
T0*
_output_shapes
: L

zeros_likeConst*
_output_shapes
: *
dtype0*
value	B : S
NotEqualNotEqualmod:z:0zeros_like:output:0*
T0*
_output_shapes
: J
CastCastNotEqual:z:0*

DstT0*

SrcT0
*
_output_shapes
: E
addAddV2floordiv:z:0Cast:y:0*
T0*
_output_shapes
: N
zeros_like_1Const*
_output_shapes
: *
dtype0*
value	B : S
MaximumMaximumadd:z:0zeros_like_1:output:0*
T0*
_output_shapes
: c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0range/start:output:0inputs_0stepswhile_input_5while_input_6while_input_7while_input_8while_input_9while_input_10inputswhile_input_12while_input_13while_input_14while_input_15range/delta:output:0*
T
2	*
_lower_using_switch_merge(*
_num_original_outputs*S
_output_shapesA
?: : : :d: : : : : : : :?????????: : : : : *,
_read_only_resource_inputs

	
*
_stateful_parallelism( *
bodyR
while_body_515936*
condR
while_cond_515935*R
output_shapesA
?: : : :d: : : : : : : :?????????: : : : : X
IdentityIdentitywhile:output:3^NoOp*
T0*"
_output_shapes
:dN
NoOpNoOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:d:?????????:?????????:: : : : : : : : : : : 2
whilewhile:L H
"
_output_shapes
:d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:=9

_output_shapes
: 

_user_specified_namesteps
?
?
-__inference_sequential_1_layer_call_fn_517005

inputs
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_514951s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
$__inference_mlp_layer_call_fn_516493

inputs
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_mlp_layer_call_and_return_conditional_losses_514793t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
I
-__inference_activation_2_layer_call_fn_517335

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_2_layer_call_and_return_conditional_losses_514898e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
G__inference_general_gnn_layer_call_and_return_conditional_losses_515430

inputs
inputs_1	
inputs_2
inputs_3	

mlp_515405:	?

mlp_515407:	?

mlp_515409:
??

mlp_515411:	?'
general_conv_515414:
??"
general_conv_515416:	? 
mlp_1_515420:
??
mlp_1_515422:	?
mlp_1_515424:	?
mlp_1_515426:
identity??$general_conv/StatefulPartitionedCall?mlp/StatefulPartitionedCall?mlp_1/StatefulPartitionedCall?
mlp/StatefulPartitionedCallStatefulPartitionedCallinputs
mlp_515405
mlp_515407
mlp_515409
mlp_515411*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_mlp_layer_call_and_return_conditional_losses_514793?
$general_conv/StatefulPartitionedCallStatefulPartitionedCall$mlp/StatefulPartitionedCall:output:0inputs_1inputs_2inputs_3general_conv_515414general_conv_515416*
Tin

2		*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_general_conv_layer_call_and_return_conditional_losses_515387?
concatenate/PartitionedCallPartitionedCall-general_conv/StatefulPartitionedCall:output:0$mlp/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_515293?
mlp_1/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0mlp_1_515420mlp_1_515422mlp_1_515424mlp_1_515426*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_mlp_1_layer_call_and_return_conditional_losses_515173y
IdentityIdentity&mlp_1/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp%^general_conv/StatefulPartitionedCall^mlp/StatefulPartitionedCall^mlp_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2L
$general_conv/StatefulPartitionedCall$general_conv/StatefulPartitionedCall2:
mlp/StatefulPartitionedCallmlp/StatefulPartitionedCall2>
mlp_1/StatefulPartitionedCallmlp_1/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
??
?

G__inference_general_gnn_layer_call_and_return_conditional_losses_516454
inputs_0

inputs	
inputs_1
inputs_2	I
6mlp_sequential_dense_tensordot_readvariableop_resource:	?C
4mlp_sequential_dense_biasadd_readvariableop_resource:	?L
8mlp_sequential_dense_1_tensordot_readvariableop_resource:
??E
6mlp_sequential_dense_1_biasadd_readvariableop_resource:	??
+general_conv_matmul_readvariableop_resource:
??;
,general_conv_biasadd_readvariableop_resource:	?P
<mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource:
??I
:mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource:	?O
<mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource:	?H
:mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource:
identity??#general_conv/BiasAdd/ReadVariableOp?"general_conv/MatMul/ReadVariableOp?+mlp/sequential/dense/BiasAdd/ReadVariableOp?-mlp/sequential/dense/Tensordot/ReadVariableOp?-mlp/sequential/dense_1/BiasAdd/ReadVariableOp?/mlp/sequential/dense_1/Tensordot/ReadVariableOp?1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp?3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp?3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?
-mlp/sequential/dense/Tensordot/ReadVariableOpReadVariableOp6mlp_sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0m
#mlp/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#mlp/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       \
$mlp/sequential/dense/Tensordot/ShapeShapeinputs_0*
T0*
_output_shapes
:n
,mlp/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'mlp/sequential/dense/Tensordot/GatherV2GatherV2-mlp/sequential/dense/Tensordot/Shape:output:0,mlp/sequential/dense/Tensordot/free:output:05mlp/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.mlp/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)mlp/sequential/dense/Tensordot/GatherV2_1GatherV2-mlp/sequential/dense/Tensordot/Shape:output:0,mlp/sequential/dense/Tensordot/axes:output:07mlp/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$mlp/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
#mlp/sequential/dense/Tensordot/ProdProd0mlp/sequential/dense/Tensordot/GatherV2:output:0-mlp/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&mlp/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
%mlp/sequential/dense/Tensordot/Prod_1Prod2mlp/sequential/dense/Tensordot/GatherV2_1:output:0/mlp/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*mlp/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%mlp/sequential/dense/Tensordot/concatConcatV2,mlp/sequential/dense/Tensordot/free:output:0,mlp/sequential/dense/Tensordot/axes:output:03mlp/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
$mlp/sequential/dense/Tensordot/stackPack,mlp/sequential/dense/Tensordot/Prod:output:0.mlp/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
(mlp/sequential/dense/Tensordot/transpose	Transposeinputs_0.mlp/sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
&mlp/sequential/dense/Tensordot/ReshapeReshape,mlp/sequential/dense/Tensordot/transpose:y:0-mlp/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
%mlp/sequential/dense/Tensordot/MatMulMatMul/mlp/sequential/dense/Tensordot/Reshape:output:05mlp/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????q
&mlp/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?n
,mlp/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'mlp/sequential/dense/Tensordot/concat_1ConcatV20mlp/sequential/dense/Tensordot/GatherV2:output:0/mlp/sequential/dense/Tensordot/Const_2:output:05mlp/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
mlp/sequential/dense/TensordotReshape/mlp/sequential/dense/Tensordot/MatMul:product:00mlp/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
+mlp/sequential/dense/BiasAdd/ReadVariableOpReadVariableOp4mlp_sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
mlp/sequential/dense/BiasAddBiasAdd'mlp/sequential/dense/Tensordot:output:03mlp/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
mlp/sequential/activation/ReluRelu%mlp/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
/mlp/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp8mlp_sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0o
%mlp/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:v
%mlp/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
&mlp/sequential/dense_1/Tensordot/ShapeShape,mlp/sequential/activation/Relu:activations:0*
T0*
_output_shapes
:p
.mlp/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)mlp/sequential/dense_1/Tensordot/GatherV2GatherV2/mlp/sequential/dense_1/Tensordot/Shape:output:0.mlp/sequential/dense_1/Tensordot/free:output:07mlp/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:r
0mlp/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
+mlp/sequential/dense_1/Tensordot/GatherV2_1GatherV2/mlp/sequential/dense_1/Tensordot/Shape:output:0.mlp/sequential/dense_1/Tensordot/axes:output:09mlp/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
&mlp/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
%mlp/sequential/dense_1/Tensordot/ProdProd2mlp/sequential/dense_1/Tensordot/GatherV2:output:0/mlp/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: r
(mlp/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
'mlp/sequential/dense_1/Tensordot/Prod_1Prod4mlp/sequential/dense_1/Tensordot/GatherV2_1:output:01mlp/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: n
,mlp/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'mlp/sequential/dense_1/Tensordot/concatConcatV2.mlp/sequential/dense_1/Tensordot/free:output:0.mlp/sequential/dense_1/Tensordot/axes:output:05mlp/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
&mlp/sequential/dense_1/Tensordot/stackPack.mlp/sequential/dense_1/Tensordot/Prod:output:00mlp/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
*mlp/sequential/dense_1/Tensordot/transpose	Transpose,mlp/sequential/activation/Relu:activations:00mlp/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
(mlp/sequential/dense_1/Tensordot/ReshapeReshape.mlp/sequential/dense_1/Tensordot/transpose:y:0/mlp/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
'mlp/sequential/dense_1/Tensordot/MatMulMatMul1mlp/sequential/dense_1/Tensordot/Reshape:output:07mlp/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
(mlp/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?p
.mlp/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)mlp/sequential/dense_1/Tensordot/concat_1ConcatV22mlp/sequential/dense_1/Tensordot/GatherV2:output:01mlp/sequential/dense_1/Tensordot/Const_2:output:07mlp/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
 mlp/sequential/dense_1/TensordotReshape1mlp/sequential/dense_1/Tensordot/MatMul:product:02mlp/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
-mlp/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp6mlp_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
mlp/sequential/dense_1/BiasAddBiasAdd)mlp/sequential/dense_1/Tensordot:output:05mlp/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
 mlp/sequential/activation_1/ReluRelu'mlp/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
"general_conv/MatMul/ReadVariableOpReadVariableOp+general_conv_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
general_conv/MatMulBatchMatMulV2.mlp/sequential/activation_1/Relu:activations:0*general_conv/MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
#general_conv/BiasAdd/ReadVariableOpReadVariableOp,general_conv_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
general_conv/BiasAddBiasAddgeneral_conv/MatMul:output:0+general_conv/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?o
general_conv/ReluRelugeneral_conv/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?a
general_conv/ShapeShapegeneral_conv/Relu:activations:0*
T0*
_output_shapes
:s
 general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????u
"general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????l
"general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
general_conv/strided_sliceStridedSlicegeneral_conv/Shape:output:0)general_conv/strided_slice/stack:output:0+general_conv/strided_slice/stack_1:output:0+general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_masks
"general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_1StridedSliceinputs+general_conv/strided_slice_1/stack:output:0-general_conv/strided_slice_1/stack_1:output:0-general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_masks
"general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        u
$general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_2StridedSliceinputs+general_conv/strided_slice_2/stack:output:0-general_conv/strided_slice_2/stack_1:output:0-general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maske
general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
general_conv/GatherV2GatherV2general_conv/Relu:activations:0%general_conv/strided_slice_2:output:0#general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????p
general_conv/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
general_conv/transpose	Transposegeneral_conv/GatherV2:output:0$general_conv/transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
general_conv/UnsortedSegmentSumUnsortedSegmentSumgeneral_conv/transpose:y:0%general_conv/strided_slice_1:output:0#general_conv/strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????r
general_conv/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
general_conv/transpose_1	Transpose(general_conv/UnsortedSegmentSum:output:0&general_conv/transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?Y
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :?
concatenate/concatConcatV2general_conv/transpose_1:y:0.mlp/sequential/activation_1/Relu:activations:0 concatenate/concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d??
3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOp<mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0s
)mlp_1/sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:z
)mlp_1/sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       u
*mlp_1/sequential_1/dense_2/Tensordot/ShapeShapeconcatenate/concat:output:0*
T0*
_output_shapes
:t
2mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_2/Tensordot/GatherV2GatherV23mlp_1/sequential_1/dense_2/Tensordot/Shape:output:02mlp_1/sequential_1/dense_2/Tensordot/free:output:0;mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:v
4mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1GatherV23mlp_1/sequential_1/dense_2/Tensordot/Shape:output:02mlp_1/sequential_1/dense_2/Tensordot/axes:output:0=mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:t
*mlp_1/sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
)mlp_1/sequential_1/dense_2/Tensordot/ProdProd6mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:03mlp_1/sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: v
,mlp_1/sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
+mlp_1/sequential_1/dense_2/Tensordot/Prod_1Prod8mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1:output:05mlp_1/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: r
0mlp_1/sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
+mlp_1/sequential_1/dense_2/Tensordot/concatConcatV22mlp_1/sequential_1/dense_2/Tensordot/free:output:02mlp_1/sequential_1/dense_2/Tensordot/axes:output:09mlp_1/sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
*mlp_1/sequential_1/dense_2/Tensordot/stackPack2mlp_1/sequential_1/dense_2/Tensordot/Prod:output:04mlp_1/sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
.mlp_1/sequential_1/dense_2/Tensordot/transpose	Transposeconcatenate/concat:output:04mlp_1/sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
,mlp_1/sequential_1/dense_2/Tensordot/ReshapeReshape2mlp_1/sequential_1/dense_2/Tensordot/transpose:y:03mlp_1/sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
+mlp_1/sequential_1/dense_2/Tensordot/MatMulMatMul5mlp_1/sequential_1/dense_2/Tensordot/Reshape:output:0;mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????w
,mlp_1/sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?t
2mlp_1/sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_2/Tensordot/concat_1ConcatV26mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:05mlp_1/sequential_1/dense_2/Tensordot/Const_2:output:0;mlp_1/sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
$mlp_1/sequential_1/dense_2/TensordotReshape5mlp_1/sequential_1/dense_2/Tensordot/MatMul:product:06mlp_1/sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOp:mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
"mlp_1/sequential_1/dense_2/BiasAddBiasAdd-mlp_1/sequential_1/dense_2/Tensordot:output:09mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
$mlp_1/sequential_1/activation_2/ReluRelu+mlp_1/sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp<mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0s
)mlp_1/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:z
)mlp_1/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
*mlp_1/sequential_1/dense_3/Tensordot/ShapeShape2mlp_1/sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:t
2mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_3/Tensordot/GatherV2GatherV23mlp_1/sequential_1/dense_3/Tensordot/Shape:output:02mlp_1/sequential_1/dense_3/Tensordot/free:output:0;mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:v
4mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1GatherV23mlp_1/sequential_1/dense_3/Tensordot/Shape:output:02mlp_1/sequential_1/dense_3/Tensordot/axes:output:0=mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:t
*mlp_1/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
)mlp_1/sequential_1/dense_3/Tensordot/ProdProd6mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:03mlp_1/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: v
,mlp_1/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
+mlp_1/sequential_1/dense_3/Tensordot/Prod_1Prod8mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1:output:05mlp_1/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: r
0mlp_1/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
+mlp_1/sequential_1/dense_3/Tensordot/concatConcatV22mlp_1/sequential_1/dense_3/Tensordot/free:output:02mlp_1/sequential_1/dense_3/Tensordot/axes:output:09mlp_1/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
*mlp_1/sequential_1/dense_3/Tensordot/stackPack2mlp_1/sequential_1/dense_3/Tensordot/Prod:output:04mlp_1/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
.mlp_1/sequential_1/dense_3/Tensordot/transpose	Transpose2mlp_1/sequential_1/activation_2/Relu:activations:04mlp_1/sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
,mlp_1/sequential_1/dense_3/Tensordot/ReshapeReshape2mlp_1/sequential_1/dense_3/Tensordot/transpose:y:03mlp_1/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
+mlp_1/sequential_1/dense_3/Tensordot/MatMulMatMul5mlp_1/sequential_1/dense_3/Tensordot/Reshape:output:0;mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????v
,mlp_1/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:t
2mlp_1/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_3/Tensordot/concat_1ConcatV26mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:05mlp_1/sequential_1/dense_3/Tensordot/Const_2:output:0;mlp_1/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
$mlp_1/sequential_1/dense_3/TensordotReshape5mlp_1/sequential_1/dense_3/Tensordot/MatMul:product:06mlp_1/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp:mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"mlp_1/sequential_1/dense_3/BiasAddBiasAdd-mlp_1/sequential_1/dense_3/Tensordot:output:09mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
$mlp_1/sequential_1/activation_3/TanhTanh+mlp_1/sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????d{
IdentityIdentity(mlp_1/sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp$^general_conv/BiasAdd/ReadVariableOp#^general_conv/MatMul/ReadVariableOp,^mlp/sequential/dense/BiasAdd/ReadVariableOp.^mlp/sequential/dense/Tensordot/ReadVariableOp.^mlp/sequential/dense_1/BiasAdd/ReadVariableOp0^mlp/sequential/dense_1/Tensordot/ReadVariableOp2^mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp4^mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2^mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp4^mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2J
#general_conv/BiasAdd/ReadVariableOp#general_conv/BiasAdd/ReadVariableOp2H
"general_conv/MatMul/ReadVariableOp"general_conv/MatMul/ReadVariableOp2Z
+mlp/sequential/dense/BiasAdd/ReadVariableOp+mlp/sequential/dense/BiasAdd/ReadVariableOp2^
-mlp/sequential/dense/Tensordot/ReadVariableOp-mlp/sequential/dense/Tensordot/ReadVariableOp2^
-mlp/sequential/dense_1/BiasAdd/ReadVariableOp-mlp/sequential/dense_1/BiasAdd/ReadVariableOp2b
/mlp/sequential/dense_1/Tensordot/ReadVariableOp/mlp/sequential/dense_1/Tensordot/ReadVariableOp2f
1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp2j
3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2f
1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp2j
3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
b
F__inference_activation_layer_call_and_return_conditional_losses_514518

inputs
identityK
ReluReluinputs*
T0*,
_output_shapes
:?????????d?_
IdentityIdentityRelu:activations:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
c
E__inference_dropout_2_layer_call_and_return_conditional_losses_514891

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:?????????d?"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?	
?
A__inference_mlp_1_layer_call_and_return_conditional_losses_515223
input_1'
sequential_1_515213:
??"
sequential_1_515215:	?&
sequential_1_515217:	?!
sequential_1_515219:
identity??$sequential_1/StatefulPartitionedCall?
$sequential_1/StatefulPartitionedCallStatefulPartitionedCallinput_1sequential_1_515213sequential_1_515215sequential_1_515217sequential_1_515219*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_515057?
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????dm
NoOpNoOp%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:U Q
,
_output_shapes
:?????????d?
!
_user_specified_name	input_1
?
?
C__inference_dense_2_layer_call_and_return_conditional_losses_514880

inputs5
!tensordot_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp|
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:?????????d?z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
a
C__inference_dropout_layer_call_and_return_conditional_losses_517190

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:?????????d?"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
(__inference_dense_1_layer_call_fn_517213

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_514550t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
d
H__inference_activation_3_layer_call_and_return_conditional_losses_517408

inputs
identityJ
TanhTanhinputs*
T0*+
_output_shapes
:?????????dT
IdentityIdentityTanh:y:0*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
G
+__inference_activation_layer_call_fn_517199

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_activation_layer_call_and_return_conditional_losses_514518e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
&__inference_mlp_1_layer_call_fn_516624

inputs
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_mlp_1_layer_call_and_return_conditional_losses_515134s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
-__inference_sequential_1_layer_call_fn_514962
dense_2_input
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalldense_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_514951s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
,
_output_shapes
:?????????d?
'
_user_specified_namedense_2_input
?
?
&__inference_dense_layer_call_fn_517145

inputs
unknown:	?
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_514500t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????d: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
d
H__inference_activation_2_layer_call_and_return_conditional_losses_517340

inputs
identityK
ReluReluinputs*
T0*,
_output_shapes
:?????????d?_
IdentityIdentityRelu:activations:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
a
E__inference_dropout_3_layer_call_and_return_conditional_losses_517398

inputs
identityR
IdentityIdentityinputs*
T0*+
_output_shapes
:?????????d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
c
E__inference_dropout_1_layer_call_and_return_conditional_losses_517258

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:?????????d?"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
Ύ
?
!__inference__wrapped_model_514463

args_0
args_0_1	
args_0_2
args_0_3	b
Ognnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resource:	?\
Mgnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource:	?e
Qgnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource:
??^
Ognnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource:	?X
Dgnnca_simple_general_gnn_general_conv_matmul_readvariableop_resource:
??T
Egnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resource:	?i
Ugnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource:
??b
Sgnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource:	?h
Ugnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource:	?a
Sgnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource:
identity??<gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp?;gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp?Dgnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp?Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp?Fgnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp?Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp?Jgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp?Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?Jgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp?Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?
Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpReadVariableOpOgnnca_simple_general_gnn_mlp_sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0?
<gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
<gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       s
=gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ShapeShapeargs_0*
T0*
_output_shapes
:?
Egnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
@gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2GatherV2Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Shape:output:0Egnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/free:output:0Ngnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
Ggnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Bgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1GatherV2Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Shape:output:0Egnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/axes:output:0Pgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
=gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
<gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ProdProdIgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2:output:0Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
?gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
>gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Prod_1ProdKgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1:output:0Hgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ?
Cgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
>gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concatConcatV2Egnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/free:output:0Egnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/axes:output:0Lgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
=gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/stackPackEgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Prod:output:0Ggnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
Agnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/transpose	Transposeargs_0Ggnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
?gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReshapeReshapeEgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/transpose:y:0Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
>gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/MatMulMatMulHgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Reshape:output:0Ngnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
?gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:??
Egnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
@gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat_1ConcatV2Ignnca_simple/general_gnn/mlp/sequential/dense/Tensordot/GatherV2:output:0Hgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/Const_2:output:0Ngnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
7gnnca_simple/general_gnn/mlp/sequential/dense/TensordotReshapeHgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/MatMul:product:0Ignnca_simple/general_gnn/mlp/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
Dgnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpReadVariableOpMgnnca_simple_general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
5gnnca_simple/general_gnn/mlp/sequential/dense/BiasAddBiasAdd@gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot:output:0Lgnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
8gnnca_simple/general_gnn/mlp/sequential/dropout/IdentityIdentity>gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
7gnnca_simple/general_gnn/mlp/sequential/activation/ReluReluAgnnca_simple/general_gnn/mlp/sequential/dropout/Identity:output:0*
T0*,
_output_shapes
:?????????d??
Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpQgnnca_simple_general_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
>gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
>gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
?gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ShapeShapeEgnnca_simple/general_gnn/mlp/sequential/activation/Relu:activations:0*
T0*
_output_shapes
:?
Ggnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Bgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2GatherV2Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Shape:output:0Ggnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/free:output:0Pgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
Ignnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Dgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1GatherV2Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Shape:output:0Ggnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/axes:output:0Rgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
?gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
>gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ProdProdKgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2:output:0Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
Agnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
@gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Prod_1ProdMgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1:output:0Jgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ?
Egnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
@gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concatConcatV2Ggnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/free:output:0Ggnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/axes:output:0Ngnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
?gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/stackPackGgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Prod:output:0Ignnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
Cgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/transpose	TransposeEgnnca_simple/general_gnn/mlp/sequential/activation/Relu:activations:0Ignnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Agnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReshapeReshapeGgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/transpose:y:0Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
@gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/MatMulMatMulJgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Reshape:output:0Pgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
Agnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:??
Ggnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Bgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat_1ConcatV2Kgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2:output:0Jgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/Const_2:output:0Pgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
9gnnca_simple/general_gnn/mlp/sequential/dense_1/TensordotReshapeJgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/MatMul:product:0Kgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
Fgnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpOgnnca_simple_general_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
7gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAddBiasAddBgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot:output:0Ngnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
:gnnca_simple/general_gnn/mlp/sequential/dropout_1/IdentityIdentity@gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
9gnnca_simple/general_gnn/mlp/sequential/activation_1/ReluReluCgnnca_simple/general_gnn/mlp/sequential/dropout_1/Identity:output:0*
T0*,
_output_shapes
:?????????d??
;gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOpReadVariableOpDgnnca_simple_general_gnn_general_conv_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
,gnnca_simple/general_gnn/general_conv/MatMulBatchMatMulV2Ggnnca_simple/general_gnn/mlp/sequential/activation_1/Relu:activations:0Cgnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
<gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOpReadVariableOpEgnnca_simple_general_gnn_general_conv_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
-gnnca_simple/general_gnn/general_conv/BiasAddBiasAdd5gnnca_simple/general_gnn/general_conv/MatMul:output:0Dgnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
8gnnca_simple/general_gnn/general_conv/dropout_4/IdentityIdentity6gnnca_simple/general_gnn/general_conv/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
*gnnca_simple/general_gnn/general_conv/ReluReluAgnnca_simple/general_gnn/general_conv/dropout_4/Identity:output:0*
T0*,
_output_shapes
:?????????d??
+gnnca_simple/general_gnn/general_conv/ShapeShape8gnnca_simple/general_gnn/general_conv/Relu:activations:0*
T0*
_output_shapes
:?
9gnnca_simple/general_gnn/general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
??????????
;gnnca_simple/general_gnn/general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
??????????
;gnnca_simple/general_gnn/general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
3gnnca_simple/general_gnn/general_conv/strided_sliceStridedSlice4gnnca_simple/general_gnn/general_conv/Shape:output:0Bgnnca_simple/general_gnn/general_conv/strided_slice/stack:output:0Dgnnca_simple/general_gnn/general_conv/strided_slice/stack_1:output:0Dgnnca_simple/general_gnn/general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask?
;gnnca_simple/general_gnn/general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       ?
=gnnca_simple/general_gnn/general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
=gnnca_simple/general_gnn/general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
5gnnca_simple/general_gnn/general_conv/strided_slice_1StridedSliceargs_0_1Dgnnca_simple/general_gnn/general_conv/strided_slice_1/stack:output:0Fgnnca_simple/general_gnn/general_conv/strided_slice_1/stack_1:output:0Fgnnca_simple/general_gnn/general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask?
;gnnca_simple/general_gnn/general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        ?
=gnnca_simple/general_gnn/general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
=gnnca_simple/general_gnn/general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
5gnnca_simple/general_gnn/general_conv/strided_slice_2StridedSliceargs_0_1Dgnnca_simple/general_gnn/general_conv/strided_slice_2/stack:output:0Fgnnca_simple/general_gnn/general_conv/strided_slice_2/stack_1:output:0Fgnnca_simple/general_gnn/general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask~
3gnnca_simple/general_gnn/general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
.gnnca_simple/general_gnn/general_conv/GatherV2GatherV28gnnca_simple/general_gnn/general_conv/Relu:activations:0>gnnca_simple/general_gnn/general_conv/strided_slice_2:output:0<gnnca_simple/general_gnn/general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:????????????????????
4gnnca_simple/general_gnn/general_conv/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
/gnnca_simple/general_gnn/general_conv/transpose	Transpose7gnnca_simple/general_gnn/general_conv/GatherV2:output:0=gnnca_simple/general_gnn/general_conv/transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
8gnnca_simple/general_gnn/general_conv/UnsortedSegmentSumUnsortedSegmentSum3gnnca_simple/general_gnn/general_conv/transpose:y:0>gnnca_simple/general_gnn/general_conv/strided_slice_1:output:0<gnnca_simple/general_gnn/general_conv/strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d???????????
6gnnca_simple/general_gnn/general_conv/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
1gnnca_simple/general_gnn/general_conv/transpose_1	TransposeAgnnca_simple/general_gnn/general_conv/UnsortedSegmentSum:output:0?gnnca_simple/general_gnn/general_conv/transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?r
0gnnca_simple/general_gnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :?
+gnnca_simple/general_gnn/concatenate/concatConcatV25gnnca_simple/general_gnn/general_conv/transpose_1:y:0Ggnnca_simple/general_gnn/mlp/sequential/activation_1/Relu:activations:09gnnca_simple/general_gnn/concatenate/concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d??
Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOpUgnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
Bgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
Bgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
Cgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ShapeShape4gnnca_simple/general_gnn/concatenate/concat:output:0*
T0*
_output_shapes
:?
Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Fgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2GatherV2Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Shape:output:0Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/free:output:0Tgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
Mgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Hgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1GatherV2Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Shape:output:0Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axes:output:0Vgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
Cgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
Bgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ProdProdOgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:0Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
Egnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
Dgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod_1ProdQgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1:output:0Ngnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ?
Ignnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Dgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concatConcatV2Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/free:output:0Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axes:output:0Rgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
Cgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/stackPackKgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod:output:0Mgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
Ggnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/transpose	Transpose4gnnca_simple/general_gnn/concatenate/concat:output:0Mgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Egnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReshapeReshapeKgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/transpose:y:0Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Dgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMulMatMulNgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Reshape:output:0Tgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
Egnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:??
Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Fgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1ConcatV2Ognnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:0Ngnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_2:output:0Tgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
=gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/TensordotReshapeNgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMul:product:0Ognnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
Jgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOpSgnnca_simple_general_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
;gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAddBiasAddFgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot:output:0Rgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
>gnnca_simple/general_gnn/mlp_1/sequential_1/dropout_2/IdentityIdentityDgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
=gnnca_simple/general_gnn/mlp_1/sequential_1/activation_2/ReluReluGgnnca_simple/general_gnn/mlp_1/sequential_1/dropout_2/Identity:output:0*
T0*,
_output_shapes
:?????????d??
Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOpUgnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0?
Bgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
Bgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
Cgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ShapeShapeKgnnca_simple/general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:?
Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Fgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2GatherV2Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Shape:output:0Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/free:output:0Tgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
Mgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Hgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1GatherV2Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Shape:output:0Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axes:output:0Vgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
Cgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
Bgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ProdProdOgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:0Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
Egnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
Dgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod_1ProdQgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1:output:0Ngnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ?
Ignnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Dgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concatConcatV2Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/free:output:0Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axes:output:0Rgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
Cgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/stackPackKgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod:output:0Mgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
Ggnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/transpose	TransposeKgnnca_simple/general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0Mgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Egnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReshapeReshapeKgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/transpose:y:0Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Dgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMulMatMulNgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Reshape:output:0Tgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
Egnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?
Kgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Fgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1ConcatV2Ognnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:0Ngnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_2:output:0Tgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
=gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/TensordotReshapeNgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMul:product:0Ognnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
Jgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOpSgnnca_simple_general_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
;gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAddBiasAddFgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot:output:0Rgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
>gnnca_simple/general_gnn/mlp_1/sequential_1/dropout_3/IdentityIdentityDgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????d?
=gnnca_simple/general_gnn/mlp_1/sequential_1/activation_3/TanhTanhGgnnca_simple/general_gnn/mlp_1/sequential_1/dropout_3/Identity:output:0*
T0*+
_output_shapes
:?????????d?
IdentityIdentityAgnnca_simple/general_gnn/mlp_1/sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp=^gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp<^gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOpE^gnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpG^gnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpG^gnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpI^gnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpK^gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpM^gnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpK^gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpM^gnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2|
<gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp<gnnca_simple/general_gnn/general_conv/BiasAdd/ReadVariableOp2z
;gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp;gnnca_simple/general_gnn/general_conv/MatMul/ReadVariableOp2?
Dgnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpDgnnca_simple/general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp2?
Fgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpFgnnca_simple/general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp2?
Fgnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpFgnnca_simple/general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp2?
Hgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpHgnnca_simple/general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp2?
Jgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpJgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp2?
Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpLgnnca_simple/general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2?
Jgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpJgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp2?
Lgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpLgnnca_simple/general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameargs_0:OK
'
_output_shapes
:?????????
 
_user_specified_nameargs_0:KG
#
_output_shapes
:?????????
 
_user_specified_nameargs_0:B>

_output_shapes
:
 
_user_specified_nameargs_0
?	
?
?__inference_mlp_layer_call_and_return_conditional_losses_514843
input_1$
sequential_514833:	? 
sequential_514835:	?%
sequential_514837:
?? 
sequential_514839:	?
identity??"sequential/StatefulPartitionedCall?
"sequential/StatefulPartitionedCallStatefulPartitionedCallinput_1sequential_514833sequential_514835sequential_514837sequential_514839*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514677
IdentityIdentity+sequential/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?k
NoOpNoOp#^sequential/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall:T P
+
_output_shapes
:?????????d
!
_user_specified_name	input_1
?
?
C__inference_dense_1_layer_call_and_return_conditional_losses_514550

inputs5
!tensordot_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp|
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:?????????d?z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
d
H__inference_activation_2_layer_call_and_return_conditional_losses_514898

inputs
identityK
ReluReluinputs*
T0*,
_output_shapes
:?????????d?_
IdentityIdentityRelu:activations:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
A__inference_dense_layer_call_and_return_conditional_losses_517175

inputs4
!tensordot_readvariableop_resource:	?.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:y
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:?????????d?z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????d: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
H__inference_sequential_1_layer_call_and_return_conditional_losses_514951

inputs"
dense_2_514881:
??
dense_2_514883:	?!
dense_3_514931:	?
dense_3_514933:
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCallinputsdense_2_514881dense_2_514883*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_514880?
dropout_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_514891?
activation_2/PartitionedCallPartitionedCall"dropout_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_2_layer_call_and_return_conditional_losses_514898?
dense_3/StatefulPartitionedCallStatefulPartitionedCall%activation_2/PartitionedCall:output:0dense_3_514931dense_3_514933*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_514930?
dropout_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_3_layer_call_and_return_conditional_losses_514941?
activation_3/PartitionedCallPartitionedCall"dropout_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_3_layer_call_and_return_conditional_losses_514948x
IdentityIdentity%activation_3/PartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
$__inference_mlp_layer_call_fn_514765
input_1
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_mlp_layer_call_and_return_conditional_losses_514754t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
+
_output_shapes
:?????????d
!
_user_specified_name	input_1
??
?
H__inference_sequential_1_layer_call_and_return_conditional_losses_517136

inputs=
)dense_2_tensordot_readvariableop_resource:
??6
'dense_2_biasadd_readvariableop_resource:	?<
)dense_3_tensordot_readvariableop_resource:	?5
'dense_3_biasadd_readvariableop_resource:
identity??dense_2/BiasAdd/ReadVariableOp? dense_2/Tensordot/ReadVariableOp?dense_3/BiasAdd/ReadVariableOp? dense_3/Tensordot/ReadVariableOp?
 dense_2/Tensordot/ReadVariableOpReadVariableOp)dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0`
dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       M
dense_2/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:a
dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/GatherV2GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/free:output:0(dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/GatherV2_1GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/axes:output:0*dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense_2/Tensordot/ProdProd#dense_2/Tensordot/GatherV2:output:0 dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense_2/Tensordot/Prod_1Prod%dense_2/Tensordot/GatherV2_1:output:0"dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/concatConcatV2dense_2/Tensordot/free:output:0dense_2/Tensordot/axes:output:0&dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense_2/Tensordot/stackPackdense_2/Tensordot/Prod:output:0!dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense_2/Tensordot/transpose	Transposeinputs!dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
dense_2/Tensordot/ReshapeReshapedense_2/Tensordot/transpose:y:0 dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense_2/Tensordot/MatMulMatMul"dense_2/Tensordot/Reshape:output:0(dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????d
dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?a
dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_2/Tensordot/concat_1ConcatV2#dense_2/Tensordot/GatherV2:output:0"dense_2/Tensordot/Const_2:output:0(dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense_2/TensordotReshape"dense_2/Tensordot/MatMul:product:0#dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_2/BiasAddBiasAdddense_2/Tensordot:output:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?j
activation_2/ReluReludense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
 dense_3/Tensordot/ReadVariableOpReadVariableOp)dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0`
dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       f
dense_3/Tensordot/ShapeShapeactivation_2/Relu:activations:0*
T0*
_output_shapes
:a
dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/GatherV2GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/free:output:0(dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/GatherV2_1GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/axes:output:0*dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense_3/Tensordot/ProdProd#dense_3/Tensordot/GatherV2:output:0 dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense_3/Tensordot/Prod_1Prod%dense_3/Tensordot/GatherV2_1:output:0"dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/concatConcatV2dense_3/Tensordot/free:output:0dense_3/Tensordot/axes:output:0&dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense_3/Tensordot/stackPackdense_3/Tensordot/Prod:output:0!dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense_3/Tensordot/transpose	Transposeactivation_2/Relu:activations:0!dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
dense_3/Tensordot/ReshapeReshapedense_3/Tensordot/transpose:y:0 dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense_3/Tensordot/MatMulMatMul"dense_3/Tensordot/Reshape:output:0(dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????c
dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:a
dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_3/Tensordot/concat_1ConcatV2#dense_3/Tensordot/GatherV2:output:0"dense_3/Tensordot/Const_2:output:0(dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense_3/TensordotReshape"dense_3/Tensordot/MatMul:product:0#dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_3/BiasAddBiasAdddense_3/Tensordot:output:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????di
activation_3/TanhTanhdense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????dh
IdentityIdentityactivation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp^dense_2/BiasAdd/ReadVariableOp!^dense_2/Tensordot/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp!^dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2D
 dense_2/Tensordot/ReadVariableOp dense_2/Tensordot/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2D
 dense_3/Tensordot/ReadVariableOp dense_3/Tensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
b
F__inference_activation_layer_call_and_return_conditional_losses_517204

inputs
identityK
ReluReluinputs*
T0*,
_output_shapes
:?????????d?_
IdentityIdentityRelu:activations:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?	
?
A__inference_mlp_1_layer_call_and_return_conditional_losses_515210
input_1'
sequential_1_515200:
??"
sequential_1_515202:	?&
sequential_1_515204:	?!
sequential_1_515206:
identity??$sequential_1/StatefulPartitionedCall?
$sequential_1/StatefulPartitionedCallStatefulPartitionedCallinput_1sequential_1_515200sequential_1_515202sequential_1_515204sequential_1_515206*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_514951?
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????dm
NoOpNoOp%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:U Q
,
_output_shapes
:?????????d?
!
_user_specified_name	input_1
?
D
(__inference_dropout_layer_call_fn_517185

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_514631e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
H__inference_sequential_1_layer_call_and_return_conditional_losses_515099
dense_2_input"
dense_2_515084:
??
dense_2_515086:	?!
dense_3_515091:	?
dense_3_515093:
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCalldense_2_inputdense_2_515084dense_2_515086*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_514880?
dropout_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_514891?
activation_2/PartitionedCallPartitionedCall"dropout_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_2_layer_call_and_return_conditional_losses_514898?
dense_3/StatefulPartitionedCallStatefulPartitionedCall%activation_2/PartitionedCall:output:0dense_3_515091dense_3_515093*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_514930?
dropout_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_3_layer_call_and_return_conditional_losses_514941?
activation_3/PartitionedCallPartitionedCall"dropout_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_3_layer_call_and_return_conditional_losses_514948x
IdentityIdentity%activation_3/PartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:[ W
,
_output_shapes
:?????????d?
'
_user_specified_namedense_2_input
?
?
$__inference_signature_wrapper_516105

args_0
args_0_1	
args_0_2
args_0_3	
unknown:	?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallargs_0args_0_1args_0_2args_0_3unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2		*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8? **
f%R#
!__inference__wrapped_model_514463s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameargs_0:QM
'
_output_shapes
:?????????
"
_user_specified_name
args_0_1:MI
#
_output_shapes
:?????????
"
_user_specified_name
args_0_2:D@

_output_shapes
:
"
_user_specified_name
args_0_3
?	
?
?__inference_mlp_layer_call_and_return_conditional_losses_514830
input_1$
sequential_514820:	? 
sequential_514822:	?%
sequential_514824:
?? 
sequential_514826:	?
identity??"sequential/StatefulPartitionedCall?
"sequential/StatefulPartitionedCallStatefulPartitionedCallinput_1sequential_514820sequential_514822sequential_514824sequential_514826*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_514571
IdentityIdentity+sequential/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d?k
NoOpNoOp#^sequential/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall:T P
+
_output_shapes
:?????????d
!
_user_specified_name	input_1
?"
?
H__inference_general_conv_layer_call_and_return_conditional_losses_516958
inputs_0

inputs	
inputs_1
inputs_2	2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0w
MatMulBatchMatMulV2inputs_0MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0z
BiasAddBiasAddMatMul:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?g
dropout_4/IdentityIdentityBiasAdd:output:0*
T0*,
_output_shapes
:?????????d?`
ReluReludropout_4/Identity:output:0*
T0*,
_output_shapes
:?????????d?G
ShapeShapeRelu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputsstrided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputsstrided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Relu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
	transpose	TransposeGatherV2:output:0transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
UnsortedSegmentSumUnsortedSegmentSumtranspose:y:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????e
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
transpose_1	TransposeUnsortedSegmentSum:output:0transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:?????????d?w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*W
_input_shapesF
D:?????????d?:?????????:?????????:: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:V R
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
d
H__inference_activation_1_layer_call_and_return_conditional_losses_514568

inputs
identityK
ReluReluinputs*
T0*,
_output_shapes
:?????????d?_
IdentityIdentityRelu:activations:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
F__inference_sequential_layer_call_and_return_conditional_losses_514571

inputs
dense_514501:	?
dense_514503:	?"
dense_1_514551:
??
dense_1_514553:	?
identity??dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCallinputsdense_514501dense_514503*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_514500?
dropout/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_514511?
activation/PartitionedCallPartitionedCall dropout/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_activation_layer_call_and_return_conditional_losses_514518?
dense_1/StatefulPartitionedCallStatefulPartitionedCall#activation/PartitionedCall:output:0dense_1_514551dense_1_514553*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_514550?
dropout_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_514561?
activation_1/PartitionedCallPartitionedCall"dropout_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_1_layer_call_and_return_conditional_losses_514568y
IdentityIdentity%activation_1/PartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
??
?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515772
inputs_0

inputs	
inputs_1
inputs_2	U
Bgeneral_gnn_mlp_sequential_dense_tensordot_readvariableop_resource:	?O
@general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource:	?X
Dgeneral_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource:
??Q
Bgeneral_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource:	?K
7general_gnn_general_conv_matmul_readvariableop_resource:
??G
8general_gnn_general_conv_biasadd_readvariableop_resource:	?\
Hgeneral_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource:
??U
Fgeneral_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource:	?[
Hgeneral_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource:	?T
Fgeneral_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource:
identity??/general_gnn/general_conv/BiasAdd/ReadVariableOp?.general_gnn/general_conv/MatMul/ReadVariableOp?7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp?9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp?9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp?;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp?=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp??general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp??general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?
9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOpReadVariableOpBgeneral_gnn_mlp_sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0y
/general_gnn/mlp/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
/general_gnn/mlp/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       h
0general_gnn/mlp/sequential/dense/Tensordot/ShapeShapeinputs_0*
T0*
_output_shapes
:z
8general_gnn/mlp/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
3general_gnn/mlp/sequential/dense/Tensordot/GatherV2GatherV29general_gnn/mlp/sequential/dense/Tensordot/Shape:output:08general_gnn/mlp/sequential/dense/Tensordot/free:output:0Ageneral_gnn/mlp/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:|
:general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
5general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1GatherV29general_gnn/mlp/sequential/dense/Tensordot/Shape:output:08general_gnn/mlp/sequential/dense/Tensordot/axes:output:0Cgeneral_gnn/mlp/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:z
0general_gnn/mlp/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
/general_gnn/mlp/sequential/dense/Tensordot/ProdProd<general_gnn/mlp/sequential/dense/Tensordot/GatherV2:output:09general_gnn/mlp/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: |
2general_gnn/mlp/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
1general_gnn/mlp/sequential/dense/Tensordot/Prod_1Prod>general_gnn/mlp/sequential/dense/Tensordot/GatherV2_1:output:0;general_gnn/mlp/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: x
6general_gnn/mlp/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
1general_gnn/mlp/sequential/dense/Tensordot/concatConcatV28general_gnn/mlp/sequential/dense/Tensordot/free:output:08general_gnn/mlp/sequential/dense/Tensordot/axes:output:0?general_gnn/mlp/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
0general_gnn/mlp/sequential/dense/Tensordot/stackPack8general_gnn/mlp/sequential/dense/Tensordot/Prod:output:0:general_gnn/mlp/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
4general_gnn/mlp/sequential/dense/Tensordot/transpose	Transposeinputs_0:general_gnn/mlp/sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
2general_gnn/mlp/sequential/dense/Tensordot/ReshapeReshape8general_gnn/mlp/sequential/dense/Tensordot/transpose:y:09general_gnn/mlp/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
1general_gnn/mlp/sequential/dense/Tensordot/MatMulMatMul;general_gnn/mlp/sequential/dense/Tensordot/Reshape:output:0Ageneral_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????}
2general_gnn/mlp/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?z
8general_gnn/mlp/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
3general_gnn/mlp/sequential/dense/Tensordot/concat_1ConcatV2<general_gnn/mlp/sequential/dense/Tensordot/GatherV2:output:0;general_gnn/mlp/sequential/dense/Tensordot/Const_2:output:0Ageneral_gnn/mlp/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
*general_gnn/mlp/sequential/dense/TensordotReshape;general_gnn/mlp/sequential/dense/Tensordot/MatMul:product:0<general_gnn/mlp/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOpReadVariableOp@general_gnn_mlp_sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
(general_gnn/mlp/sequential/dense/BiasAddBiasAdd3general_gnn/mlp/sequential/dense/Tensordot:output:0?general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
+general_gnn/mlp/sequential/dropout/IdentityIdentity1general_gnn/mlp/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
*general_gnn/mlp/sequential/activation/ReluRelu4general_gnn/mlp/sequential/dropout/Identity:output:0*
T0*,
_output_shapes
:?????????d??
;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpDgeneral_gnn_mlp_sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0{
1general_gnn/mlp/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
1general_gnn/mlp/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
2general_gnn/mlp/sequential/dense_1/Tensordot/ShapeShape8general_gnn/mlp/sequential/activation/Relu:activations:0*
T0*
_output_shapes
:|
:general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
5general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2GatherV2;general_gnn/mlp/sequential/dense_1/Tensordot/Shape:output:0:general_gnn/mlp/sequential/dense_1/Tensordot/free:output:0Cgeneral_gnn/mlp/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:~
<general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
7general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1GatherV2;general_gnn/mlp/sequential/dense_1/Tensordot/Shape:output:0:general_gnn/mlp/sequential/dense_1/Tensordot/axes:output:0Egeneral_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:|
2general_gnn/mlp/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
1general_gnn/mlp/sequential/dense_1/Tensordot/ProdProd>general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2:output:0;general_gnn/mlp/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: ~
4general_gnn/mlp/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
3general_gnn/mlp/sequential/dense_1/Tensordot/Prod_1Prod@general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2_1:output:0=general_gnn/mlp/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: z
8general_gnn/mlp/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
3general_gnn/mlp/sequential/dense_1/Tensordot/concatConcatV2:general_gnn/mlp/sequential/dense_1/Tensordot/free:output:0:general_gnn/mlp/sequential/dense_1/Tensordot/axes:output:0Ageneral_gnn/mlp/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
2general_gnn/mlp/sequential/dense_1/Tensordot/stackPack:general_gnn/mlp/sequential/dense_1/Tensordot/Prod:output:0<general_gnn/mlp/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
6general_gnn/mlp/sequential/dense_1/Tensordot/transpose	Transpose8general_gnn/mlp/sequential/activation/Relu:activations:0<general_gnn/mlp/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
4general_gnn/mlp/sequential/dense_1/Tensordot/ReshapeReshape:general_gnn/mlp/sequential/dense_1/Tensordot/transpose:y:0;general_gnn/mlp/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
3general_gnn/mlp/sequential/dense_1/Tensordot/MatMulMatMul=general_gnn/mlp/sequential/dense_1/Tensordot/Reshape:output:0Cgeneral_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????
4general_gnn/mlp/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?|
:general_gnn/mlp/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
5general_gnn/mlp/sequential/dense_1/Tensordot/concat_1ConcatV2>general_gnn/mlp/sequential/dense_1/Tensordot/GatherV2:output:0=general_gnn/mlp/sequential/dense_1/Tensordot/Const_2:output:0Cgeneral_gnn/mlp/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
,general_gnn/mlp/sequential/dense_1/TensordotReshape=general_gnn/mlp/sequential/dense_1/Tensordot/MatMul:product:0>general_gnn/mlp/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpBgeneral_gnn_mlp_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
*general_gnn/mlp/sequential/dense_1/BiasAddBiasAdd5general_gnn/mlp/sequential/dense_1/Tensordot:output:0Ageneral_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
-general_gnn/mlp/sequential/dropout_1/IdentityIdentity3general_gnn/mlp/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
,general_gnn/mlp/sequential/activation_1/ReluRelu6general_gnn/mlp/sequential/dropout_1/Identity:output:0*
T0*,
_output_shapes
:?????????d??
.general_gnn/general_conv/MatMul/ReadVariableOpReadVariableOp7general_gnn_general_conv_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
general_gnn/general_conv/MatMulBatchMatMulV2:general_gnn/mlp/sequential/activation_1/Relu:activations:06general_gnn/general_conv/MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
/general_gnn/general_conv/BiasAdd/ReadVariableOpReadVariableOp8general_gnn_general_conv_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
 general_gnn/general_conv/BiasAddBiasAdd(general_gnn/general_conv/MatMul:output:07general_gnn/general_conv/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
+general_gnn/general_conv/dropout_4/IdentityIdentity)general_gnn/general_conv/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
general_gnn/general_conv/ReluRelu4general_gnn/general_conv/dropout_4/Identity:output:0*
T0*,
_output_shapes
:?????????d?y
general_gnn/general_conv/ShapeShape+general_gnn/general_conv/Relu:activations:0*
T0*
_output_shapes
:
,general_gnn/general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
??????????
.general_gnn/general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????x
.general_gnn/general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
&general_gnn/general_conv/strided_sliceStridedSlice'general_gnn/general_conv/Shape:output:05general_gnn/general_conv/strided_slice/stack:output:07general_gnn/general_conv/strided_slice/stack_1:output:07general_gnn/general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
.general_gnn/general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       ?
0general_gnn/general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
0general_gnn/general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
(general_gnn/general_conv/strided_slice_1StridedSliceinputs7general_gnn/general_conv/strided_slice_1/stack:output:09general_gnn/general_conv/strided_slice_1/stack_1:output:09general_gnn/general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
.general_gnn/general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        ?
0general_gnn/general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       ?
0general_gnn/general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
(general_gnn/general_conv/strided_slice_2StridedSliceinputs7general_gnn/general_conv/strided_slice_2/stack:output:09general_gnn/general_conv/strided_slice_2/stack_1:output:09general_gnn/general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskq
&general_gnn/general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
!general_gnn/general_conv/GatherV2GatherV2+general_gnn/general_conv/Relu:activations:01general_gnn/general_conv/strided_slice_2:output:0/general_gnn/general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????|
'general_gnn/general_conv/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
"general_gnn/general_conv/transpose	Transpose*general_gnn/general_conv/GatherV2:output:00general_gnn/general_conv/transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
+general_gnn/general_conv/UnsortedSegmentSumUnsortedSegmentSum&general_gnn/general_conv/transpose:y:01general_gnn/general_conv/strided_slice_1:output:0/general_gnn/general_conv/strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????~
)general_gnn/general_conv/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$general_gnn/general_conv/transpose_1	Transpose4general_gnn/general_conv/UnsortedSegmentSum:output:02general_gnn/general_conv/transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?e
#general_gnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :?
general_gnn/concatenate/concatConcatV2(general_gnn/general_conv/transpose_1:y:0:general_gnn/mlp/sequential/activation_1/Relu:activations:0,general_gnn/concatenate/concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d??
?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOpHgeneral_gnn_mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0
5general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
5general_gnn/mlp_1/sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
6general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ShapeShape'general_gnn/concatenate/concat:output:0*
T0*
_output_shapes
:?
>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2GatherV2?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/free:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
@general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
;general_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1GatherV2?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axes:output:0Igeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
5general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ProdProdBgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:0?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
8general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
7general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod_1ProdDgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1:output:0Ageneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
7general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concatConcatV2>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/free:output:0>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/axes:output:0Egeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_2/Tensordot/stackPack>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod:output:0@general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
:general_gnn/mlp_1/sequential_1/dense_2/Tensordot/transpose	Transpose'general_gnn/concatenate/concat:output:0@general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
8general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReshapeReshape>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/transpose:y:0?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
7general_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMulMatMulAgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/Reshape:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
8general_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:??
>general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1ConcatV2Bgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:0Ageneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/Const_2:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
0general_gnn/mlp_1/sequential_1/dense_2/TensordotReshapeAgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/MatMul:product:0Bgeneral_gnn/mlp_1/sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOpFgeneral_gnn_mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
.general_gnn/mlp_1/sequential_1/dense_2/BiasAddBiasAdd9general_gnn/mlp_1/sequential_1/dense_2/Tensordot:output:0Egeneral_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
1general_gnn/mlp_1/sequential_1/dropout_2/IdentityIdentity7general_gnn/mlp_1/sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
0general_gnn/mlp_1/sequential_1/activation_2/ReluRelu:general_gnn/mlp_1/sequential_1/dropout_2/Identity:output:0*
T0*,
_output_shapes
:?????????d??
?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOpHgeneral_gnn_mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0
5general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:?
5general_gnn/mlp_1/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
6general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ShapeShape>general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:?
>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2GatherV2?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/free:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
@general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
;general_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1GatherV2?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Shape:output:0>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axes:output:0Igeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
5general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ProdProdBgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:0?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: ?
8general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
7general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod_1ProdDgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1:output:0Ageneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
7general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concatConcatV2>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/free:output:0>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/axes:output:0Egeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
6general_gnn/mlp_1/sequential_1/dense_3/Tensordot/stackPack>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod:output:0@general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
:general_gnn/mlp_1/sequential_1/dense_3/Tensordot/transpose	Transpose>general_gnn/mlp_1/sequential_1/activation_2/Relu:activations:0@general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
8general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReshapeReshape>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/transpose:y:0?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
7general_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMulMatMulAgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/Reshape:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
8general_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?
>general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
9general_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1ConcatV2Bgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:0Ageneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/Const_2:output:0Ggeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
0general_gnn/mlp_1/sequential_1/dense_3/TensordotReshapeAgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/MatMul:product:0Bgeneral_gnn/mlp_1/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOpFgeneral_gnn_mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
.general_gnn/mlp_1/sequential_1/dense_3/BiasAddBiasAdd9general_gnn/mlp_1/sequential_1/dense_3/Tensordot:output:0Egeneral_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
1general_gnn/mlp_1/sequential_1/dropout_3/IdentityIdentity7general_gnn/mlp_1/sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????d?
0general_gnn/mlp_1/sequential_1/activation_3/TanhTanh:general_gnn/mlp_1/sequential_1/dropout_3/Identity:output:0*
T0*+
_output_shapes
:?????????d?
IdentityIdentity4general_gnn/mlp_1/sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp0^general_gnn/general_conv/BiasAdd/ReadVariableOp/^general_gnn/general_conv/MatMul/ReadVariableOp8^general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp:^general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp:^general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp<^general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp>^general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp@^general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp>^general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp@^general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2b
/general_gnn/general_conv/BiasAdd/ReadVariableOp/general_gnn/general_conv/BiasAdd/ReadVariableOp2`
.general_gnn/general_conv/MatMul/ReadVariableOp.general_gnn/general_conv/MatMul/ReadVariableOp2r
7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp7general_gnn/mlp/sequential/dense/BiasAdd/ReadVariableOp2v
9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp9general_gnn/mlp/sequential/dense/Tensordot/ReadVariableOp2v
9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp9general_gnn/mlp/sequential/dense_1/BiasAdd/ReadVariableOp2z
;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp;general_gnn/mlp/sequential/dense_1/Tensordot/ReadVariableOp2~
=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp=general_gnn/mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp2?
?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?general_gnn/mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2~
=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp=general_gnn/mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp2?
?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?general_gnn/mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
F
*__inference_dropout_2_layer_call_fn_517321

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_515011e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?	
?
A__inference_mlp_1_layer_call_and_return_conditional_losses_515134

inputs'
sequential_1_515124:
??"
sequential_1_515126:	?&
sequential_1_515128:	?!
sequential_1_515130:
identity??$sequential_1/StatefulPartitionedCall?
$sequential_1/StatefulPartitionedCallStatefulPartitionedCallinputssequential_1_515124sequential_1_515126sequential_1_515128sequential_1_515130*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_514951?
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????dm
NoOpNoOp%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?!
?
H__inference_general_conv_layer_call_and_return_conditional_losses_516992
inputs_0

inputs	
inputs_1
inputs_2	2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0w
MatMulBatchMatMulV2inputs_0MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0z
BiasAddBiasAddMatMul:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?U
ReluReluBiasAdd:output:0*
T0*,
_output_shapes
:?????????d?G
ShapeShapeRelu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputsstrided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputsstrided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Relu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
	transpose	TransposeGatherV2:output:0transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
UnsortedSegmentSumUnsortedSegmentSumtranspose:y:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????e
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
transpose_1	TransposeUnsortedSegmentSum:output:0transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:?????????d?w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*W
_input_shapesF
D:?????????d?:?????????:?????????:: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:V R
,
_output_shapes
:?????????d?
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
C__inference_dense_3_layer_call_and_return_conditional_losses_514930

inputs4
!tensordot_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????dr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????dc
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:?????????dz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
F__inference_sequential_layer_call_and_return_conditional_losses_514677

inputs
dense_514662:	?
dense_514664:	?"
dense_1_514669:
??
dense_1_514671:	?
identity??dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCallinputsdense_514662dense_514664*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_514500?
dropout/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_514631?
activation/PartitionedCallPartitionedCall dropout/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_activation_layer_call_and_return_conditional_losses_514518?
dense_1/StatefulPartitionedCallStatefulPartitionedCall#activation/PartitionedCall:output:0dense_1_514669dense_1_514671*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_514550?
dropout_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_514600?
activation_1/PartitionedCallPartitionedCall"dropout_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_1_layer_call_and_return_conditional_losses_514568y
IdentityIdentity%activation_1/PartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
-__inference_sequential_1_layer_call_fn_517018

inputs
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_515057s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?@
?
F__inference_sequential_layer_call_and_return_conditional_losses_516841

inputs:
'dense_tensordot_readvariableop_resource:	?4
%dense_biasadd_readvariableop_resource:	?=
)dense_1_tensordot_readvariableop_resource:
??6
'dense_1_biasadd_readvariableop_resource:	?
identity??dense/BiasAdd/ReadVariableOp?dense/Tensordot/ReadVariableOp?dense_1/BiasAdd/ReadVariableOp? dense_1/Tensordot/ReadVariableOp?
dense/Tensordot/ReadVariableOpReadVariableOp'dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0^
dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:e
dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       K
dense/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:_
dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/GatherV2GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/free:output:0&dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/GatherV2_1GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/axes:output:0(dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:_
dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense/Tensordot/ProdProd!dense/Tensordot/GatherV2:output:0dense/Tensordot/Const:output:0*
T0*
_output_shapes
: a
dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense/Tensordot/Prod_1Prod#dense/Tensordot/GatherV2_1:output:0 dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ]
dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/concatConcatV2dense/Tensordot/free:output:0dense/Tensordot/axes:output:0$dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense/Tensordot/stackPackdense/Tensordot/Prod:output:0dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense/Tensordot/transpose	Transposeinputsdense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
dense/Tensordot/ReshapeReshapedense/Tensordot/transpose:y:0dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense/Tensordot/MatMulMatMul dense/Tensordot/Reshape:output:0&dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????b
dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?_
dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense/Tensordot/concat_1ConcatV2!dense/Tensordot/GatherV2:output:0 dense/Tensordot/Const_2:output:0&dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense/TensordotReshape dense/Tensordot/MatMul:product:0!dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense/BiasAddBiasAdddense/Tensordot:output:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?k
dropout/IdentityIdentitydense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?i
activation/ReluReludropout/Identity:output:0*
T0*,
_output_shapes
:?????????d??
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0`
dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       d
dense_1/Tensordot/ShapeShapeactivation/Relu:activations:0*
T0*
_output_shapes
:a
dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/GatherV2GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/free:output:0(dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/GatherV2_1GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/axes:output:0*dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
dense_1/Tensordot/transpose	Transposeactivation/Relu:activations:0!dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????d
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?a
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?o
dropout_1/IdentityIdentitydense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?m
activation_1/ReluReludropout_1/Identity:output:0*
T0*,
_output_shapes
:?????????d?s
IdentityIdentityactivation_1/Relu:activations:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/Tensordot/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2@
dense/Tensordot/ReadVariableOpdense/Tensordot/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
C__inference_dense_3_layer_call_and_return_conditional_losses_517379

inputs4
!tensordot_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????dr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????dc
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:?????????dz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:?????????d?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
??
?

G__inference_general_gnn_layer_call_and_return_conditional_losses_516310
inputs_0

inputs	
inputs_1
inputs_2	I
6mlp_sequential_dense_tensordot_readvariableop_resource:	?C
4mlp_sequential_dense_biasadd_readvariableop_resource:	?L
8mlp_sequential_dense_1_tensordot_readvariableop_resource:
??E
6mlp_sequential_dense_1_biasadd_readvariableop_resource:	??
+general_conv_matmul_readvariableop_resource:
??;
,general_conv_biasadd_readvariableop_resource:	?P
<mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource:
??I
:mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource:	?O
<mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource:	?H
:mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource:
identity??#general_conv/BiasAdd/ReadVariableOp?"general_conv/MatMul/ReadVariableOp?+mlp/sequential/dense/BiasAdd/ReadVariableOp?-mlp/sequential/dense/Tensordot/ReadVariableOp?-mlp/sequential/dense_1/BiasAdd/ReadVariableOp?/mlp/sequential/dense_1/Tensordot/ReadVariableOp?1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp?3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp?1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp?3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp?
-mlp/sequential/dense/Tensordot/ReadVariableOpReadVariableOp6mlp_sequential_dense_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0m
#mlp/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#mlp/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       \
$mlp/sequential/dense/Tensordot/ShapeShapeinputs_0*
T0*
_output_shapes
:n
,mlp/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'mlp/sequential/dense/Tensordot/GatherV2GatherV2-mlp/sequential/dense/Tensordot/Shape:output:0,mlp/sequential/dense/Tensordot/free:output:05mlp/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.mlp/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)mlp/sequential/dense/Tensordot/GatherV2_1GatherV2-mlp/sequential/dense/Tensordot/Shape:output:0,mlp/sequential/dense/Tensordot/axes:output:07mlp/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$mlp/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
#mlp/sequential/dense/Tensordot/ProdProd0mlp/sequential/dense/Tensordot/GatherV2:output:0-mlp/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&mlp/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
%mlp/sequential/dense/Tensordot/Prod_1Prod2mlp/sequential/dense/Tensordot/GatherV2_1:output:0/mlp/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*mlp/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
%mlp/sequential/dense/Tensordot/concatConcatV2,mlp/sequential/dense/Tensordot/free:output:0,mlp/sequential/dense/Tensordot/axes:output:03mlp/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
$mlp/sequential/dense/Tensordot/stackPack,mlp/sequential/dense/Tensordot/Prod:output:0.mlp/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
(mlp/sequential/dense/Tensordot/transpose	Transposeinputs_0.mlp/sequential/dense/Tensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
&mlp/sequential/dense/Tensordot/ReshapeReshape,mlp/sequential/dense/Tensordot/transpose:y:0-mlp/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
%mlp/sequential/dense/Tensordot/MatMulMatMul/mlp/sequential/dense/Tensordot/Reshape:output:05mlp/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????q
&mlp/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?n
,mlp/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'mlp/sequential/dense/Tensordot/concat_1ConcatV20mlp/sequential/dense/Tensordot/GatherV2:output:0/mlp/sequential/dense/Tensordot/Const_2:output:05mlp/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
mlp/sequential/dense/TensordotReshape/mlp/sequential/dense/Tensordot/MatMul:product:00mlp/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
+mlp/sequential/dense/BiasAdd/ReadVariableOpReadVariableOp4mlp_sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
mlp/sequential/dense/BiasAddBiasAdd'mlp/sequential/dense/Tensordot:output:03mlp/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
mlp/sequential/dropout/IdentityIdentity%mlp/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
mlp/sequential/activation/ReluRelu(mlp/sequential/dropout/Identity:output:0*
T0*,
_output_shapes
:?????????d??
/mlp/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp8mlp_sequential_dense_1_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0o
%mlp/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:v
%mlp/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
&mlp/sequential/dense_1/Tensordot/ShapeShape,mlp/sequential/activation/Relu:activations:0*
T0*
_output_shapes
:p
.mlp/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)mlp/sequential/dense_1/Tensordot/GatherV2GatherV2/mlp/sequential/dense_1/Tensordot/Shape:output:0.mlp/sequential/dense_1/Tensordot/free:output:07mlp/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:r
0mlp/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
+mlp/sequential/dense_1/Tensordot/GatherV2_1GatherV2/mlp/sequential/dense_1/Tensordot/Shape:output:0.mlp/sequential/dense_1/Tensordot/axes:output:09mlp/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
&mlp/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
%mlp/sequential/dense_1/Tensordot/ProdProd2mlp/sequential/dense_1/Tensordot/GatherV2:output:0/mlp/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: r
(mlp/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
'mlp/sequential/dense_1/Tensordot/Prod_1Prod4mlp/sequential/dense_1/Tensordot/GatherV2_1:output:01mlp/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: n
,mlp/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
'mlp/sequential/dense_1/Tensordot/concatConcatV2.mlp/sequential/dense_1/Tensordot/free:output:0.mlp/sequential/dense_1/Tensordot/axes:output:05mlp/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
&mlp/sequential/dense_1/Tensordot/stackPack.mlp/sequential/dense_1/Tensordot/Prod:output:00mlp/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
*mlp/sequential/dense_1/Tensordot/transpose	Transpose,mlp/sequential/activation/Relu:activations:00mlp/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
(mlp/sequential/dense_1/Tensordot/ReshapeReshape.mlp/sequential/dense_1/Tensordot/transpose:y:0/mlp/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
'mlp/sequential/dense_1/Tensordot/MatMulMatMul1mlp/sequential/dense_1/Tensordot/Reshape:output:07mlp/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
(mlp/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?p
.mlp/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
)mlp/sequential/dense_1/Tensordot/concat_1ConcatV22mlp/sequential/dense_1/Tensordot/GatherV2:output:01mlp/sequential/dense_1/Tensordot/Const_2:output:07mlp/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
 mlp/sequential/dense_1/TensordotReshape1mlp/sequential/dense_1/Tensordot/MatMul:product:02mlp/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
-mlp/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp6mlp_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
mlp/sequential/dense_1/BiasAddBiasAdd)mlp/sequential/dense_1/Tensordot:output:05mlp/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
!mlp/sequential/dropout_1/IdentityIdentity'mlp/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
 mlp/sequential/activation_1/ReluRelu*mlp/sequential/dropout_1/Identity:output:0*
T0*,
_output_shapes
:?????????d??
"general_conv/MatMul/ReadVariableOpReadVariableOp+general_conv_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
general_conv/MatMulBatchMatMulV2.mlp/sequential/activation_1/Relu:activations:0*general_conv/MatMul/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
#general_conv/BiasAdd/ReadVariableOpReadVariableOp,general_conv_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
general_conv/BiasAddBiasAddgeneral_conv/MatMul:output:0+general_conv/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
general_conv/dropout_4/IdentityIdentitygeneral_conv/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d?z
general_conv/ReluRelu(general_conv/dropout_4/Identity:output:0*
T0*,
_output_shapes
:?????????d?a
general_conv/ShapeShapegeneral_conv/Relu:activations:0*
T0*
_output_shapes
:s
 general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????u
"general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????l
"general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
general_conv/strided_sliceStridedSlicegeneral_conv/Shape:output:0)general_conv/strided_slice/stack:output:0+general_conv/strided_slice/stack_1:output:0+general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_masks
"general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_1StridedSliceinputs+general_conv/strided_slice_1/stack:output:0-general_conv/strided_slice_1/stack_1:output:0-general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_masks
"general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        u
$general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_2StridedSliceinputs+general_conv/strided_slice_2/stack:output:0-general_conv/strided_slice_2/stack_1:output:0-general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maske
general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
general_conv/GatherV2GatherV2general_conv/Relu:activations:0%general_conv/strided_slice_2:output:0#general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*5
_output_shapes#
!:???????????????????p
general_conv/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
general_conv/transpose	Transposegeneral_conv/GatherV2:output:0$general_conv/transpose/perm:output:0*
T0*5
_output_shapes#
!:????????????????????
general_conv/UnsortedSegmentSumUnsortedSegmentSumgeneral_conv/transpose:y:0%general_conv/strided_slice_1:output:0#general_conv/strided_slice:output:0*
T0*
Tindices0	*,
_output_shapes
:d??????????r
general_conv/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ?
general_conv/transpose_1	Transpose(general_conv/UnsortedSegmentSum:output:0&general_conv/transpose_1/perm:output:0*
T0*,
_output_shapes
:?????????d?Y
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :?
concatenate/concatConcatV2general_conv/transpose_1:y:0.mlp/sequential/activation_1/Relu:activations:0 concatenate/concat/axis:output:0*
N*
T0*,
_output_shapes
:?????????d??
3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOpReadVariableOp<mlp_1_sequential_1_dense_2_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype0s
)mlp_1/sequential_1/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:z
)mlp_1/sequential_1/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       u
*mlp_1/sequential_1/dense_2/Tensordot/ShapeShapeconcatenate/concat:output:0*
T0*
_output_shapes
:t
2mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_2/Tensordot/GatherV2GatherV23mlp_1/sequential_1/dense_2/Tensordot/Shape:output:02mlp_1/sequential_1/dense_2/Tensordot/free:output:0;mlp_1/sequential_1/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:v
4mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
/mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1GatherV23mlp_1/sequential_1/dense_2/Tensordot/Shape:output:02mlp_1/sequential_1/dense_2/Tensordot/axes:output:0=mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:t
*mlp_1/sequential_1/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
)mlp_1/sequential_1/dense_2/Tensordot/ProdProd6mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:03mlp_1/sequential_1/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: v
,mlp_1/sequential_1/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
+mlp_1/sequential_1/dense_2/Tensordot/Prod_1Prod8mlp_1/sequential_1/dense_2/Tensordot/GatherV2_1:output:05mlp_1/sequential_1/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: r
0mlp_1/sequential_1/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
+mlp_1/sequential_1/dense_2/Tensordot/concatConcatV22mlp_1/sequential_1/dense_2/Tensordot/free:output:02mlp_1/sequential_1/dense_2/Tensordot/axes:output:09mlp_1/sequential_1/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
*mlp_1/sequential_1/dense_2/Tensordot/stackPack2mlp_1/sequential_1/dense_2/Tensordot/Prod:output:04mlp_1/sequential_1/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
.mlp_1/sequential_1/dense_2/Tensordot/transpose	Transposeconcatenate/concat:output:04mlp_1/sequential_1/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
,mlp_1/sequential_1/dense_2/Tensordot/ReshapeReshape2mlp_1/sequential_1/dense_2/Tensordot/transpose:y:03mlp_1/sequential_1/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
+mlp_1/sequential_1/dense_2/Tensordot/MatMulMatMul5mlp_1/sequential_1/dense_2/Tensordot/Reshape:output:0;mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????w
,mlp_1/sequential_1/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?t
2mlp_1/sequential_1/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_2/Tensordot/concat_1ConcatV26mlp_1/sequential_1/dense_2/Tensordot/GatherV2:output:05mlp_1/sequential_1/dense_2/Tensordot/Const_2:output:0;mlp_1/sequential_1/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
$mlp_1/sequential_1/dense_2/TensordotReshape5mlp_1/sequential_1/dense_2/Tensordot/MatMul:product:06mlp_1/sequential_1/dense_2/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d??
1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOpReadVariableOp:mlp_1_sequential_1_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
"mlp_1/sequential_1/dense_2/BiasAddBiasAdd-mlp_1/sequential_1/dense_2/Tensordot:output:09mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d??
%mlp_1/sequential_1/dropout_2/IdentityIdentity+mlp_1/sequential_1/dense_2/BiasAdd:output:0*
T0*,
_output_shapes
:?????????d??
$mlp_1/sequential_1/activation_2/ReluRelu.mlp_1/sequential_1/dropout_2/Identity:output:0*
T0*,
_output_shapes
:?????????d??
3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp<mlp_1_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0s
)mlp_1/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:z
)mlp_1/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ?
*mlp_1/sequential_1/dense_3/Tensordot/ShapeShape2mlp_1/sequential_1/activation_2/Relu:activations:0*
T0*
_output_shapes
:t
2mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_3/Tensordot/GatherV2GatherV23mlp_1/sequential_1/dense_3/Tensordot/Shape:output:02mlp_1/sequential_1/dense_3/Tensordot/free:output:0;mlp_1/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:v
4mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
/mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1GatherV23mlp_1/sequential_1/dense_3/Tensordot/Shape:output:02mlp_1/sequential_1/dense_3/Tensordot/axes:output:0=mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:t
*mlp_1/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ?
)mlp_1/sequential_1/dense_3/Tensordot/ProdProd6mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:03mlp_1/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: v
,mlp_1/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ?
+mlp_1/sequential_1/dense_3/Tensordot/Prod_1Prod8mlp_1/sequential_1/dense_3/Tensordot/GatherV2_1:output:05mlp_1/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: r
0mlp_1/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
+mlp_1/sequential_1/dense_3/Tensordot/concatConcatV22mlp_1/sequential_1/dense_3/Tensordot/free:output:02mlp_1/sequential_1/dense_3/Tensordot/axes:output:09mlp_1/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:?
*mlp_1/sequential_1/dense_3/Tensordot/stackPack2mlp_1/sequential_1/dense_3/Tensordot/Prod:output:04mlp_1/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:?
.mlp_1/sequential_1/dense_3/Tensordot/transpose	Transpose2mlp_1/sequential_1/activation_2/Relu:activations:04mlp_1/sequential_1/dense_3/Tensordot/concat:output:0*
T0*,
_output_shapes
:?????????d??
,mlp_1/sequential_1/dense_3/Tensordot/ReshapeReshape2mlp_1/sequential_1/dense_3/Tensordot/transpose:y:03mlp_1/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
+mlp_1/sequential_1/dense_3/Tensordot/MatMulMatMul5mlp_1/sequential_1/dense_3/Tensordot/Reshape:output:0;mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????v
,mlp_1/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:t
2mlp_1/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
-mlp_1/sequential_1/dense_3/Tensordot/concat_1ConcatV26mlp_1/sequential_1/dense_3/Tensordot/GatherV2:output:05mlp_1/sequential_1/dense_3/Tensordot/Const_2:output:0;mlp_1/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
$mlp_1/sequential_1/dense_3/TensordotReshape5mlp_1/sequential_1/dense_3/Tensordot/MatMul:product:06mlp_1/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:?????????d?
1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp:mlp_1_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
"mlp_1/sequential_1/dense_3/BiasAddBiasAdd-mlp_1/sequential_1/dense_3/Tensordot:output:09mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:?????????d?
%mlp_1/sequential_1/dropout_3/IdentityIdentity+mlp_1/sequential_1/dense_3/BiasAdd:output:0*
T0*+
_output_shapes
:?????????d?
$mlp_1/sequential_1/activation_3/TanhTanh.mlp_1/sequential_1/dropout_3/Identity:output:0*
T0*+
_output_shapes
:?????????d{
IdentityIdentity(mlp_1/sequential_1/activation_3/Tanh:y:0^NoOp*
T0*+
_output_shapes
:?????????d?
NoOpNoOp$^general_conv/BiasAdd/ReadVariableOp#^general_conv/MatMul/ReadVariableOp,^mlp/sequential/dense/BiasAdd/ReadVariableOp.^mlp/sequential/dense/Tensordot/ReadVariableOp.^mlp/sequential/dense_1/BiasAdd/ReadVariableOp0^mlp/sequential/dense_1/Tensordot/ReadVariableOp2^mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp4^mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2^mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp4^mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*f
_input_shapesU
S:?????????d:?????????:?????????:: : : : : : : : : : 2J
#general_conv/BiasAdd/ReadVariableOp#general_conv/BiasAdd/ReadVariableOp2H
"general_conv/MatMul/ReadVariableOp"general_conv/MatMul/ReadVariableOp2Z
+mlp/sequential/dense/BiasAdd/ReadVariableOp+mlp/sequential/dense/BiasAdd/ReadVariableOp2^
-mlp/sequential/dense/Tensordot/ReadVariableOp-mlp/sequential/dense/Tensordot/ReadVariableOp2^
-mlp/sequential/dense_1/BiasAdd/ReadVariableOp-mlp/sequential/dense_1/BiasAdd/ReadVariableOp2b
/mlp/sequential/dense_1/Tensordot/ReadVariableOp/mlp/sequential/dense_1/Tensordot/ReadVariableOp2f
1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp1mlp_1/sequential_1/dense_2/BiasAdd/ReadVariableOp2j
3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp3mlp_1/sequential_1/dense_2/Tensordot/ReadVariableOp2f
1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp1mlp_1/sequential_1/dense_3/BiasAdd/ReadVariableOp2j
3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp3mlp_1/sequential_1/dense_3/Tensordot/ReadVariableOp:U Q
+
_output_shapes
:?????????d
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
F__inference_sequential_layer_call_and_return_conditional_losses_514719
dense_input
dense_514704:	?
dense_514706:	?"
dense_1_514711:
??
dense_1_514713:	?
identity??dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCalldense_inputdense_514704dense_514706*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_514500?
dropout/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_514511?
activation/PartitionedCallPartitionedCall dropout/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_activation_layer_call_and_return_conditional_losses_514518?
dense_1/StatefulPartitionedCallStatefulPartitionedCall#activation/PartitionedCall:output:0dense_1_514711dense_1_514713*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_514550?
dropout_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_514561?
activation_1/PartitionedCallPartitionedCall"dropout_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:?????????d?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_activation_1_layer_call_and_return_conditional_losses_514568y
IdentityIdentity%activation_1/PartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:?????????d??
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????d: : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:X T
+
_output_shapes
:?????????d
%
_user_specified_namedense_input
?
a
E__inference_dropout_1_layer_call_and_return_conditional_losses_514600

inputs
identityS
IdentityIdentityinputs*
T0*,
_output_shapes
:?????????d?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????d?:T P
,
_output_shapes
:?????????d?
 
_user_specified_nameinputs
?
?
&__inference_mlp_1_layer_call_fn_515145
input_1
unknown:
??
	unknown_0:	?
	unknown_1:	?
	unknown_2:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????d*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_mlp_1_layer_call_and_return_conditional_losses_515134s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????d`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :?????????d?: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:U Q
,
_output_shapes
:?????????d?
!
_user_specified_name	input_1
?
?
A__inference_dense_layer_call_and_return_conditional_losses_514500

inputs4
!tensordot_readvariableop_resource:	?.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	?*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:y
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*+
_output_shapes
:?????????d?
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:???????????????????
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:?????????d?s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:?????????d?d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:?????????d?z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????d: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:?????????d
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
=
args_03
serving_default_args_0:0?????????d
=
args_0_11
serving_default_args_0_1:0	?????????
9
args_0_2-
serving_default_args_0_2:0?????????
0
args_0_3$
serving_default_args_0_3:0	@
output_14
StatefulPartitionedCall:0?????????dtensorflow/serving/predict:??
?
mp
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
		steps


signatures"
_tf_keras_model
?

config
connectivity
pre
gnn
post
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_model
f
0
1
2
3
4
5
6
7
8
9"
trackable_list_wrapper
f
0
1
2
3
4
5
6
7
8
9"
trackable_list_wrapper
 "
trackable_list_wrapper
?
 non_trainable_variables

!layers
"metrics
#layer_regularization_losses
$layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_gnnca_simple_layer_call_fn_515595
-__inference_gnnca_simple_layer_call_fn_515623?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515772
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515916?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
!__inference__wrapped_model_514463args_0args_0_1args_0_2args_0_3"?
???
FullArgSpec
args? 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
__inference_steps_516075?
???
FullArgSpec&
args?
jself
jinputs
jsteps
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
,
%serving_default"
signature_map
 "
trackable_dict_wrapper
?
&	variables
'trainable_variables
(regularization_losses
)	keras_api
*__call__
*+&call_and_return_all_conditional_losses"
_tf_keras_layer
?

,config
-mlp
.	variables
/trainable_variables
0regularization_losses
1	keras_api
2__call__
*3&call_and_return_all_conditional_losses"
_tf_keras_model
'
40"
trackable_list_wrapper
?

5config
6mlp
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses"
_tf_keras_model
f
0
1
2
3
4
5
6
7
8
9"
trackable_list_wrapper
f
0
1
2
3
4
5
6
7
8
9"
trackable_list_wrapper
 "
trackable_list_wrapper
?
=non_trainable_variables

>layers
?metrics
@layer_regularization_losses
Alayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
?2?
,__inference_general_gnn_layer_call_fn_516133
,__inference_general_gnn_layer_call_fn_516161?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
G__inference_general_gnn_layer_call_and_return_conditional_losses_516310
G__inference_general_gnn_layer_call_and_return_conditional_losses_516454?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
:	?2dense/kernel
:?2
dense/bias
": 
??2dense_1/kernel
:?2dense_1/bias
F:D
??22while/gnnca_simple/general_gnn/general_conv/kernel
?:=?20while/gnnca_simple/general_gnn/general_conv/bias
": 
??2dense_2/kernel
:?2dense_2/bias
!:	?2dense_3/kernel
:2dense_3/bias
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
?B?
$__inference_signature_wrapper_516105args_0args_0_1args_0_2args_0_3"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
Bnon_trainable_variables

Clayers
Dmetrics
Elayer_regularization_losses
Flayer_metrics
&	variables
'trainable_variables
(regularization_losses
*__call__
*+&call_and_return_all_conditional_losses
&+"call_and_return_conditional_losses"
_generic_user_object
?2?
,__inference_concatenate_layer_call_fn_516460?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
G__inference_concatenate_layer_call_and_return_conditional_losses_516467?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_dict_wrapper
?
Glayer_with_weights-0
Glayer-0
Hlayer-1
Ilayer-2
Jlayer_with_weights-1
Jlayer-3
Klayer-4
Llayer-5
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses"
_tf_keras_sequential
<
0
1
2
3"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
?
Snon_trainable_variables

Tlayers
Umetrics
Vlayer_regularization_losses
Wlayer_metrics
.	variables
/trainable_variables
0regularization_losses
2__call__
*3&call_and_return_all_conditional_losses
&3"call_and_return_conditional_losses"
_generic_user_object
?2?
$__inference_mlp_layer_call_fn_514765
$__inference_mlp_layer_call_fn_516480
$__inference_mlp_layer_call_fn_516493
$__inference_mlp_layer_call_fn_514817?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
?__inference_mlp_layer_call_and_return_conditional_losses_516553
?__inference_mlp_layer_call_and_return_conditional_losses_516611
?__inference_mlp_layer_call_and_return_conditional_losses_514830
?__inference_mlp_layer_call_and_return_conditional_losses_514843?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?
Xkwargs_keys
Ydropout

kernel
bias
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
^__call__
*_&call_and_return_all_conditional_losses"
_tf_keras_layer
 "
trackable_dict_wrapper
?
`layer_with_weights-0
`layer-0
alayer-1
blayer-2
clayer_with_weights-1
clayer-3
dlayer-4
elayer-5
f	variables
gtrainable_variables
hregularization_losses
i	keras_api
j__call__
*k&call_and_return_all_conditional_losses"
_tf_keras_sequential
<
0
1
2
3"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
?
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses"
_generic_user_object
?2?
&__inference_mlp_1_layer_call_fn_515145
&__inference_mlp_1_layer_call_fn_516624
&__inference_mlp_1_layer_call_fn_516637
&__inference_mlp_1_layer_call_fn_515197?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
A__inference_mlp_1_layer_call_and_return_conditional_losses_516697
A__inference_mlp_1_layer_call_and_return_conditional_losses_516755
A__inference_mlp_1_layer_call_and_return_conditional_losses_515210
A__inference_mlp_1_layer_call_and_return_conditional_losses_515223?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
<
0
1
42
3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
?

kernel
bias
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses"
_tf_keras_layer
?
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{_random_generator
|__call__
*}&call_and_return_all_conditional_losses"
_tf_keras_layer
?
~	variables
trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
<
0
1
2
3"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
?2?
+__inference_sequential_layer_call_fn_514582
+__inference_sequential_layer_call_fn_516768
+__inference_sequential_layer_call_fn_516781
+__inference_sequential_layer_call_fn_514701?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
F__inference_sequential_layer_call_and_return_conditional_losses_516841
F__inference_sequential_layer_call_and_return_conditional_losses_516899
F__inference_sequential_layer_call_and_return_conditional_losses_514719
F__inference_sequential_layer_call_and_return_conditional_losses_514737?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
'
-0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
Z	variables
[trainable_variables
\regularization_losses
^__call__
*_&call_and_return_all_conditional_losses
&_"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_general_conv_layer_call_fn_516911
-__inference_general_conv_layer_call_fn_516923?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkwjkwargs
defaults? 

kwonlyargs?

jtraining%
kwonlydefaults?

trainingp 
annotations? *
 
?2?
H__inference_general_conv_layer_call_and_return_conditional_losses_516958
H__inference_general_conv_layer_call_and_return_conditional_losses_516992?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkwjkwargs
defaults? 

kwonlyargs?

jtraining%
kwonlydefaults?

trainingp 
annotations? *
 
?

kernel
bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?_random_generator
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
<
0
1
2
3"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
f	variables
gtrainable_variables
hregularization_losses
j__call__
*k&call_and_return_all_conditional_losses
&k"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_sequential_1_layer_call_fn_514962
-__inference_sequential_1_layer_call_fn_517005
-__inference_sequential_1_layer_call_fn_517018
-__inference_sequential_1_layer_call_fn_515081?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
H__inference_sequential_1_layer_call_and_return_conditional_losses_517078
H__inference_sequential_1_layer_call_and_return_conditional_losses_517136
H__inference_sequential_1_layer_call_and_return_conditional_losses_515099
H__inference_sequential_1_layer_call_and_return_conditional_losses_515117?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
'
60"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses"
_generic_user_object
?2?
&__inference_dense_layer_call_fn_517145?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
A__inference_dense_layer_call_and_return_conditional_losses_517175?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
w	variables
xtrainable_variables
yregularization_losses
|__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
?2?
(__inference_dropout_layer_call_fn_517180
(__inference_dropout_layer_call_fn_517185?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
C__inference_dropout_layer_call_and_return_conditional_losses_517190
C__inference_dropout_layer_call_and_return_conditional_losses_517194?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
~	variables
trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
+__inference_activation_layer_call_fn_517199?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
F__inference_activation_layer_call_and_return_conditional_losses_517204?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
(__inference_dense_1_layer_call_fn_517213?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_1_layer_call_and_return_conditional_losses_517243?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
?2?
*__inference_dropout_1_layer_call_fn_517248
*__inference_dropout_1_layer_call_fn_517253?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
E__inference_dropout_1_layer_call_and_return_conditional_losses_517258
E__inference_dropout_1_layer_call_and_return_conditional_losses_517262?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_activation_1_layer_call_fn_517267?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_activation_1_layer_call_and_return_conditional_losses_517272?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
J
G0
H1
I2
J3
K4
L5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
?2??
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2??
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
'
Y0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
(__inference_dense_2_layer_call_fn_517281?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_2_layer_call_and_return_conditional_losses_517311?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
?2?
*__inference_dropout_2_layer_call_fn_517316
*__inference_dropout_2_layer_call_fn_517321?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
E__inference_dropout_2_layer_call_and_return_conditional_losses_517326
E__inference_dropout_2_layer_call_and_return_conditional_losses_517330?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_activation_2_layer_call_fn_517335?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_activation_2_layer_call_and_return_conditional_losses_517340?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
(__inference_dense_3_layer_call_fn_517349?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_3_layer_call_and_return_conditional_losses_517379?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
?2?
*__inference_dropout_3_layer_call_fn_517384
*__inference_dropout_3_layer_call_fn_517389?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
E__inference_dropout_3_layer_call_and_return_conditional_losses_517394
E__inference_dropout_3_layer_call_and_return_conditional_losses_517398?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_activation_3_layer_call_fn_517403?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_activation_3_layer_call_and_return_conditional_losses_517408?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
J
`0
a1
b2
c3
d4
e5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper?
!__inference__wrapped_model_514463?
~?{
t?q
o?l
&?#
args_0/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
? "7?4
2
output_1&?#
output_1?????????d?
H__inference_activation_1_layer_call_and_return_conditional_losses_517272b4?1
*?'
%?"
inputs?????????d?
? "*?'
 ?
0?????????d?
? ?
-__inference_activation_1_layer_call_fn_517267U4?1
*?'
%?"
inputs?????????d?
? "??????????d??
H__inference_activation_2_layer_call_and_return_conditional_losses_517340b4?1
*?'
%?"
inputs?????????d?
? "*?'
 ?
0?????????d?
? ?
-__inference_activation_2_layer_call_fn_517335U4?1
*?'
%?"
inputs?????????d?
? "??????????d??
H__inference_activation_3_layer_call_and_return_conditional_losses_517408`3?0
)?&
$?!
inputs?????????d
? ")?&
?
0?????????d
? ?
-__inference_activation_3_layer_call_fn_517403S3?0
)?&
$?!
inputs?????????d
? "??????????d?
F__inference_activation_layer_call_and_return_conditional_losses_517204b4?1
*?'
%?"
inputs?????????d?
? "*?'
 ?
0?????????d?
? ?
+__inference_activation_layer_call_fn_517199U4?1
*?'
%?"
inputs?????????d?
? "??????????d??
G__inference_concatenate_layer_call_and_return_conditional_losses_516467?d?a
Z?W
U?R
'?$
inputs/0?????????d?
'?$
inputs/1?????????d?
? "*?'
 ?
0?????????d?
? ?
,__inference_concatenate_layer_call_fn_516460?d?a
Z?W
U?R
'?$
inputs/0?????????d?
'?$
inputs/1?????????d?
? "??????????d??
C__inference_dense_1_layer_call_and_return_conditional_losses_517243f4?1
*?'
%?"
inputs?????????d?
? "*?'
 ?
0?????????d?
? ?
(__inference_dense_1_layer_call_fn_517213Y4?1
*?'
%?"
inputs?????????d?
? "??????????d??
C__inference_dense_2_layer_call_and_return_conditional_losses_517311f4?1
*?'
%?"
inputs?????????d?
? "*?'
 ?
0?????????d?
? ?
(__inference_dense_2_layer_call_fn_517281Y4?1
*?'
%?"
inputs?????????d?
? "??????????d??
C__inference_dense_3_layer_call_and_return_conditional_losses_517379e4?1
*?'
%?"
inputs?????????d?
? ")?&
?
0?????????d
? ?
(__inference_dense_3_layer_call_fn_517349X4?1
*?'
%?"
inputs?????????d?
? "??????????d?
A__inference_dense_layer_call_and_return_conditional_losses_517175e3?0
)?&
$?!
inputs?????????d
? "*?'
 ?
0?????????d?
? ?
&__inference_dense_layer_call_fn_517145X3?0
)?&
$?!
inputs?????????d
? "??????????d??
E__inference_dropout_1_layer_call_and_return_conditional_losses_517258f8?5
.?+
%?"
inputs?????????d?
p 
? "*?'
 ?
0?????????d?
? ?
E__inference_dropout_1_layer_call_and_return_conditional_losses_517262f8?5
.?+
%?"
inputs?????????d?
p
? "*?'
 ?
0?????????d?
? ?
*__inference_dropout_1_layer_call_fn_517248Y8?5
.?+
%?"
inputs?????????d?
p 
? "??????????d??
*__inference_dropout_1_layer_call_fn_517253Y8?5
.?+
%?"
inputs?????????d?
p
? "??????????d??
E__inference_dropout_2_layer_call_and_return_conditional_losses_517326f8?5
.?+
%?"
inputs?????????d?
p 
? "*?'
 ?
0?????????d?
? ?
E__inference_dropout_2_layer_call_and_return_conditional_losses_517330f8?5
.?+
%?"
inputs?????????d?
p
? "*?'
 ?
0?????????d?
? ?
*__inference_dropout_2_layer_call_fn_517316Y8?5
.?+
%?"
inputs?????????d?
p 
? "??????????d??
*__inference_dropout_2_layer_call_fn_517321Y8?5
.?+
%?"
inputs?????????d?
p
? "??????????d??
E__inference_dropout_3_layer_call_and_return_conditional_losses_517394d7?4
-?*
$?!
inputs?????????d
p 
? ")?&
?
0?????????d
? ?
E__inference_dropout_3_layer_call_and_return_conditional_losses_517398d7?4
-?*
$?!
inputs?????????d
p
? ")?&
?
0?????????d
? ?
*__inference_dropout_3_layer_call_fn_517384W7?4
-?*
$?!
inputs?????????d
p 
? "??????????d?
*__inference_dropout_3_layer_call_fn_517389W7?4
-?*
$?!
inputs?????????d
p
? "??????????d?
C__inference_dropout_layer_call_and_return_conditional_losses_517190f8?5
.?+
%?"
inputs?????????d?
p 
? "*?'
 ?
0?????????d?
? ?
C__inference_dropout_layer_call_and_return_conditional_losses_517194f8?5
.?+
%?"
inputs?????????d?
p
? "*?'
 ?
0?????????d?
? ?
(__inference_dropout_layer_call_fn_517180Y8?5
.?+
%?"
inputs?????????d?
p 
? "??????????d??
(__inference_dropout_layer_call_fn_517185Y8?5
.?+
%?"
inputs?????????d?
p
? "??????????d??
H__inference_general_conv_layer_call_and_return_conditional_losses_516958????
u?r
p?m
'?$
inputs/0?????????d?
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp "*?'
 ?
0?????????d?
? ?
H__inference_general_conv_layer_call_and_return_conditional_losses_516992????
u?r
p?m
'?$
inputs/0?????????d?
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp"*?'
 ?
0?????????d?
? ?
-__inference_general_conv_layer_call_fn_516911????
u?r
p?m
'?$
inputs/0?????????d?
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp "??????????d??
-__inference_general_conv_layer_call_fn_516923????
u?r
p?m
'?$
inputs/0?????????d?
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp"??????????d??
G__inference_general_gnn_layer_call_and_return_conditional_losses_516310?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p 
? ")?&
?
0?????????d
? ?
G__inference_general_gnn_layer_call_and_return_conditional_losses_516454?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p
? ")?&
?
0?????????d
? ?
,__inference_general_gnn_layer_call_fn_516133?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p 
? "??????????d?
,__inference_general_gnn_layer_call_fn_516161?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p
? "??????????d?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515772?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p 
? ")?&
?
0?????????d
? ?
H__inference_gnnca_simple_layer_call_and_return_conditional_losses_515916?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p
? ")?&
?
0?????????d
? ?
-__inference_gnnca_simple_layer_call_fn_515595?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p 
? "??????????d?
-__inference_gnnca_simple_layer_call_fn_515623?
??
x?u
o?l
&?#
inputs/0?????????d
B??'?$
???????????????????
?SparseTensorSpec 
p
? "??????????d?
A__inference_mlp_1_layer_call_and_return_conditional_losses_515210l9?6
/?,
&?#
input_1?????????d?
p 
? ")?&
?
0?????????d
? ?
A__inference_mlp_1_layer_call_and_return_conditional_losses_515223l9?6
/?,
&?#
input_1?????????d?
p
? ")?&
?
0?????????d
? ?
A__inference_mlp_1_layer_call_and_return_conditional_losses_516697k8?5
.?+
%?"
inputs?????????d?
p 
? ")?&
?
0?????????d
? ?
A__inference_mlp_1_layer_call_and_return_conditional_losses_516755k8?5
.?+
%?"
inputs?????????d?
p
? ")?&
?
0?????????d
? ?
&__inference_mlp_1_layer_call_fn_515145_9?6
/?,
&?#
input_1?????????d?
p 
? "??????????d?
&__inference_mlp_1_layer_call_fn_515197_9?6
/?,
&?#
input_1?????????d?
p
? "??????????d?
&__inference_mlp_1_layer_call_fn_516624^8?5
.?+
%?"
inputs?????????d?
p 
? "??????????d?
&__inference_mlp_1_layer_call_fn_516637^8?5
.?+
%?"
inputs?????????d?
p
? "??????????d?
?__inference_mlp_layer_call_and_return_conditional_losses_514830l8?5
.?+
%?"
input_1?????????d
p 
? "*?'
 ?
0?????????d?
? ?
?__inference_mlp_layer_call_and_return_conditional_losses_514843l8?5
.?+
%?"
input_1?????????d
p
? "*?'
 ?
0?????????d?
? ?
?__inference_mlp_layer_call_and_return_conditional_losses_516553k7?4
-?*
$?!
inputs?????????d
p 
? "*?'
 ?
0?????????d?
? ?
?__inference_mlp_layer_call_and_return_conditional_losses_516611k7?4
-?*
$?!
inputs?????????d
p
? "*?'
 ?
0?????????d?
? ?
$__inference_mlp_layer_call_fn_514765_8?5
.?+
%?"
input_1?????????d
p 
? "??????????d??
$__inference_mlp_layer_call_fn_514817_8?5
.?+
%?"
input_1?????????d
p
? "??????????d??
$__inference_mlp_layer_call_fn_516480^7?4
-?*
$?!
inputs?????????d
p 
? "??????????d??
$__inference_mlp_layer_call_fn_516493^7?4
-?*
$?!
inputs?????????d
p
? "??????????d??
H__inference_sequential_1_layer_call_and_return_conditional_losses_515099vC?@
9?6
,?)
dense_2_input?????????d?
p 

 
? ")?&
?
0?????????d
? ?
H__inference_sequential_1_layer_call_and_return_conditional_losses_515117vC?@
9?6
,?)
dense_2_input?????????d?
p

 
? ")?&
?
0?????????d
? ?
H__inference_sequential_1_layer_call_and_return_conditional_losses_517078o<?9
2?/
%?"
inputs?????????d?
p 

 
? ")?&
?
0?????????d
? ?
H__inference_sequential_1_layer_call_and_return_conditional_losses_517136o<?9
2?/
%?"
inputs?????????d?
p

 
? ")?&
?
0?????????d
? ?
-__inference_sequential_1_layer_call_fn_514962iC?@
9?6
,?)
dense_2_input?????????d?
p 

 
? "??????????d?
-__inference_sequential_1_layer_call_fn_515081iC?@
9?6
,?)
dense_2_input?????????d?
p

 
? "??????????d?
-__inference_sequential_1_layer_call_fn_517005b<?9
2?/
%?"
inputs?????????d?
p 

 
? "??????????d?
-__inference_sequential_1_layer_call_fn_517018b<?9
2?/
%?"
inputs?????????d?
p

 
? "??????????d?
F__inference_sequential_layer_call_and_return_conditional_losses_514719t@?=
6?3
)?&
dense_input?????????d
p 

 
? "*?'
 ?
0?????????d?
? ?
F__inference_sequential_layer_call_and_return_conditional_losses_514737t@?=
6?3
)?&
dense_input?????????d
p

 
? "*?'
 ?
0?????????d?
? ?
F__inference_sequential_layer_call_and_return_conditional_losses_516841o;?8
1?.
$?!
inputs?????????d
p 

 
? "*?'
 ?
0?????????d?
? ?
F__inference_sequential_layer_call_and_return_conditional_losses_516899o;?8
1?.
$?!
inputs?????????d
p

 
? "*?'
 ?
0?????????d?
? ?
+__inference_sequential_layer_call_fn_514582g@?=
6?3
)?&
dense_input?????????d
p 

 
? "??????????d??
+__inference_sequential_layer_call_fn_514701g@?=
6?3
)?&
dense_input?????????d
p

 
? "??????????d??
+__inference_sequential_layer_call_fn_516768b;?8
1?.
$?!
inputs?????????d
p 

 
? "??????????d??
+__inference_sequential_layer_call_fn_516781b;?8
1?.
$?!
inputs?????????d
p

 
? "??????????d??
$__inference_signature_wrapper_516105?
???
? 
???
.
args_0$?!
args_0?????????d
.
args_0_1"?
args_0_1?????????	
*
args_0_2?
args_0_2?????????
!
args_0_3?
args_0_3	"7?4
2
output_1&?#
output_1?????????d?
__inference_steps_516075?
???
{?x
f?c
?
inputs/0d
B??'?$
???????????????????
?SparseTensorSpec 
?
steps 
?

trainingp"?d