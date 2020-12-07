GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex`Y      U      -��`�0��x�5�[   res://Body_mat.tres �      �       |F��U�P|�wZ�   res://Game.tscn @      0      �"B(U"j�j.1��   res://camera_follow.gd.remap0m      (       ��:*��i]LU-   res://camera_follow.gdc �4      �      �����O(Lt��6�z   res://default_env.tres  �:      �       um�`�N��<*ỳ�8   res://gui_3d.gd.remap   `m      !       ��C�z���z�4���   res://gui_3d.gdc@;            n*Nb(�t�?�!*^   res://gui_panel_3d.tscn `N      �
      o��	���l�X�ٞ�   res://icon.png  �m      �      G1?��z�c��vN��   res://icon.png.import   �f      �      �����%��(#AB�    res://player_control.gd.remap   �m      )       t~���E����i:�v4   res://player_control.gdc@i      �      w�Á����ӝ�q��   res://project.binary�z      �      [��m\�����"[gd_resource type="SpatialMaterial" format=2]

[resource]
albedo_color = Color( 0.164706, 0.203922, 0.505882, 1 )
roughness = 0.2
              [gd_scene load_steps=32 format=2]

[ext_resource path="res://player_control.gd" type="Script" id=1]
[ext_resource path="res://camera_follow.gd" type="Script" id=2]
[ext_resource path="res://Body_mat.tres" type="Material" id=3]
[ext_resource path="res://gui_panel_3d.tscn" type="PackedScene" id=4]

[sub_resource type="CapsuleShape" id=1]
margin = 0.001

[sub_resource type="CapsuleMesh" id=2]

[sub_resource type="SphereMesh" id=3]
radius = 0.5
height = 1.0

[sub_resource type="SpatialMaterial" id=4]
albedo_color = Color( 0.168627, 0.141176, 0.141176, 1 )
metallic = 1.0
roughness = 0.0

[sub_resource type="CubeMesh" id=5]
size = Vector3( 0.5, 0.5, 1 )

[sub_resource type="BoxShape" id=11]

[sub_resource type="CubeMesh" id=12]

[sub_resource type="OpenSimplexNoise" id=13]

[sub_resource type="NoiseTexture" id=14]
width = 1024
height = 1024
noise = SubResource( 13 )

[sub_resource type="SpatialMaterial" id=15]
albedo_color = Color( 0, 0.109804, 1, 1 )
albedo_texture = SubResource( 14 )

[sub_resource type="SpatialMaterial" id=26]
albedo_color = Color( 1, 0, 0, 1 )
albedo_texture = SubResource( 14 )

[sub_resource type="BoxShape" id=27]
extents = Vector3( 2, 2, 2 )

[sub_resource type="SphereShape" id=6]

[sub_resource type="SphereMesh" id=7]

[sub_resource type="OpenSimplexNoise" id=8]

[sub_resource type="NoiseTexture" id=9]
noise = SubResource( 8 )

[sub_resource type="SpatialMaterial" id=10]
albedo_color = Color( 0.968627, 1, 0, 1 )
albedo_texture = SubResource( 9 )

[sub_resource type="BoxShape" id=16]
extents = Vector3( 50, 1, 50 )

[sub_resource type="CubeMesh" id=17]
size = Vector3( 100, 2, 100 )

[sub_resource type="OpenSimplexNoise" id=24]

[sub_resource type="NoiseTexture" id=25]
noise = SubResource( 24 )

[sub_resource type="SpatialMaterial" id=18]
albedo_color = Color( 0.584314, 0.623529, 0.756863, 1 )
albedo_texture = SubResource( 25 )

[sub_resource type="BoxShape" id=19]
extents = Vector3( 50, 1, 1 )

[sub_resource type="CubeMesh" id=20]
size = Vector3( 100, 10, 1 )

[sub_resource type="OpenSimplexNoise" id=21]

[sub_resource type="NoiseTexture" id=22]
width = 5120
height = 5120
noise = SubResource( 21 )

[sub_resource type="SpatialMaterial" id=23]
albedo_color = Color( 0.678431, 0.717647, 0.0352941, 1 )
albedo_texture = SubResource( 22 )
normal_enabled = true
normal_scale = 1.0
normal_texture = SubResource( 22 )

[node name="Root" type="Spatial"]

[node name="Camera" type="Camera" parent="."]
transform = Transform( -0.866025, 0, 0.5, 0, 1, 0, -0.5, 0, -0.866025, 0, 35.769, 0 )
current = true
size = 15.0
script = ExtResource( 2 )
camera_type = 2
interpolation_delta = 10.0
camera_pivot_path = NodePath("../Player/CameraPivots")

[node name="Player" type="KinematicBody" parent="." groups=[
"player_group",
]]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2, -11 )
script = ExtResource( 1 )
ROT_SPEED = 4

