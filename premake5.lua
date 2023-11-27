workspace "LearningC"
    configurations {
        "Debug",
        "Release"
    }

project "LearningC"
    kind "ConsoleApp"
    language "C"
    cdialect "C17"
    targetdir "bin/%{cfg.buildcfg}"
    toolset "clang"
    includedirs { "packages"}

    files {
        "src/**.c",
        "packages/**.c",
        "packages/**.h"
    }

    filter "configurations:Debug"
        defines { "DEBUG"}
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG"}
        optimize "On"
