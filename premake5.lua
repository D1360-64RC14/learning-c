workspace "LearningC"
    configurations {
        "Debug",
        "Release"
    }

project "LearningC"
    kind "ConsoleApp"
    language "C"
    cdialect "C17"
    targetdir "build/%{cfg.buildcfg}"
    toolset "clang"
    includedirs { "packages"}

    files {
        "src/**.c",
        "packages/**.c"
    }

    filter "configurations:Debug"
        defines { "DEBUG"}
        optimize "Off"
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG"}
        optimize "Full"
        symbols "Off"