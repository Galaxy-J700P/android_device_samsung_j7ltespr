# Adaptive LMK
echo 1 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo 53059 > /sys/module/lowmemorykiller/parameters/vmpressure_file_min

# HMP scheduler settings for 8916, 8936, 8939, 8929
echo 3 > /proc/sys/kernel/sched_window_stats_policy
echo 3 > /proc/sys/kernel/sched_ravg_hist_size

# Enable trace log for ion_import_dma_buf()
echo 1 > /d/tracing/events/kmem/ion_import_dma_buf/enable

# Apply 1.0 and 2.0 specific Sched & Governor settings

# disable thermal core_control for updating interactive gov settings
echo 0 > /sys/module/msm_thermal/core_control/enabled

# change sched_window_stats_policy same as KK version
echo 3 > /proc/sys/kernel/sched_window_stats_policy

# enable governor for perf cluster
echo 1 > /sys/devices/system/cpu/cpu0/online
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
# enable governor for power cluster
echo 1 >/sys/devices/system/cpu/cpu4/online
echo "interactive" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

# HMP Task packing settings for 8939, 8929
echo 30 > /proc/sys/kernel/sched_small_task

echo 30 > /proc/sys/kernel/sched_mostly_idle_load


for devfreq_gov in /sys/class/devfreq/qcom,mincpubw*/governor
do
	echo "cpufreq" > $devfreq_gov
done

# Bus-DCVS settings
echo "bw_hwmon" > /sys/class/devfreq/0.qcom,cpubw/governor
echo 16 > /sys/class/devfreq/0.qcom,cpubw/bw_hwmon/io_percent
echo 20 > /sys/class/devfreq/0.qcom,cpubw/polling_interval

chown -h system.system /sys/class/devfreq/0.qcom,cpubw/governor
chown -h system.system /sys/class/devfreq/0.qcom,cpubw/bw_hwmon/io_percent
chown -h system.system /sys/class/devfreq/0.qcom,cpubw/polling_interval
chown -h system.system /sys/class/devfreq/0.qcom,cpubw/max_freq
chown -h system.system /sys/class/devfreq/0.qcom,cpubw/min_freq
chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/governor
chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/bw_hwmon/io_percent
chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/polling_interval
chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/max_freq
chmod -h 0664 /sys/class/devfreq/0.qcom,cpubw/min_freq

for devfreq_gov in /sys/class/devfreq/qcom,mincpubw*/governor
do
    echo "powersave" > $devfreq_gov
    for timeout in	/sys/class/devfreq/qcom,mincpubw*/cpufreq/timeout
    do
        echo 20 > $timeout
    done
done

for gpu_bimc_io_percent in /sys/class/devfreq/qcom,gpubw*/bw_hwmon/io_percent
do
    echo 30 > $gpu_bimc_io_percent
done

chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/lpm_disable_freq
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
chown -h system.system /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/lpm_disable_freq
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
chmod -h 0660 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load

echo "25000 1100000:50000 1300000:25000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 25000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/lpm_disable_freq
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo "63 500000:85 850000:80 1000000:95" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
        echo 533333 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load

# Set governor parameters for power cluster
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/lpm_disable_freq
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
chown -h system.system /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/lpm_disable_freq
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
chmod -h 0660 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load

echo "25000 800000:50000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 25000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 800000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 800000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/lpm_disable_freq
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
echo "85 800000:90" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
        echo 499200 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load

echo 400000 > /proc/sys/kernel/sched_freq_inc_notify
echo 400000 > /proc/sys/kernel/sched_freq_dec_notify

# enable thermal core_control now
echo 1 > /sys/module/msm_thermal/core_control/enabled

echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online
echo 1 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu7/online


# Enable low power modes
echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled

# HMP scheduler (big.Little cluster related) settings
echo 75 > /proc/sys/kernel/sched_upmigrate
echo 60 > /proc/sys/kernel/sched_downmigrate

# cpu idle load threshold

chown -h root.system /sys/devices/system/cpu/cpu0/online
chown -h root.system /sys/devices/system/cpu/cpu1/online
chown -h root.system /sys/devices/system/cpu/cpu2/online
chown -h root.system /sys/devices/system/cpu/cpu3/online
chown -h root.system /sys/devices/system/cpu/cpu4/online
chown -h root.system /sys/devices/system/cpu/cpu5/online
chown -h root.system /sys/devices/system/cpu/cpu6/online
chown -h root.system /sys/devices/system/cpu/cpu7/online
chmod -h 664 /sys/devices/system/cpu/cpu0/online
chmod -h 664 /sys/devices/system/cpu/cpu1/online
chmod -h 664 /sys/devices/system/cpu/cpu2/online
chmod -h 664 /sys/devices/system/cpu/cpu3/online
chmod -h 664 /sys/devices/system/cpu/cpu4/online
chmod -h 664 /sys/devices/system/cpu/cpu5/online
chmod -h 664 /sys/devices/system/cpu/cpu6/online
chmod -h 664 /sys/devices/system/cpu/cpu7/online
echo Y > /sys/module/lpm_levels/system/power/power-l2-active/idle_enabled
echo Y > /sys/module/lpm_levels/system/power/power-l2-pc/idle_enabled
echo Y > /sys/module/lpm_levels/system/performance/performance-l2-active/idle_enabled
echo Y > /sys/module/lpm_levels/system/performance/performance-l2-pc/idle_enabled
echo Y > /sys/module/lpm_levels/system/power/power-l2-pc/suspend_enabled
echo Y > /sys/module/lpm_levels/system/performance/performance-l2-pc/suspend_enabled
echo Y > /sys/module/lpm_levels/system/system-cci-active/idle_enabled
echo Y > /sys/module/lpm_levels/system/system-cci-retention/idle_enabled
echo Y > /sys/module/lpm_levels/system/system-cci-pc/idle_enabled
echo Y > /sys/module/lpm_levels/system/system-cci-pc/suspend_enabled
echo 90 > /proc/sys/kernel/sched_upmigrate
echo 70 > /proc/sys/kernel/sched_downmigrate
echo 30 > /proc/sys/kernel/sched_init_task_load
echo 5 > /proc/sys/kernel/sched_ravg_hist_size
echo 10 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 1 > /proc/sys/kernel/sched_boot_complete

echo 30 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu4/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu5/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu6/sched_mostly_idle_load
echo 30 > /sys/devices/system/cpu/cpu7/sched_mostly_idle_load


# cpu idle nr run threshold
echo 3 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu4/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu5/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu6/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu7/sched_mostly_idle_nr_run


echo 960000 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_freq
echo 960000 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_freq
echo 960000 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_freq
echo 960000 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_freq
chown -h radio.system /sys/class/kgsl/kgsl-3d0/default_pwrlevel
chown -h radio.system /sys/class/kgsl/kgsl-3d0/idle_timer
chmod -h 664 /sys/class/kgsl/kgsl-3d0/default_pwrlevel
chmod -h 664 /sys/class/kgsl/kgsl-3d0/idle_timer
rm /data/system/default_values

# cpu idle nr run threshold
echo 3 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu4/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu5/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu6/sched_mostly_idle_nr_run
echo 3 > /sys/devices/system/cpu/cpu7/sched_mostly_idle_nr_run

setprop ro.min_freq_0 533333
setprop ro.min_freq_4 499200

#start perfd after setprop
start perfd # start perfd on 8916, 8939 and 8929
