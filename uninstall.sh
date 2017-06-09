#!/sbin/sh
#
# www.osbusters.net
#
# This script should be flashed after ROM installation.
# It will check for large apps in system and move it to data.
#
# This will neither delete any app nor will it break its functionality
# This will increase free space in system partition
#
# AUTHOR: nitesh9 (Nitesh Prasad)
#ui_print "##################################################### "
outfile="/tmp/recovery.log"

# Mount /system and /data
echo "#####START mounting system and data" >> ${outfile} 2>&1
mount | grep " /system " || /sbin/mount /system >> ${outfile} 2>&1
mount | grep " /data " || /sbin/mount /data >> ${outfile} 2>&1
mount >> ${outfile} 2>&1
df -h >> ${outfile} 2>&1
echo "#####END mounting system and data" >> ${outfile} 2>&1

# Deleting installation from system partition
# From system
rm -f "/system/build.prop"

# From system/app folder
rm -rf "/system/app/GoogleLyricsPlugin"
rm -rf "/system/app/HeadphoneSelection"
rm -rf "/system/app/MaxxAudio"
rm -rf "/system/app/MaxxService"
rm -rf "/system/app/SemcMetadataCleanup"
rm -rf "/system/app/WikipediaPlugin"
rm -rf "/system/app/YouTubeKaraokePlugin"
rm -rf "/system/app/YouTubePlugin"

# From system/bin folder
rm -f "/system/bin/alsa_amixer"
rm -f "/system/bin/alsa_aplay"
rm -f "/system/bin/alsa_ctl"
rm -f "/system/bin/aplay"
rm -f "/system/bin/asound"
rm -f "/system/bin/snd"
rm -f "/system/bin/snd8k"
rm -f "/system/bin/sound"
rm -f "/system/bin/sound8x60"
rm -f "/system/bin/spkamp"

# From system/etc folder
rm -rf "/system/etc/dolby"
rm -rf "/system/etc/permissions"
rm -rf "/system/etc/sony_effect"
rm -rf "/system/etc/soundimage"
rm -rf "/system/etc/surround_sound_3mic"
rm -rf "/system/etc/tfa"
rm -f "/system/etc/audio_effects.conf"
rm -f "/system/etc/dsx_param_file.bin"
rm -f "/system/etc/image_beatbox_bt.bin"
rm -f "/system/etc/image_beats*.bin"
rm -f "/system/etc/image_gec*.bin"
rm -f "/system/etc/image_htc*.bin"
rm -f "/system/etc/image_ibeats*.bin"

# From system/framework folder
rm -f "/system/framework/com.sony.device.jar"
rm -f "/system/framework/com.sonyericsson.appextensions.jar"
rm -f "/system/framework/com.sonyericsson.colorextraction_impl.jar"
rm -f "/system/framework/com.sonyericsson.dlna.dtcpplayer.jar"
rm -f "/system/framework/com.sonyericsson.dlna.playanywhere.jar"
rm -f "/system/framework/com.sonyericsson.dlna_impl.jar"
rm -f "/system/framework/com.sonyericsson.dtcpctrl_private_impl.jar"
rm -f "/system/framework/com.sonyericsson.dtcpctrl_protected_impl.jar"
rm -f "/system/framework/com.sonyericsson.illumination.jar"
rm -f "/system/framework/com.sonyericsson.media.infinite.extension_1.jar"
rm -f "/system/framework/com.sonyericsson.metadatacleanup.jar"
rm -f "/system/framework/com.sonyericsson.music.jar"
rm -f "/system/framework/com.sonyericsson.privateapis_impl.jar"
rm -f "/system/framework/com.sonyericsson.system.jar"
rm -f "/system/framework/com.sonyericsson.uxp.jar"
rm -f "/system/framework/com.sonyericsson.uxpres.jar"
rm -f "/system/framework/com.sonymobile.drmstream_impl.jar"
rm -f "/system/framework/com.sonymobile.media.dashboard.extension.jar"
rm -f "/system/framework/com.sonymobile.mediacontent.jar"
rm -f "/system/framework/com.sonymobile.musicslideshow.jar"
rm -f "/system/framework/com.sonymobile.podcast.jar"
rm -f "/system/framework/com.sonymobile.settings.illumination.jar"
rm -f "/system/framework/com.sonymobile.settings.shakecontrol.jar"
rm -f "/system/framework/com.sonymobile.softreset.jar"
rm -f "/system/framework/semc_audioeffectif.jar"
rm -f "/system/framework/sonyaudioeffect.jar"

