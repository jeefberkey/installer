# compiles and installs i3 and related software for DE
class de::i3 {
  $src_dir = $::de::configdir

  include '::de::i3::xcb_util_xrm'
  include '::de::i3::i3_gaps'
  include '::de::i3::compton'
  include '::de::i3::dunst'
  include '::de::i3::i3blocks_gaps'
  include '::de::i3::i3blocks_contrib'
  include '::de::i3::rofi'
  include '::de::i3::fonts'

  Class['::de::i3::xcb_util_xrm']     -> Class['::de::i3::i3_gaps']
  Class['::de::i3::i3blocks_contrib'] -> Class['::de::i3::i3blocks_gaps']
  Class['::de::i3::i3_gaps']          -> Class['::de::i3::i3blocks_gaps']
}