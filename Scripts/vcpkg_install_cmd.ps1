# PowerShell script to sequentially install libraries using vcpkg

$vcpkgCmd = "vcpkg install"

$packages = @(
    # "arrow[json,mimalloc,flightsql,filesystem,csv,s3,parquet]",
    # "arrow-adbc[sqlite,postgresql]",
    # "highway[contrib]",
    # "drogon[ctl,mysql,orm,postgres,redis,sqlite3,yaml]",
    # "hiredis",
    # "glog[customprefix]",
    # "mimalloc[override,secure]",
    # "folly[bzip2,zstd,lzma,lz4]",
    # "imgui[win32-binding,glfw-binding,dx12-binding,vulkan-binding,sdl3-binding,opengl3-binding]",
    "opencv4[core,highgui,calib3d,dnn,ffmpeg,msmf,dshow,jpeg,png,tiff,webp,contrib,openmp,ffmpeg]",
    # "asio",
    "llvm[tools,utils,clang,clang-tools-extra,lld,compiler-rt,libcxx,libcxxabi,openmp,target-x86,default-targets,enable-zlib,enable-rtti,enable-assertions]"
    # "reflectcpp[bson,capnproto,cbor,flexbuffers,msgpack,toml,ubjson,xml,yaml]",
    # "glaze[ssl]",
    # "spdlog",
    # "gtest[cxx17]",
    # "glog[customprefix]",
    # "mqtt-cpp",
    # "paho-mqtt",
    # "paho-mqttpp3[ssl]"
)

foreach ($pkg in $packages) {
    $cmd = "$vcpkgCmd $pkg --recurse"
    Write-Host "Executing: $cmd"
    try {
        Invoke-Expression $cmd
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Warning: Command failed with exit code $LASTEXITCODE"
        } else {
            Write-Host "Success: $cmd"
        }
    } catch {
        Write-Host "Error executing $cmd : $_"
    }
    Write-Host "-----------------------------------"
}

Write-Host "All installations attempted."