# From system/lib folder
rm -rf "/system/lib/soundfx"
rm -f "/system/lib/libacdbmapper.so"
rm -f "/system/lib/libasound.so"
rm -f "/system/lib/libaudcal.so"
rm -f "/system/lib/libaudio_init.so"
rm -f "/system/lib/libaudioalsa.so"
rm -f "/system/lib/libAudioTrimmer.so"
rm -f "/system/lib/libbeatscorehtc.so"
rm -f "/system/lib/libDiracAPI_SHARED.so"
rm -f "/system/lib/libdlbdapstorage.so"
rm -f "/system/lib/libEffectOmxCore.so"
rm -f "/system/lib/libldacBT_enc.so"
rm -f "/system/lib/libsony_audioroute.so"
rm -f "/system/lib/libsony_audioutils.so"
rm -f "/system/lib/libsonydseehxwrapper.so"
rm -f "/system/lib/libsoundhoundaudio.so"
rm -f "/system/lib/libstagefright_soft_alacdec.so"
rm -f "/system/lib/libstagefright_soft_dsddec.so"
rm -f "/system/lib/libV4AJniUtils.so"
rm -f "/system/lib/libvoAudioFR.so"
rm -f "/system/lib/libwebrtc_audio_preprocessing.so"

# From system/priv-app folder
rm -rf "/system/priv-app/As"
rm -rf "/system/priv-app/AsUI"
rm -rf "/system/priv-app/SemcMusic"
rm -rf "/system/priv-app/ViPER4AndroidFX-2.5.0.5"

# From system/usr folder
rm -rf "/system/usr/share/alsa"

# From system/vendor folder
rm -rf "/system/vendor/etc"
rm -rf "/system/vendor/lib/soundfx"
rm -f "/system/vendor/lib/libaudioalsa.so"

# Backup other folders
rm -rf "/system/addon.d"
rm -rf "/system/su.d"

# Restoring backup files
# In system
cp -f "/data/quasar-atmox/backup/build.prop" "/system/"

# In system/app folder
cp -rf "/data/quasar-atmox/backup/app/GoogleLyricsPlugin" "/system/app/GoogleLyricsPlugin"
cp -rf "/data/quasar-atmox/backup/app/HeadphoneSelection" "/system/app/HeadphoneSelection"
cp -rf "/data/quasar-atmox/backup/app/SemcMetadataCleanup" "/system/app/SemcMetadataCleanup"
cp -rf "/data/quasar-atmox/backup/app/WikipediaPlugin" "/system/app/WikipediaPlugin"
cp -rf "/data/quasar-atmox/backup/app/YouTubeKaraokePlugin" "/system/app/YouTubeKaraokePlugin"
cp -rf "/data/quasar-atmox/backup/app/YouTubePlugin" "/system/app/YouTubePlugin"

# In system/bin folder
cp -f "/data/quasar-atmox/backup/bin/alsa_amixer" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/alsa_aplay" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/alsa_ctl" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/aplay" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/asound" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/snd" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/snd8k" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/sound" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/sound8x60" "/system/bin/"
cp -f "/data/quasar-atmox/backup/bin/spkamp" "/system/bin/"

# In system/etc folder
cp -rf "/data/quasar-atmox/backup/etc/dolby" "/system/etc/dolby"
cp -rf "/data/quasar-atmox/backup/etc/permissions" "/system/etc/permissions"
cp -rf "/data/quasar-atmox/backup/etc/sony_effect" "/system/etc/sony_effect"
cp -rf "/data/quasar-atmox/backup/etc/soundimage" "/system/etc/soundimage"
cp -rf "/data/quasar-atmox/backup/etc/surround_sound_3mic" "/system/etc/surround_sound_3mic"
cp -rf "/data/quasar-atmox/backup/etc/tfa" "/system/etc/tfa"
cp -f "/data/quasar-atmox/backup/etc/audio_effects.conf" "/system/etc/"
cp -f "/data/quasar-atmox/backup/etc/dsx_param_file.bin" "/system/etc/"
cp -f "/data/quasar-atmox/backup/etc/image_beatbox_bt.bin" "/system/etc/"
cp -f "/data/quasar-atmox/backup/etc/image_beats*.bin" "/system/etc/"
cp -f "/data/quasar-atmox/backup/etc/image_gec*.bin" "/system/etc/"
cp -f "/data/quasar-atmox/backup/etc/image_htc*.bin" "/system/etc/"
cp -f "/data/quasar-atmox/backup/etc/image_ibeats*.bin" "/system/etc/"

# In system/framework folder
cp -f "/data/quasar-atmox/backup/framework/com.sony.device.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.appextensions.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.colorextraction_impl.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.dlna.dtcpplayer.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.dlna.playanywhere.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.dlna_impl.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.dtcpctrl_private_impl.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.dtcpctrl_protected_impl.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.illumination.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.media.infinite.extension_1.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.metadatacleanup.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.music.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.privateapis_impl.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.system.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.uxp.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonyericsson.uxpres.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.drmstream_impl.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.media.dashboard.extension.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.mediacontent.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.musicslideshow.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.podcast.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.settings.illumination.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.settings.shakecontrol.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/com.sonymobile.softreset.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/semc_audioeffectif.jar" "/system/framework/"
cp -f "/data/quasar-atmox/backup/framework/sonyaudioeffect.jar" "/system/framework/"

# In system/lib folder
cp -rf "/data/quasar-atmox/backup/lib/soundfx" "/system/lib/soundfx"
cp -f "/data/quasar-atmox/backup/lib/libacdbmapper.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libasound.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libaudcal.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libaudio_init.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libaudioalsa.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libAudioTrimmer.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libbeatscorehtc.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libDiracAPI_SHARED.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libdlbdapstorage.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libEffectOmxCore.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libldacBT_enc.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libsony_audioroute.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libsony_audioutils.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libsonydseehxwrapper.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libsoundhoundaudio.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libstagefright_soft_alacdec.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libstagefright_soft_dsddec.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libV4AJniUtils.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libvoAudioFR.so" "/system/lib/"
cp -f "/data/quasar-atmox/backup/lib/libwebrtc_audio_preprocessing.so" "/system/lib/"

# In system/priv-app folder
cp -rf "/data/quasar-atmox/backup/priv-app/As" "/system/priv-app/As"
cp -rf "/data/quasar-atmox/backup/priv-app/AsUI" "/system/priv-app/AsUI"

# In system/usr folder
cp -rf "/data/quasar-atmox/backup/usr/share/alsa" "/system/usr/share/alsa"

# From system/vendor folder
cp -rf "/data/quasar-atmox/backup/vendor/etc" "/system/vendor/etc"
cp -rf "/data/quasar-atmox/backup/vendor/lib/soundfx" "/system/vendor/lib/soundfx"
cp -f "/data/quasar-atmox/backup/vendor/lib/libaudioalsa.so" "/system/vendor/lib/"

# Backup other folders
cp -rf "/data/quasar-atmox/backup/addon.d" "/system/addon.d"
cp -rf "/data/quasar-atmox/backup/su.d" "/system/su.d"