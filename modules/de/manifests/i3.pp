# compiles and installs i3 and related software for DE
class de::i3 {
  $src_dir = "/home/$::de::user/src"

  ensure_packages([

    ])

    include '::de::i3::xcb-util-xrm'
    include '::de::i3::i3-gaps'
    include '::de::i3::compton'
    include '::de::i3::dunst'
    include '::de::i3::i3blocks-gaps'
    include '::de::i3::i3blocks-contrib'
    include '::de::i3::rofi'
    include '::de::i3::fonts'

    Class['::de::i3::xcb-util-xrm']     -> Class['::de::i3::i3-gaps']
    Class['::de::i3::i3blocks-contrib'] -> Class['::de::i3::i3blocks-gaps']
    Class['::de::i3::i3-gaps']          -> Class['::de::i3::i3blocks-gaps']
}