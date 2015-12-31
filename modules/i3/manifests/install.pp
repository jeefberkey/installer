# install i3 and Airblader/i3 on top of it
class i3::install {

  package { [ 'i3','python-imaging']: ensure => latest, }

  if $::i3::gaps {
    ensure_packages([ 'libev-devel','libxcb-devel','libXinerama-devel','libxkbcommon-devel','libxkbcommon-x11-devel','libXrandr-devel','pango-devel','pcre-devel','startup-notification-devel','xcb-util-cursor-devel','xcb-util-devel','xcb-util-keysyms-devel','xcb-util-wm-devel','yajl-devel', ])
    $repo_location = "$::i3::working_dir/i3-gaps"

    vcsrepo { $repo_location:
      ensure   => latest,
      provider => git,
      source   => 'https://github.com/Airblader/i3.git',
      revision => $::i3::branch,
    }
    ~>
    exec { 'i3-gaps-make-make_install':
      cwd       => $repo_location,
      command   => 'make && make install',
      logoutput => true,
    }
  }

}