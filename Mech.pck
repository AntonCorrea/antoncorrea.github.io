GDPC                                                                            
   <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�      U      -��`�0��x�5�[   res://Game.tscn �      >      �Ioەå[��d�*�v   res://camera_follow.gd.remap�3      (       ��:*��i]LU-   res://camera_follow.gdc       �      �z���pM�I��23�   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://icon.png  �3      �      G1?��z�c��vN��   res://icon.png.import   �,      �      �����%��(#AB�    res://player_control.gd.remap   �3      )       t~���E����i:�v4   res://player_control.gdcp/            ll�`rg�L#^]    res://project.binary�@      �      [��m\�����"    [gd_scene load_steps=23 format=2]

[ext_resource path="res://player_control.gd" type="Script" id=1]
[ext_resource path="res://camera_follow.gd" type="Script" id=2]

[sub_resource type="BoxShape" id=5]
extents = Vector3( 25, 1, 25 )

[sub_resource type="PlaneMesh" id=6]
size = Vector2( 50, 50 )

[sub_resource type="OpenSimplexNoise" id=7]

[sub_resource type="NoiseTexture" id=8]
noise = SubResource( 7 )

[sub_resource type="SpatialMaterial" id=9]
albedo_color = Color( 0.239216, 0.803922, 0.0352941, 1 )
albedo_texture = SubResource( 8 )

[sub_resource type="CapsuleShape" id=10]
margin = 0.001
radius = 1.5
height = 2.0

[sub_resource type="CapsuleMesh" id=11]
radius = 1.5
mid_height = 2.0

[sub_resource type="SpatialMaterial" id=12]
albedo_color = Color( 1, 0, 0, 1 )

[sub_resource type="CubeMesh" id=13]

[sub_resource type="SpatialMaterial" id=14]
albedo_color = Color( 0, 0, 0, 1 )

[sub_resource type="SphereShape" id=3]

[sub_resource type="SphereMesh" id=4]

[sub_resource type="OpenSimplexNoise" id=18]

[sub_resource type="NoiseTexture" id=19]
noise = SubResource( 18 )

[sub_resource type="SpatialMaterial" id=20]
albedo_color = Color( 0.968627, 1, 0, 1 )
albedo_texture = SubResource( 19 )

[sub_resource type="BoxShape" id=1]

[sub_resource type="CubeMesh" id=2]

[sub_resource type="OpenSimplexNoise" id=15]

[sub_resource type="NoiseTexture" id=16]
width = 1024
height = 1024
noise = SubResource( 15 )

[sub_resource type="SpatialMaterial" id=17]
albedo_color = Color( 0, 0.109804, 1, 1 )
albedo_texture = SubResource( 16 )

[node name="Spatial" type="Spatial"]

[node name="Ground" type="StaticBody" parent="."]

[node name="CollisionShape" type="CollisionShape" parent="Ground"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0 )
shape = SubResource( 5 )

[node name="MeshInstance" type="MeshInstance" parent="Ground/CollisionShape"]
mesh = SubResource( 6 )
material/0 = SubResource( 9 )

[node name="Camera" type="Camera" parent="."]
transform = Transform( 0.707107, -0.612373, 0.353553, 0, 0.5, 0.866026, -0.707107, -0.612373, 0.353553, 14.0498, 19.4705, 14.0498 )
current = true
script = ExtResource( 2 )
target_path = NodePath("../KinematicBody")

[node name="KinematicBody" type="KinematicBody" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 6, 0, 14 )
script = ExtResource( 1 )
ROT_SPEED = 4

[node name="CollisionShape" type="CollisionShape" parent="KinematicBody"]
transform = Transform( 1, 0, 0, 0, -1.62921e-07, -1, 0, 1, -1.62921e-07, 0, 2, 0 )
shape = SubResource( 10 )

[node name="MeshInstance" type="MeshInstance" parent="KinematicBody/CollisionShape"]
mesh = SubResource( 11 )
material/0 = SubResource( 12 )

[node name="MeshInstance2" type="MeshInstance" parent="KinematicBody/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0.613617, -0.926939 )
mesh = SubResource( 13 )
material/0 = SubResource( 14 )

[node name="Sphere" type="RigidBody" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 7, 17, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Sphere"]
shape = SubResource( 3 )

[node name="MeshInstance" type="MeshInstance" parent="Sphere/CollisionShape"]
mesh = SubResource( 4 )
material/0 = SubResource( 20 )

[node name="Wall" type="Spatial" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 5, 0, -12 )

[node name="Cube1" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube1"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube1/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube2" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -2, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube2"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube2/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube3" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 1, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube3"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube3/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube4" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube4"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube4/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube5" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -2, 3, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube5"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube5/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube6" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 3, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube6"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube6/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube7" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 5, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube7"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube7/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube8" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -2, 5, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube8"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube8/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )

[node name="Cube9" type="RigidBody" parent="Wall"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 5, 0 )

[node name="CollisionShape" type="CollisionShape" parent="Wall/Cube9"]
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="Wall/Cube9/CollisionShape"]
mesh = SubResource( 2 )
material/0 = SubResource( 17 )
  GDSC            s      �����׶�   ����������޶   �����¶�   �������Ӷ���   ����򶶶   ���¶���   �����϶�   ���������������۶���   �����ض�   �������Ŷ���   ����׶��   ���������������Ŷ���                         
                                 	      
                !      '      6      ;      =      >      ?      @      G      H      J      K      R      S      T      U      V      W      q      3YY8P�  Q;�  Y5;�  �  P�  QY:�  Y;�  YYYYYYY0�  PQV�  �  �  P�  T�  T�  �  T�  Q�  �?  P�  Q�  -YYYY0�	  P�
  QV�  �  -YY0�  P�
  QV�  �  �  �  �  �  �  T�  �  T�  P�  T�  T�  �  �  T�  Q�
  �  Y`             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG
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
GDSC         #   �      ������������϶��   ����������   ��������򶶶   �����϶�   �������Ŷ���   ����׶��   ���������������Ŷ���   ������ն   ����¶��   ����������������Ҷ��   ̶��   �������϶���   ���������Ҷ�   ������Ҷ   �������ض���   ϶��   �������������Ӷ�   
               move_foward             move_backward      
   turn_right     	   turn_left                                                              	      
                                        !      (      *      +      2      9      B      H      Q      W      `      j      s      |      �      �       �   !   �   "   �   #   3YYYYYYY8;�  Y8;�  �  YYY0�  PQV�  -YYYY0�  P�  QV�  -�  Y0�  P�  QV�  ;�  �  PQ�  &�  T�	  P�  QV�  �  T�
  �  �  &�  T�	  P�  QV�  �  T�
  �  �  &�  T�	  P�  QV�  �  P�  �  �  Q�  &�  T�	  P�  QV�  �  P�  �  �  Q�  �  T�  PQ�  �  �  T�  P�  P�  R�  R�  QR�  T�  Q�  �  �  �  �  P�  Q�  -Y`         [remap]

path="res://camera_follow.gdc"
        [remap]

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