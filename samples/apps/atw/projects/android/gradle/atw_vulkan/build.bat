@echo off

set BUILD_DIR="../../../../../../../build/android/gradle/apps/atw_vulkan/"
set MUXER_DIR="../../../../../../../build/android/gradle/layers/queue_muxer/"
set GLSL_DIR="../../../../../../../build/android/gradle/layers/glsl_shader/"

call xcopy /Y /S %MUXER_DIR%outputs\native\debug\all\lib\* %BUILD_DIR%intermediates\binaries\debug\all\lib\
call xcopy /Y /S %MUXER_DIR%outputs\native\release\all\lib\* %BUILD_DIR%intermediates\binaries\release\all\lib\
call xcopy /Y /S %GLSL_DIR%outputs\native\debug\all\lib\* %BUILD_DIR%intermediates\binaries\debug\all\lib\
call xcopy /Y /S %GLSL_DIR%outputs\native\release\all\lib\* %BUILD_DIR%intermediates\binaries\release\all\lib\
call gradlew --project-cache-dir %BUILD_DIR%.gradle build
call jar -tf %BUILD_DIR%outputs\apk\atw_vulkan-all-debug.apk
call adb install -r %BUILD_DIR%outputs/apk/atw_vulkan-all-debug.apk
call adb shell am start -n com.vulkansamples.atw_vulkan/android.app.NativeActivity