[node name="CollisionShape" type="CollisionShape" parent="Player"]
transform = Transform( 1, 0, 0, 0, -1.62921e-07, -1, 0, 1, -1.62921e-07, 0, 0, 0 )
shape = SubResource( 1 )

[node name="Body" type="MeshInstance" parent="Player/CollisionShape"]
mesh = SubResource( 2 )
material/0 = ExtResource( 3 )

[node name="Visor" type="MeshInstance" parent="Player/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -0.75, -0.48 )
mesh = SubResource( 3 )
material/0 = SubResource( 4 )

[node name="R_arm" type="MeshInstance" parent="Player/CollisionShape"]
transform = Transform( -1, -1.57254e-07, 1.68588e-07, -8.01375e-09, -0.707107, -0.707107, 2.30405e-07, -0.707107, 0.707107, 1, -0.25, 0 )
mesh = SubResource( 5 )
material/0 = ExtResource( 3 )

[node name="L_arm" type="MeshInstance" parent="Player/CollisionShape"]
transform = Transform( -1, -1.57254e-07, 1.68588e-07, -8.01375e-09, -0.707107, -0.707107, 2.30405e-07, -0.707107, 0.707107, -1, -0.25, 0 )
mesh = SubResource( 5 )
material/0 = ExtResource( 3 )

[node name="R_arm2" type="MeshInstance" parent="Player/CollisionShape"]
transform = Transform( -1, -3.25841e-07, 2.38418e-07, -2.38418e-07, -3.11933e-07, -1, 3.25841e-07, -1, 3.11933e-07, 1, -1, 0.25 )
mesh = SubResource( 5 )
material/0 = ExtResource( 3 )

[node name="L_arm2" type="MeshInstance" parent="Player/CollisionShape"]
transform = Transform( -1, -3.25841e-07, 2.38418e-07, -2.38418e-07, -3.11933e-07, -1, 3.25841e-07, -1, 3.11933e-07, -1, -1, 0.25 )
mesh = SubResource( 5 )
material/0 = ExtResource( 3 )

[node name="CameraPivots" type="Spatial" parent="Player"]

[node name="FPS" type="Spatial" parent="Player/CameraPivots"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0.307051, -0.872156 )

[node name="TPS" type="Spatial" parent="Player/CameraPivots"]
transform = Transform( 1, 0, 0, 0, 0.992584, 0.121557, 0, -0.121557, 0.992584, 2.57339, 2.52856, 7 )

[node name="Perspective" type="Spatial" parent="Player/CameraPivots"]
transform = Transform( 0.707107, -0.429293, 0.561878, 0, 0.794616, 0.607113, -0.707107, -0.429293, 0.561878, 6.22474, 6.73205, 7.22474 )

[node name="Isometric" type="Spatial" parent="Player/CameraPivots"]
transform = Transform( 0.707107, -0.429293, 0.561878, 0, 0.794616, 0.607113, -0.707107, -0.429293, 0.561878, 13.4589, 14.5486, 14.4589 )

[node name="Level" type="Spatial" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -0.5, 0 )

[node name="Blocks" type="Spatial" parent="Level"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 5, 1, -12 )

[node name="Cube1" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube1"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube1/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube2" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -2, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube2"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube2/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube3" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube3"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube3/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube4" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube4"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube4/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube5" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -2, 3, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube5"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube5/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube6" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 3, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube6"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube6/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube7" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 5, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube7"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube7/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube8" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -2, 5, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube8"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube8/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube9" type="RigidBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 5, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube9"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube9/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 15 )

[node name="Cube10Camera Change" type="StaticBody" parent="Level/Blocks"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 12, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube10Camera Change"]
shape = SubResource( 11 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Blocks/Cube10Camera Change/CollisionShape"]
mesh = SubResource( 12 )
material/0 = SubResource( 26 )

[node name="Area" type="Area" parent="Level/Blocks/Cube10Camera Change"]

[node name="CollisionShape" type="CollisionShape" parent="Level/Blocks/Cube10Camera Change/Area"]
shape = SubResource( 27 )

[node name="Sphere" type="RigidBody" parent="Level"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 7, 17.5, 0 )
mass = 10.0

[node name="CollisionShape" type="CollisionShape" parent="Level/Sphere"]
shape = SubResource( 6 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Sphere/CollisionShape"]
mesh = SubResource( 7 )
material/0 = SubResource( 10 )

[node name="Bounds" type="Spatial" parent="Level"]

[node name="Ground" type="StaticBody" parent="Level/Bounds"]

[node name="CollisionShape" type="CollisionShape" parent="Level/Bounds/Ground"]
shape = SubResource( 16 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Bounds/Ground/CollisionShape"]
mesh = SubResource( 17 )
material/0 = SubResource( 18 )

[node name="Bound1" type="StaticBody" parent="Level/Bounds"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2, -50 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Bounds/Bound1"]
shape = SubResource( 19 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Bounds/Bound1/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3.62902, 0 )
mesh = SubResource( 20 )
material/0 = SubResource( 23 )

[node name="Bound2" type="StaticBody" parent="Level/Bounds"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2, 50 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Bounds/Bound2"]
shape = SubResource( 19 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Bounds/Bound2/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3.62902, 0 )
mesh = SubResource( 20 )
material/0 = SubResource( 23 )

[node name="Bound3" type="StaticBody" parent="Level/Bounds"]
transform = Transform( -1.62921e-07, 0, 1, 0, 1, 0, -1, 0, -1.62921e-07, 50, 2, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Bounds/Bound3"]
shape = SubResource( 19 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Bounds/Bound3/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3.62902, 0 )
mesh = SubResource( 20 )
material/0 = SubResource( 23 )

[node name="Bound4" type="StaticBody" parent="Level/Bounds"]
transform = Transform( -1.62921e-07, 0, 1, 0, 1, 0, -1, 0, -1.62921e-07, -50, 2, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Level/Bounds/Bound4"]
shape = SubResource( 19 )

[node name="MeshInstance" type="MeshInstance" parent="Level/Bounds/Bound4/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3.62902, 0 )
mesh = SubResource( 20 )
material/0 = SubResource( 23 )

[node name="DirectionalLight" type="DirectionalLight" parent="."]
transform = Transform( 0.878875, 0.334809, -0.339825, 0, 0.712345, 0.70183, 0.477051, -0.616821, 0.626062, -7.81406, 21.1955, 14.3959 )
shadow_enabled = true

[node name="GUIPanel3D" parent="." instance=ExtResource( 4 )]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 23, 4, -12 )
[connection signal="body_entered" from="Level/Blocks/Cube10Camera Change/Area" to="Camera" method="_on_Area_body_entered"]
 GDSC      
   )   �      �����׶�   ����������Ӷ   ������������������׶   ����������������޶��   �����������¶���   �������Ӷ���   ����¶��   �������������������Ķ���   �����϶�   �����������¶���   ���������������Ŷ���   ����׶��   ���������������۶���   ���������������޶���   �����ض�   ���������¶�   ������¶   ��������Ҷ��   ���������ض�   ������������������������   ����������������������   ��������������������Ҷ��   ���϶���   ����������ƶ      FPS       TPS       Perspective    	   Isometric                                  player_group                                           !      *      +   	   .   
   3      4      5      6      7      8      >      B      C      J      K      Q      b      e      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   3YY8P�  RR�  R�  R�  Q;�  Y8P�  Q;�  YY8P�  Q;�  Y5;�  �  P�  Q�  Y;�  Y;�  V�  YYYYYY0�  PQV�  �	  PQYY0�
  P�  QV�  �  &�  	�  V�  �  �  T�  P�  T�  RP�  �  QQ�  (V�  �  T�  �  T�  P�  T�  PQT�  T�  �  �  T�  QP�  �  Q�  �  P�  T�  PQT�  T�  R�  P�  R�  R�  QQY0�	  PQV�  �  �  T�  P�  Q�  �  �  P�  T�  T�  �  T�  PQT�  T�  Q�  &�  �  V�  �  T�  �  (V�  �  T�  YY0�  P�  QV�  &�  T�  P�  QV�  �  �  �  &�  �	  V�  �  �  �  �	  PQ�  -Y`   [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDSC   M      �   [     ������ڶ   �������������Ӷ�   ��������������Ӷ   ������������Ҷ��   �������������Ņ򶶶�   �������������ń򶶶�   ������������¶��   �������¶���   ��������Ҷ��   ���Ҷ���   ��������׶��   ���׶���   �����϶�   ������¶   �������������������ڶ���   ��������������������Ӷ��   ����������Ŷ   �������Ŷ���   �����׶�   �����������������������Ҷ���   ������������������׶   ���������������¶���   ����¶��   �������������¶�   ����������¶   ��������������������ض��   ��������������������ض��   �������������������Ѷ���   ��������������������޶��   �����������Ӷ���   ����¶��   ���޶���   ���Ӷ���   ������Ҷ   ��������Ņ�   ���������Ӷ�   ��������������ض   ���������������۶���   �������������Ӷ�   ��������   ��������ń�   ζ��   ϶��   �������ض���   �������Ӷ���   �����׶�   �����������¶���   ���������׶�   ���۶���   �����������������ض�   ���¶���   �����������������������ٶ���   ��������۶��   �����ض�   �ٶ�   �����������������ڶ�   �����¶�   ��������Ҷ��   �����������������Ӷ�   ������������϶��   ��������������Ķ   ����Ŷ��   �����Ҷ�   ��������ڶ��   �������¶���   ��������¶��   ���Ӷ���   ����������ٶ   �������������Ӷ�   ���ݶ���   ����������ض   ̶��   ������¶   �涶   ������������������ڶ   ��������   �������ض���                 mouse_entered         _mouse_entered_area                       d                                                       	      
                            '      .      7      8      >      I      J      K      X      ]      ^      _      f      g      k      l      m      s       w   !   x   "   y   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?   �   @   �   A   �   B   �   C   �   D   �   E   �   F     G     H     I     J     K   "  L   #  M   $  N   %  O   &  P   5  Q   6  R   7  S   8  T   B  U   L  V   M  W   Y  X   e  Y   f  Z   g  [   u  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t   �  u   �  v   �  w   �  x   �  y     z     {     |     }     ~         *  �   /  �   2  �   5  �   6  �   7  �   >  �   ?  �   E  �   `  �   |  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �   %  �   &  �   '  �   -  �   <  �   =  �   H  �   I  �   J  �   Y  �   3YYY;�  YY;�  YY;�  YY;�  �  YY;�  �  YY5;�  W�  Y5;�  W�	  Y5;�
  W�	  �  YY0�  PQV�  �
  T�  P�  RR�  QY�  �  &�  T�  P�  QT�  �  V�  �  PQYYY0�  P�  QV�  �  �  PQYYY0�  PQV�  �  �  YYY0�  P�  QV�  �  ;�  �  )�  L�  R�  R�  R�  MV�  &�  4�  V�  �  �  �  +Y�  �  �  �  &�  P�  �  QV�  �  P�  Q�  '�  V�  �  T�  P�  QYYYY0�  P�  QV�  �  �  �  T�  T�   Y�  �  &�  4�  �  4�  V�  �  �  T�!  Y�  �  ;�"  �#  P�  T�$  QY�  �  �  �  �"  �  �  &�  V�  �  �  �"  �
  T�%  T�&  PQ�"  �  �  �"  �  (V�  �"  �  �  &�"  �  V�  �"  �  T�'  Y�  Y�  �  ;�(  �  P�"  T�)  R�"  T�*  QY�  �  �  �(  T�)  �  T�)  �  �  �(  T�*  �  T�*  �  �  �  �(  T�)  �(  T�)  �  T�)  �  �(  T�*  �(  T�*  �  T�*  Y�  �  �(  T�)  �(  T�)  �  T�   T�)  �  �(  T�*  �(  T�*  �  T�   T�*  �  Y�  �  �  T�+  �(  �  �  T�$  �(  Y�  �  &�  4�  V�  �  &�  �  V�  �  T�,  �  P�  R�  Q�  �  �  (V�  �  T�,  �(  �  �  �  �  �(  Y�  �  �  T�  P�  QYYY0�#  P�$  QV�  ;�-  �.  PQT�/  PQY�  �  ;�0  �-  T�1  P�$  Q�  ;�2  �3  P�-  T�4  T�5  Q�  ;�6  �0  �-  T�7  P�$  Q�2  YY�  �  ;�8  �9  PQT�:  T�;  P�0  R�6  RLMR�
  T�<  RR�  QY�  &�8  T�   PQ�  V�  .�8  T�+  �  (V�  .�  YYY0�3  P�5  QV�  �  ;�=  LM�  �=  T�>  P�
  T�?  P�  P�  T�)  �  R�  T�*  �  R�  QQQ�  �=  T�>  P�
  T�?  P�  P�  T�)  �  R�  T�*  �  R�  QQQ�  �=  T�>  P�
  T�?  P�  P�  T�)  �  R�  T�*  �  R�  QQQ�  �=  T�>  P�
  T�?  P�  P�  T�)  �  R�  T�*  �  R�  QQQY�  �  ;�@  �  �  ;�A  �  )�B  �=  V�  �A  �5  T�C  P�B  Q�  &�A  �@  V�  �@  �A  Y�  .�@  YYY0�  PQV�  ;�D  �  T�  P�  QT�  Y�  �  &�D  �  V�  �  ;�-  �.  PQT�/  PQ�  �  ;�E  �-  T�?  P�  P�  R�  R�  QQ�-  T�%  T�5  �  �E  �
  T�F  �E  Y�  �  &�D  �  V�  �E  �  P�E  T�)  R�  R�E  T�G  QY�  �
  T�H  P�E  R�  T�I  QY�  �  �
  T�J  P�  T�K  R�-  T�L  T�G  QY`    [gd_scene load_steps=7 format=2]

[ext_resource path="res://gui_3d.gd" type="Script" id=1]
[ext_resource path="res://icon.png" type="Texture" id=2]

[sub_resource type="QuadMesh" id=1]
size = Vector2( 3, 2 )

[sub_resource type="ViewportTexture" id=2]
viewport_path = NodePath("Viewport")

[sub_resource type="SpatialMaterial" id=3]
resource_local_to_scene = true
flags_transparent = true
flags_unshaded = true
flags_albedo_tex_force_srgb = true
albedo_texture = SubResource( 2 )

[sub_resource type="BoxShape" id=4]
extents = Vector3( 1.5, 1, 0.05 )

[node name="GUIPanel3D" type="Spatial"]
script = ExtResource( 1 )

[node name="Viewport" type="Viewport" parent="."]
size = Vector2( 280, 180 )
hdr = false
usage = 0
render_target_v_flip = true
render_target_update_mode = 3

[node name="GUI" type="Control" parent="Viewport"]
margin_right = 280.0
margin_bottom = 180.0
mouse_filter = 1

[node name="Panel" type="Panel" parent="Viewport/GUI"]
anchor_right = 1.0
anchor_bottom = 1.0

[node name="Label" type="Label" parent="Viewport/GUI/Panel"]
margin_left = 44.0
margin_top = 27.0
margin_right = 121.0
margin_bottom = 41.0
text = "Hello world!"

[node name="Button" type="Button" parent="Viewport/GUI/Panel"]
margin_left = 14.0
margin_top = 46.0
margin_right = 154.0
margin_bottom = 74.0
text = "A button!"

[node name="TextEdit" type="LineEdit" parent="Viewport/GUI/Panel"]
margin_left = 14.0
margin_top = 87.0
margin_right = 154.0
margin_bottom = 111.0

[node name="HSlider" type="HSlider" parent="Viewport/GUI/Panel"]
margin_left = 14.0
margin_top = 118.0
margin_right = 154.0
margin_bottom = 143.0
ticks_on_borders = true

[node name="ColorRect" type="ColorRect" parent="Viewport/GUI/Panel"]
margin_left = 180.0
margin_top = 26.0
margin_right = 244.0
margin_bottom = 90.0
color = Color( 1, 0, 0, 1 )

[node name="TextureRect" type="TextureRect" parent="Viewport/GUI/Panel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = 52.0
margin_top = -52.0
margin_right = 92.0
margin_bottom = -12.0
texture = ExtResource( 2 )
expand = true

[node name="VSlider" type="VSlider" parent="Viewport/GUI/Panel"]
margin_left = 260.0
margin_top = 26.0
margin_right = 276.0
margin_bottom = 166.0

[node name="OptionButton" type="OptionButton" parent="Viewport/GUI/Panel"]
margin_left = 170.0
margin_top = 111.0
margin_right = 252.0
margin_bottom = 165.0
text = "Item 0"
items = [ "Item 0", null, false, 0, null, "Item 1", null, false, 1, null, "Item 2", null, false, 2, null ]
selected = 0

[node name="Quad" type="MeshInstance" parent="."]
mesh = SubResource( 1 )
material/0 = SubResource( 3 )

[node name="Area" type="Area" parent="Quad"]
input_capture_on_drag = true
collision_layer = 2

[node name="CollisionShape" type="CollisionShape" parent="Quad/Area"]
shape = SubResource( 4 )
     GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDSC         "   �      ������������϶��   ����������   ��������򶶶   �����϶�   ���������������Ŷ���   ����׶��   ������ն   ����¶��   ����������������Ҷ��   ̶��   �������϶���   ���������Ҷ�   ������Ҷ   �������ض���   ϶��   �������������Ӷ�   
               move_foward             move_backward      
   turn_right     	   turn_left                                                              	      
                                        !      "      #      *      1      :      @      I      O      X      b      k      t      z      �      �       �   !   �   "   3YYYYYYY8;�  Y8;�  �  YYY0�  PQV�  -YYYY�  Y0�  P�  QV�  ;�  �  PQ�  &�  T�  P�  QV�  �  T�	  �  �  &�  T�  P�  QV�  �  T�	  �  �  &�  T�  P�  QV�  �
  P�  �  �  Q�  &�  T�  P�  QV�  �
  P�  �  �  Q�  �  T�  PQ�  �  �  T�  P�  P�  R�  R�  QR�  T�  Q�  �  �  �  �  P�  Q�  -Y`  [remap]

path="res://camera_follow.gdc"
        [remap]

path="res://gui_3d.gdc"
               [remap]

path="res://player_control.gdc"
       �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Mech   application/run/main_scene         res://Game.tscn    application/config/icon         res://icon.png     input/move_foward`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      unicode           echo          script         input/move_backward`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      unicode           echo          script         input/turn_left`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script         input/turn_right`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script      $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres   