Pod::Spec.new do |spec|

  spec.name         = "BaseMSCConfig"
  spec.version      = "1.0.0"
  spec.summary      = "Common config app"
  spec.description  = "Create common config"

  spec.homepage     = "http://EXAMPLE/BaseMSCConfig"
  spec.license      = "MIT"
  spec.author             = { "Duc Canh" => "tranduccanh3008@gmail.com" }

  spec.platform     = :ios, "13.0"

  spec.source       = { :git => "https://github.com/msctechglobal/BaseMSCConfig.git", :tag => spec.version.to_s }

  spec.source_files  = "BaseMSCConfig/**/*.{swift}"
  spec.swift_version = "5.0"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
