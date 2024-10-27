include "DX12.lua"

project "NVRHI"
    kind "StaticLib"
    language "C++"
    cppdialect "C++latest"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. ".%{prj.name}")
    objdir ("bin-int/" .. outputdir .. ".%{prj.name}")

    files
    {
        "include/nvrhi/nvrhi.h",
        "include/nvrhi/utils.h",
        
        "include/nvrhi/common/**.h",
        "include/nvrhi/common/**.cpp",

        "src/validataion/**.h",
        "src/validataion/**.cpp",

        "tools/nvrhi.natvis"
    }

    defines
    {
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    links
    {
        "NVRHI_DX12"
    }

    includedirs
    {
        "include",
        "rtxmu/include"
    }

    filter "configurations:Debug"
        runtime "Debug"
        optimize "speed"

    filter "configurations:Release"
        runtime "Release"
        optimize "speed"

    filter "configurations:Dist"
        runtime "Release"
        optimize "speed"
        symbols "off"
    
    