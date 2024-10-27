project "NVRHI_DX12"
    kind "StaticLib"
    language "C++"
    cppdialect "C++latest"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}") 
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/nvrhi/d3d12.h",

        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",
        
        "src/d3d12/**.h",
        "src/d3d12/**.cpp"
    }

    defines
    {
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    includedirs
    {
        "include",
        "rtxmu/include"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "speed"

    filter "configurations:Dist"
        runtime "Release"
        optimize "speed"
        symbols "off"
