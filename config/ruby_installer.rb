require 'ostruct'

module RubyInstaller
  module Version
    unless defined?(MAJOR)
      MAJOR = 3
      MINOR = 0
      REVISION = 0
    end
  end
  
  unless defined?(ROOT)
    # Root folder
    ROOT = File.join('c:', 'shoes_dev')

    # Downloads folder
    DOWNLOADS = File.join ROOT, 'downloads'

    # MinGW files
    MinGW = OpenStruct.new(
      :release => 'current',
      :version => '3.4.5',
      :url => "http://easynews.dl.sourceforge.net/mingw",
      :target => 'sandbox/mingw',
      :files => [
        'binutils-2.17.50-20060824-1.tar.gz',
        'gcc-core-3.4.5-20060117-3.tar.gz',
        'gcc-g++-3.4.5-20060117-3.tar.gz',
        'mingw-runtime-3.14.tar.gz',
        'mingw-utils-0.3.tar.gz',
        'w32api-3.11.tar.gz',
        'gdb-6.8-mingw-3.tar.bz2'
      ]
    )
    
    MSYS = OpenStruct.new(
      :release => 'technology-preview',
      :version => '1.0.11',
      :url => "http://easynews.dl.sourceforge.net/mingw",
      :target => 'sandbox/msys',
      :files => [
        'diffutils-2.8.7-MSYS-1.0.11-snapshot.tar.bz2',
        'findutils-4.3.0-MSYS-1.0.11-snapshot.tar.bz2',
        'gawk-3.1.5-MSYS-1.0.11-snapshot.tar.bz2',
        'msysCORE-1.0.11-2007.01.19-1.tar.bz2',
        'MSYS-1.0.11-20070729.tar.bz2',
        'coreutils-5.97-MSYS-1.0.11-snapshot.tar.bz2',
        'texinfo-4.11-MSYS-1.0.11.tar.bz2',
        'bash-3.1-MSYS-1.0.11-1.tar.bz2',
        'bison-2.3-MSYS-1.0.11.tar.bz2',
        'perl-5.6.1-MSYS-1.0.11.tar.bz2',
        'm4-1.4.7-MSYS.tar.bz2',
        'msys-autoconf-2.59.tar.bz2',
        'msys-automake-1.8.2.tar.bz2',
        'msys-libtool-1.5.tar.bz2'
      ]
    )
    
    Ruby18 = OpenStruct.new(
      :release => "preview1",
      :version => "1.8.7-p72",
      :url => "http://ftp.ruby-lang.org/pub/ruby/1.8",
      :checkout => 'http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8_6',
      :checkout_target => 'downloads/ruby_1_8',
      :target => 'sandbox/ruby_1_8',
      :build_target => 'sandbox/ruby_build',
      :install_target => RubyInstaller::MinGW.target,
      :configure_options => [
        '--enable-shared',
        '--with-winsock2',
        '--disable-install-doc',
        'optflags="-O0"',
        'debugflags="-g3 -ggdb"'
      ],
      :files => [
        'ruby-1.8.7-p72.tar.bz2'
      ],
      :dependencies => [
        'readline5.dll',
        'zlib1.dll',
        'libeay32.dll',
        'libssl32.dll',
        'libiconv2.dll',
        'pdcurses.dll',
        'gdbm3.dll'
      ]
    )

    Ruby19 = OpenStruct.new(
      :release => "p0",
      :version => "1.9.1",
      :url => "http://ftp.ruby-lang.org/pub/ruby/1.9",
      :checkout => 'http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_1',
      :checkout_target => 'downloads/ruby_1_9',
      :target => 'sandbox/ruby_1_9',
      :build_target => 'sandbox/ruby_build_1_9',
      :install_target => RubyInstaller::MinGW.target,
      :configure_options => [
        '--enable-shared',
        '--disable-install-doc',
        "optflags='-O0'",
        "debugflags='-g3 -ggdb'"
      ],
      :files => [
        'ruby-1.9.1-p0.tar.bz2'
      ],
      :dependencies => [
        'readline5.dll',
        'zlib1.dll',
        'libeay32.dll',
        'libssl32.dll',
        'libiconv2.dll',
        'pdcurses.dll',
        'gdbm3.dll'
      ]
    )

    Zlib = OpenStruct.new(
      :release => 'official',
      :version => "1.2.3",
      :url => "http://easynews.dl.sourceforge.net/gnuwin32",
      :target => RubyInstaller::MinGW.target,
      :files => [
        'zlib-1.2.3-bin.zip',
        'zlib-1.2.3-lib.zip'
      ]
    )
    
    # FIXME: using direct mirror for Readline since GnuWin32 seems failing
    # to grab a correct link (stack level too deep due redirections)
    Readline = OpenStruct.new(
      :release => "official",
      :version => "5.0",
      :url => "http://easynews.dl.sourceforge.net/sourceforge/gnuwin32",
      :target => RubyInstaller::MinGW.target,
      :files => [
        'readline-5.0-bin.zip',
        'readline-5.0-lib.zip'
      ]
    )

    PdCurses = OpenStruct.new(
      :version => '3.3',
      :url => "http://downloads.sourceforge.net/pdcurses",
      :target => RubyInstaller::MinGW.target,
      :files => [ 
        'pdc33dll.zip' 
      ]
    )
  
    ExtractUtils = OpenStruct.new(
        :url => "http://easynews.dl.sourceforge.net/sevenzip",
        :target => 'sandbox/extract_utils',
        :files => [
          '7za458.zip'
        ]
    )
    
    OpenSsl = OpenStruct.new(
      :url => "http://easynews.dl.sourceforge.net/gnuwin32",
      :version => '0.9.7.c',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'openssl-0.9.7c-bin.zip',
        'openssl-0.9.7c-lib.zip'
      ]
    )
    
    Iconv = OpenStruct.new(
      :release => 'official',
      :version => "1.9.2-1",
      :url => "http://easynews.dl.sourceforge.net/gnuwin32",
      :target => RubyInstaller::MinGW.target,
      :files => [
        'libiconv-1.9.2-1-bin.zip',
        'libiconv-1.9.2-1-lib.zip'
      ]
    )

    Gdbm = OpenStruct.new(
      :release => 'official',
      :version => '1.8.3-1',
      :url => "http://easynews.dl.sourceforge.net/gnuwin32",
      :target => RubyInstaller::MinGW.target,
      :files => [
        'gdbm-1.8.3-1-bin.zip',
        'gdbm-1.8.3-1-lib.zip',
        'gdbm-1.8.3-1-src.zip'
      ]
    )
    
    RubyGems = OpenStruct.new(
      :release => 'official',
      :version => '1.3.1',
      :url => 'http://rubyforge.org/frs/download.php/45905',
      :checkout => 'svn://rubyforge.org/var/svn/rubygems/trunk',
      :checkout_target => 'downloads/rubygems',
      :target => 'sandbox/rubygems',
      :install_target => RubyInstaller::MinGW.target,
      :configure_options => [
        '--no-ri',
        '--no-rdoc'
      ],
      :files => [
        'rubygems-1.3.1.tgz'
      ]
    )

    #Begin Shoes Dependencies

    Shoes = OpenStruct.new(
      :release => 'raisins',
      :version => 'r1134',
      :url => 'http://shoooes.net/dist',
      :checkout => 'git://github.com/ender672/shoes',
      :checkout_target => 'sandbox/shoes',
      :target => 'sandbox/shoes',
      
      :build_target => 'sandbox/shoes_build',
      :install_target => 'sandbox/shoes_mingw',
      :configure_options => [],
      :files => [
        'shoes2.tar.gz'
      ]
    )

    Winhttp = OpenStruct.new(
      :url => "http://www.holymonkey.com/shoes-packages",
      :target => RubyInstaller::MinGW.target,
      :files => ['winhttp.zip']
    )

    Glib = OpenStruct.new(
      :url => "http://ftp.gnome.org/pub/gnome/binaries/win32/glib/2.18",
      :version => '2.18.4-1',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'glib-dev_2.18.4-1_win32.zip',
        'glib_2.18.4-1_win32.zip'
      ]
    )

    LibUnGif = OpenStruct.new(
      :url => "http://easynews.dl.sourceforge.net/gnuwin32",
      :version => '',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'libungif-4.1.4-bin.zip',
        'libungif-4.1.4-lib.zip'
      ]
    )

    Sqlite3 = OpenStruct.new(
      :url => "http://www.sqlite.org",
      :target => 'sandbox/sqlite3',
      :files => [
        'sqlitedll-3_6_11.zip',
        'sqlite-amalgamation-3_6_11.zip'
      ]
    )

    PortAudio = OpenStruct.new(
      :url => "http://www.portaudio.com/archives",
      :target => 'sandbox/portaudio',
      :install_target => RubyInstaller::MinGW.target,
      :files => ['pa_snapshot.tgz']
    )

    LibJpeg = OpenStruct.new(
      :url => "http://easynews.dl.sourceforge.net/gnuwin32",
      :version => '6b',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'libjpeg-6b-bin.zip',
        'libjpeg-6b-lib.zip'
      ]
    )
    
    LibJpegPatch = OpenStruct.new(
      :url => "http://www.holymonkey.com/shoes-packages",
      :target => "sandbox/lib_jpeg_patch",
      :prepare_target => RubyInstaller::LibJpeg.target,
      :files => [
        'lib_jpeg_patch.zip'
      ]
    )

    Cairo = OpenStruct.new(
      :url => "http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies",
      :version => '1.8.6-1',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'cairo-dev_1.8.6-1_win32.zip',
        'cairo_1.8.6-1_win32.zip'
      ]
    )

    Pango = OpenStruct.new(
      :url => "http://ftp.gnome.org/pub/gnome/binaries/win32/pango/1.22",
      :version => '1.22.2-1',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'pango-dev_1.22.2-1_win32.zip',
        'pango_1.22.2-1_win32.zip'
      ]
    )

    LibPng = OpenStruct.new(
      :url => "http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/",
      :version => '1.2.35-1',
      :target => RubyInstaller::MinGW.target,
      :files => [
        'libpng_1.2.34-1_win32.zip',
        'libpng-dev_1.2.34-1_win32.zip'
      ]
    )
    
    Git = OpenStruct.new(
      :url => 'http://msysgit.googlecode.com/files',
      :target => 'sandbox/msysgit',
      :files => ['PortableGit-1.6.2.1-preview20090322.exe']
    )

    # End Shoes Dependencies

    Wix = OpenStruct.new(
      :release => 'stable',
      :version => '2.0.5805.1',
      :url => 'http://easynews.dl.sourceforge.net/wix',
      :target => 'sandbox/wix',
      :files => [
        'wix-2.0.5805.0-binaries.zip'
      ]
    )
    
    Paraffin = OpenStruct.new(
      :release => 'stable',
      :version => '2.0.5805.1',
      :url => 'http://www.wintellect.com/cs/files/folders/4332/download.aspx',
      :target => RubyInstaller::Wix.target,
      :files => [
        'Paraffin-1.03.zip'
      ]
    )
    
    Patches = OpenStruct.new(
     :url => 'http://dump.mmediasys.com/installer3',
     :target => 'sandbox/patches',
     :prepare_target => RubyInstaller::Ruby18.target,
     :files => [
        'patches.zip'
      ]
    )
    
    Runtime = OpenStruct.new(
      :version => '1.8.6-p114',
      :ruby_version_source => RubyInstaller::Ruby18.target,
      :rubygems_version_source => RubyInstaller::RubyGems.target,
      :namespace => 'runtime',
      :source => 'resources/installer',
      :package_name => 'ruby',
      :wix_config => {
          'ProductCode'=> "67F67970-2233-4AF9-9B41-7161F927617C",
          'UpgradeCode'=> "3E145ABF-D25C-4E4C-899E-5F043D3F9A33",
          'Year' =>  "2008",
          'ProductName' =>  "One-Click Ruby Installer 3.0",
          'InstallName' =>  "RubyInstaller",
          'InstallId' =>  "Ruby18",
          'DevKitInstallId' =>  "devkit",
          'ProductVersion' =>  "3.0.0",
          'ProductURL' =>  "http://rubyinstaller.rubyforge.org/",
          'RuntimeTitle' =>  "Ruby runtime",
          'RuntimeDescription' =>  "The Ruby runtime",
          'RubyTitle' =>  "Ruby",
          'RubyVersion' =>  "",
          'RubyDescription' =>  "The Ruby interpreter and standard library",
          'RubyGemsTitle' =>  "RubyGems",
          'RubyGemsDescription' =>  "The RubyGems package management system",
          'RubyGemsVersion' =>  ""
        },
      :config_file => 'config.wxi.erb'
    )
    
    DevKit = OpenStruct.new(
      :version => RubyInstaller::Runtime.version,
      :ruby_version_source => RubyInstaller::Ruby18.target,
      :rubygems_version_source => RubyInstaller::RubyGems.target,
      :namespace => 'devkit',
      :source => RubyInstaller::Runtime.source,
      :package_name => 'ruby_devkit',
      :wix_config   => RubyInstaller::Runtime.wix_config,
      :config_file  => RubyInstaller::Runtime.config_file
    )
   
  end
end
