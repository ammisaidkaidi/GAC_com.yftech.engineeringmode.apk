# GAC_com.yftech.engineeringmode.apk

Full Java-readable decompilation of **`com.yftech.engineeringmode.apk`**, the the factory / engineering-mode diagnostic app for YF Tech (GAC) head-units from the [yftech-apks](https://github.com/ammisaidkaidi/yftech-apks) collection.

> Source APK: [com.yftech.engineeringmode.apk](https://github.com/ammisaidkaidi/yftech-apks/blob/main/com.yftech.engineeringmode.apk)  
> SHA-256: `802b7273d7756a2ed35f313112836ab5f1c2269d073ede82b8cf82fc2c31e81f`  
> Size: 4.3 MB  
> Decompiled with **jadx 1.5.0** (Java sources) + **apktool 3.0.3** (smali / resources)  
> Generated: 2026-10-18

---

## 1. What this app is, what it does, and what it is for

`com.yftech.engineeringmode` is the **factory engineering-mode application** of the YF Tech (GAC) head-unit — the hidden diagnostic and calibration tool used on the production line, in service workshops and by developers. It is launched by the private action **`com.yftech.intent.action.start.engineeringmode`** (it also has a MAIN launcher entry) and opens `EngineeringModeActivity`, a grid of 24 test modules. Unlike the other APKs in this collection it is a **debug build**: the manifest sets `android:debuggable="true"`, `usesCleartextTraffic="true"` and `allowBackup="false"`, and `versionName` is a build timestamp (`1.2025-06-12 11:21:49`). It runs as `android.uid.system` and holds some of the most dangerous permissions in the whole collection, including **`MASTER_CLEAR`**, `MOUNT_UNMOUNT_FILESYSTEMS`, `WRITE_MEDIA_STORAGE` and `CHANGE_NETWORK_STATE`.

**Purpose / why it exists on the device:**

It exists so that a technician with no PC can verify, calibrate and re-flash every subsystem of the head-unit from the touchscreen: screen and touch-panel, camera, microphone, speakers, EQ, tuner, Bluetooth, Wi-Fi, USB ports, steering-wheel keys, temperature sensors, fault codes, product/version info, and the metazone/"AtcMetazone" configuration. It also carries the **USB / CA1105 screen upgrade** path (`ScreenUpgradeCA1105Manager`, `UpgradeManager`, `UsbUpgradeFragment`), the **backup & factory-restore** path (`BackupRecoveryFragment`), and the **CarPlay / HiCar certificate** provisioning path (`AuthenticationFragment`). A second, quieter job is **log capture**: `LogReceiver` (action `com.yftech.intent.action.engineeringmode.log`) and `CanLogFloatView` let a technician start/stop log and CAN-log recording from outside the app, and `EngineeringModeReceiver` reacts to `MEDIA_MOUNTED` so a USB stick can be used as the log/upgrade target.

**How it works (runtime flow):**

1. The app is started either by the private intent `com.yftech.intent.action.start.engineeringmode` or from the launcher; `EngineeringModeApp` performs the global init and `EngineeringModeActivity` builds a `RecyclerView` grid of `Module` entries via `ModuleAdapter`.
2. Each grid cell swaps in one of the 24 fragments in `fragment/`: `ScreenFragment` + `ScreenTpTestDialog` + `ScreenDisplayDetectionDialog` (dead-pixel / touch test), `CameraFragment`, `MicTestFragment`, `LoudSpeakerFragment`, `EQFragment`, `TunerFragment`, `BluetoothFragment`, `WifiFragment`, `USBTestFragment`, `StreelingWheelKeyFragment`, `TemperatureInfoFragment`, `FaultCodeFragment`, `LogFragment`, `ConfigFragment`, `AtcMetazoneFragment`, `ProductInfoFragment`, `AAHeadUnitInfoFragment`, `AppInfoFragment`, `BackupRecoveryFragment`, `UsbUpgradeFragment`, `AdditionalFragment`, `OtherFragment`, `AuthenticationFragment`.
3. `ConfigDataReceiver` (action `com.yftech.intent.action.engineeringmode.config.TYPE`) pushes configuration data into the app; `ConfigManager` reads and writes it, and `ConfigModifyDialog` / `ConfigReadAdapter` expose the raw key/value tree.
4. `UpgradeManager` + `ScreenUpgradeCA1105Manager` drive the upgrade flows (`UpgradeDialog`, `UpgradeCheckDialog`, `UsbUpgradeFragment`, `ScreenUpgradeCA1105Dialog`) from USB media or from the upgrade service (`com.yftech.permission.service.upgrade.upgrade`).
5. `LogManager` + `Copier` + `DeleteUtil` implement the log-collection pipeline: start capture, copy logs to external storage, delete old archives. `CanLogFloatView` is a floating overlay showing CAN log state.
6. `AuthenticationFragment` provisions **CarPlay and HiCar certificates**: it toggles `persist.sys.carplay.certificate` / `persist.sys.hicar.certificate`, copies certificate files between `<sdcard>/certificate`, `<sdcard>/certificate_hicar`, `/cache/recovery/last_certificate` and `/cache/recovery/last_certificate_hicar`, and selects the ATE car type (`IHU12_A88_A1`, `IHU12_A58_B1`, `IHU12_A79_C1`, `IHU12_A79_C2`).
7. `BackupRecoveryFragment` + `FactorySetting` + `SharedPreferencesUtils` implement backup/restore of settings and factory reset.
8. `com.yftech.tbox.sdk` (6 classes, `CarTBoxSdkManager`, `ICarTBoxSdkService`, `ICarTBoxSdkCallback`) is a **bundled client SDK for the T-Box service**, letting engineering mode read T-Box state (used by the temperature / product-info screens).

**Notable findings:**

- **This is a debuggable build shipped on the device** (`android:debuggable="true"`, `usesCleartextTraffic="true"`). Anyone with `adb` can attach to it, which is a significant security finding for a production head-unit.
- Holds `MASTER_CLEAR` (factory reset), `MOUNT_UNMOUNT_FILESYSTEMS`, `WRITE_MEDIA_STORAGE` and `CHANGE_NETWORK_STATE` / `CHANGE_WIFI_STATE` — it can wipe the device and toggle Wi-Fi.
- Writes **CarPlay and HiCar authentication certificates** into `/cache/recovery/last_certificate` and `/cache/recovery/last_certificate_hicar`, and flips `persist.sys.carplay.certificate` / `persist.sys.hicar.certificate` — i.e. this app is how the head-unit is "unlocked" for wireless CarPlay/HiCar. (Note `PhoneLinkManager` in `com.yftech.service.bluetooth` reads the very same `persist.sys.carplay.certificate` property.)
- Three exported, unguarded broadcast receivers: `EngineeringModeReceiver` (`MEDIA_MOUNTED`), `ConfigDataReceiver` (`com.yftech.intent.action.engineeringmode.config.TYPE`) and `LogReceiver` (`com.yftech.intent.action.engineeringmode.log`). Any app on the device can push config or toggle log capture.
- `versionName` is a build timestamp (`1.2025-06-12 11:21:49`) — this build was produced on 2025-06-12.
- Reflection targets include hidden framework internals `android.view.GhostView`, `com.android.internal.view.menu.MenuBuilder`, `android.content.res.ThemedResourceCache`, `android.graphics.Insets` and `android.util.Log`.
- No network endpoints, no native libraries, no SQL and no crypto in the app's own code — it is a purely local diagnostic tool (the T-Box SDK is the only IPC-heavy part).
- 915 Java files, but the YF Tech code is only ~115 classes across 9 packages; the rest is Android Support Library v4/v7/design/transition.
- Depends on vendor frameworks absent from the APK: `com.yftech.car.media.data.CarMediaDataManager`, `com.yftech.car.utils.PlatformProjectDescribe`, `com.yftech.vehicle.sdk.CarMiscManager`, `com.yftech.vehicle.internal.adapter.ICarMisc`, `com.autochips.metazone.AtcMetazone`.

## 2. APK metadata

| Property | Value |
|---|---|
| Package name | `com.yftech.engineeringmode` |
| Version name / code | `1.2025-06-12 11:21:49` / `1` |
| minSdk / targetSdk / maxSdk | `26` / `28` / `None` |
| sharedUserId | `android.uid.system` |
| `<application>` attributes | `name=com.yftech.engineeringmode.EngineeringModeApp`, `label=@string/app_name`, `icon=@mipmap/ic_launcher`, `theme=@style/EngineeringModeStyle`, `debuggable=true`, `allowBackup=false`, `usesCleartextTraffic=true` |
| Java classes decompiled | **915** files / 915 top-level types |
| Smali files | **2455** |
| Total Java lines | ~195,771 |
| Total methods | ~40,644 |
| Permissions requested | **32** |
| Declared (custom) permissions | **0** |
| Activities / Services / Receivers / Providers | 1 / 0 / 3 / 0 |

## 3. Repository layout

```
.
├── README.md                  <- this file (full class/function catalogue + analysis)
├── sources/                   <- jadx: decompiled JAVA sources (.java)  **start here**
│   └── <package path>/<Class>.java
├── resources/                 <- jadx: decoded manifest + resources + assets
│   ├── AndroidManifest.xml
│   ├── res/                   <- layouts, drawables, values (near-original form)
│   └── assets/                <- raw asset files (config .properties, etc.)
├── smali/                     <- apktool: disassembled Dalvik bytecode (.smali)
│   └── <package path>/<Class>.smali
├── smali_classes2..N/         <- apktool: extra dex files (when present)
├── original/                  <- apktool: files that could not be decoded (META-INF, …)
├── AndroidManifest.apktool.xml<- apktool copy of the manifest (raw attribute order)
└── apktool.yml                <- apktool build metadata
```

`sources/` is the Java-readable tree — this is what you want to read. `smali/` is the same code in Dalvik assembly (useful when jadx output is ambiguous).

## 4. Permissions

### Requested permissions

| Permission |
|---|
| `android.permission.ACCESS_NETWORK_STATE` |
| `android.permission.READ_PHONE_STATE` |
| `android.permission.WRITE_EXTERNAL_STORAGE` |
| `android.permission.READ_EXTERNAL_STORAGE` |
| `android.permission.MOUNT_UNMOUNT_FILESYSTEMS` |
| `android.permission.WRITE_SETTINGS` |
| `android.permission.CHANGE_NETWORK_STATE` |
| `android.permission.ACCESS_WIFI_STATE` |
| `android.permission.INTERNET` |
| `android.permission.CHANGE_WIFI_STATE` |
| `android.permission.MASTER_CLEAR` |
| `android.permission.ACCESS_COARSE_LOCATION` |
| `android.permission.ACCESS_FINE_LOCATION` |
| `android.permission.ACCESS_BACKGROUND_LOCATION` |
| `android.permission.SYSTEM_ALERT_WINDOW` |
| `android.permission.BLUETOOTH` |
| `android.permission.BLUETOOTH_ADMIN` |
| `android.permission.READ_CONTACTS` |
| `android.permission.WRITE_CONTACTS` |
| `android.permission.READ_CALL_LOG` |
| `android.permission.WRITE_CALL_LOG` |
| `android.permission.RECEIVE_BOOT_COMPLETED` |
| `android.permission.WRITE_MEDIA_STORAGE` |
| `com.yftech.permission.service.upgrade.upgrade` |
| `com.yftech.permission.service.car` |
| `com.yftech.permission.service.main.audio` |
| `com.yftech.permission.test` |
| `com.yftech.permission.service.main.screen` |
| `com.yftech.permission.service.main.input` |
| `com.yftech.permission.service.main.data` |
| `com.yftech.permission.service.main.audio.effect` |
| `com.yftech.permission.service.vehicle.COMMON` |

## 5. Declared components

### Activities (1)

| Class | Exported | Enabled | Guarded by | Intent actions |
|---|---|---|---|---|
| `com.yftech.engineeringmode.EngineeringModeActivity` | — | — | — | `com.yftech.intent.action.start.engineeringmode`, `android.intent.action.MAIN` |

### Services (0)

_none_

### Broadcast receivers (3)

| Class | Exported | Enabled | Guarded by | Intent actions |
|---|---|---|---|---|
| `com.yftech.engineeringmode.EngineeringModeReceiver` | true | true | — | `android.intent.action.MEDIA_MOUNTED` |
| `com.yftech.engineeringmode.ConfigDataReceiver` | true | true | — | `com.yftech.intent.action.engineeringmode.config.TYPE` |
| `com.yftech.engineeringmode.LogReceiver` | true | true | — | `com.yftech.intent.action.engineeringmode.log` |

### Content providers (0)

_none_

## 6. Package map

| Package | Classes | Methods | Lines |
|---|---:|---:|---:|
| `android.support.v7.widget` | 101 | 9029 | 38,758 |
| `android.support.v4.app` | 53 | 3958 | 17,324 |
| `android.support.design.widget` | 38 | 3491 | 14,804 |
| `android.support.v4.widget` | 31 | 2441 | 10,517 |
| `android.support.v4.view` | 41 | 1822 | 8,097 |
| `android.support.transition` | 59 | 1519 | 7,809 |
| `android.support.v7.app` | 18 | 1722 | 7,633 |
| `android.support.v7.view.menu` | 26 | 1313 | 5,730 |
| `com.yftech.engineeringmode.fragment` | 24 | 735 | 4,436 |
| `com.yftech.tbox.sdk` | 6 | 323 | 4,415 |
| `com.yftech.engineeringmode` | 7 | 87 | 3,972 |
| `android.support.graphics.drawable` | 10 | 704 | 3,888 |
| `android.support.v4.util` | 20 | 965 | 3,765 |
| `android.support.design.chip` | 3 | 1054 | 3,383 |
| `android.support.design.internal` | 18 | 605 | 2,673 |
| `android.support.v7.graphics.drawable` | 5 | 553 | 2,668 |
| `com.google.gson.internal` | 12 | 598 | 2,585 |
| `com.google.gson.internal.bind` | 14 | 536 | 2,572 |
| `android.support.design` | 1 | 15 | 2,551 |
| `android.support.v4.content` | 13 | 450 | 2,195 |
| `android.support.v4.view.accessibility` | 6 | 546 | 2,125 |
| `android.support.v4.graphics` | 13 | 319 | 2,029 |
| `com.google.gson` | 25 | 496 | 2,018 |
| `com.yftech.engineeringmode.dialog` | 13 | 347 | 2,017 |
| `android.support.v7.util` | 9 | 436 | 1,984 |
| `androidx.versionedparcelable` | 11 | 563 | 1,884 |
| `android.support.v4.graphics.drawable` | 10 | 441 | 1,852 |
| `com.google.gson.stream` | 5 | 425 | 1,796 |
| `android.support.v7.appcompat` | 1 | 13 | 1,669 |
| `android.arch.lifecycle` | 29 | 355 | 1,665 |
| `android.support.v7.widget.helper` | 3 | 305 | 1,433 |
| `org.greenrobot.eventbus` | 18 | 302 | 1,421 |
| `android.support.v4.provider` | 8 | 283 | 1,404 |
| `android.support.v7.view` | 9 | 267 | 1,365 |
| `android.support.v4.text` | 7 | 294 | 1,327 |
| `android.support.v4.os` | 17 | 295 | 1,286 |
| `android.support.v4.content.res` | 8 | 238 | 1,177 |
| `com.yftech.engineeringmode.manager` | 4 | 190 | 1,066 |
| `com.yftech.engineeringmode.util` | 8 | 174 | 1,015 |
| `android.support.design.shape` | 9 | 154 | 816 |
| `android.support.design.transformation` | 7 | 158 | 811 |
| `android.support.annotation` | 51 | 30 | 804 |
| `android.support.design.circularreveal` | 7 | 160 | 790 |
| `android.support.design.button` | 3 | 176 | 738 |
| `android.support.design.bottomappbar` | 2 | 151 | 721 |
| `com.yftech.engineeringmode.adapter` | 7 | 90 | 635 |
| `org.greenrobot.eventbus.util` | 8 | 119 | 632 |
| `android.support.v4.text.util` | 2 | 131 | 569 |
| `android.support.v4.print` | 1 | 88 | 530 |
| `android.support.design.animation` | 10 | 75 | 447 |
| `android.arch.core.internal` | 2 | 74 | 363 |
| `com.yftech.engineeringmode.widget` | 3 | 63 | 353 |
| `com.google.gson.internal.bind.util` | 1 | 65 | 337 |
| `android.support.v13.view.inputmethod` | 3 | 67 | 325 |
| `android.support.v4.content.pm` | 5 | 58 | 300 |
| `android.support.v7.recyclerview` | 1 | 11 | 265 |
| `android.support.v7.recyclerview.extensions` | 3 | 41 | 246 |
| `android.support.fragment` | 1 | 11 | 237 |
| `android.support.coordinatorlayout` | 1 | 11 | 237 |
| `android.support.coreui` | 1 | 11 | 237 |
| `android.support.v4.net` | 3 | 52 | 235 |
| `android.support.design.resources` | 3 | 40 | 228 |
| `android.support.loader` | 1 | 11 | 209 |
| `android.support.v7.viewpager` | 1 | 11 | 209 |
| `android.support.asynclayoutinflater` | 1 | 11 | 209 |
| `android.support.coreutils` | 1 | 11 | 209 |
| `android.support.swiperefreshlayout` | 1 | 11 | 209 |
| `android.support.drawerlayout` | 1 | 11 | 209 |
| `android.support.slidingpanelayout` | 1 | 11 | 209 |
| `android.support.customview` | 1 | 11 | 209 |
| `android.support.compat` | 1 | 11 | 209 |
| `android.support.v4.view.animation` | 6 | 38 | 200 |
| `com.google.gson.reflect` | 1 | 46 | 195 |
| `android.support.v4.hardware.fingerprint` | 1 | 40 | 170 |
| `org.greenrobot.eventbus.meta` | 5 | 27 | 141 |
| `com.yftech.engineeringmode.model` | 3 | 21 | 135 |
| `android.support.design.card` | 2 | 26 | 124 |
| `android.arch.core.executor` | 3 | 25 | 120 |
| `android.support.v7.content.res` | 1 | 20 | 116 |
| `android.support.v13.view` | 2 | 20 | 116 |
| `android.support.design.ripple` | 1 | 8 | 109 |
| `android.support.v4.internal.view` | 3 | 24 | 109 |
| `android.support.v4.accessibilityservice` | 1 | 22 | 104 |
| `android.support.design.circularreveal.cardview` | 1 | 18 | 93 |
| `android.support.design.circularreveal.coordinatorlayout` | 1 | 18 | 93 |
| `android.support.design.behavior` | 1 | 17 | 85 |
| `com.google.gson.annotations` | 5 | 7 | 84 |
| `android.support.v7.cardview` | 1 | 6 | 80 |
| `android.support.design.expandable` | 3 | 17 | 80 |
| `android.support.design.stateful` | 1 | 13 | 68 |
| `android.support.v4.hardware.display` | 1 | 15 | 62 |
| `org.greenrobot.eventbus.android` | 1 | 11 | 60 |
| `android.support.v4.database` | 2 | 13 | 54 |
| `android.support.v7.widget.util` | 1 | 6 | 39 |
| `android.support.v4.math` | 1 | 10 | 38 |
| `androidx.core.graphics.drawable` | 1 | 2 | 34 |
| `android.support.v7.text` | 1 | 4 | 29 |
| `android.support.design.canvas` | 1 | 5 | 26 |
| `android.support.design.drawable` | 1 | 4 | 21 |
| `android.support.v4.database.sqlite` | 1 | 3 | 17 |
| `android.support.design.theme` | 1 | 2 | 16 |
| `android.support.design.bottomnavigation` | 1 | 0 | 14 |
| `android.support.design.snackbar` | 1 | 2 | 9 |
| `android.support.print` | 1 | 1 | 8 |
| `android.support.cursoradapter` | 1 | 1 | 8 |
| `android.support.documentfile` | 1 | 1 | 8 |
| `android.support.localbroadcastmanager` | 1 | 1 | 8 |
| `android.support.interpolator` | 1 | 1 | 8 |
| `android.arch.lifecycle.viewmodel` | 1 | 1 | 8 |
| `android.arch.lifecycle.livedata` | 1 | 1 | 8 |
| `android.arch.lifecycle.livedata.core` | 1 | 1 | 8 |
| `android.arch.core` | 1 | 1 | 8 |
| `android.arch.core.util` | 1 | 1 | 7 |
| `androidx.core.internal` | 1 | 0 | 3 |
| `com.google.android.material.internal` | 1 | 0 | 3 |
| **TOTAL** | **915** | **40,644** | **195,771** |

## 7. Class and function catalogue

Every decompiled class with its declared functions. Methods are listed by name; see the `.java` files under `sources/` for full signatures and bodies.

### Package `com.yftech.engineeringmode`  (7 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BuildConfig` | class | — | 12 | 0 |
| `ConfigDataReceiver` | class | BroadcastReceiver | 77 | 9 |
| `EngineeringModeActivity` | class | AppCompatActivity implements View.OnClickListener | 451 | 63 |
| `EngineeringModeApp` | class | Application | 59 | 6 |
| `EngineeringModeReceiver` | class | BroadcastReceiver | 47 | 7 |
| `LogReceiver` | class | BroadcastReceiver | 22 | 2 |
| `R` | class | — | 3,304 | 0 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode</code></b> (click to expand)</summary>

- **`ConfigDataReceiver`** — 3 function(s): `onReceive()`, `if()`, `while()`
- **`EngineeringModeActivity`** — 28 function(s): `onGlobalLayout()`, `onFactoryModeUds31EngineerInfoChanged()`, `if()`, `onCreate()`, `setContentView()`, `onItemClick()`, `findViewById()`, `loadFragments()`, `showFragment()`, `onClick()`, `switch()`, `setADBEnable()`, `back()`, `finish()`, `screenshot()`, `getSupportFragmentManager()`, `loadModule()`, `while()`, `onStart()`, `checkInfo()`, `onResume()`, `onPause()`, `AnonymousClass3()`, `handleMessage()`, `onDismiss()`, `startCheckInfo()`, `Thread()`, `run()`
- **`EngineeringModeApp`** — 5 function(s): `attachBaseContext()`, `onCreate()`, `requestBspInfo()`, `onTerminate()`, `onTrimMemory()`
- **`EngineeringModeReceiver`** — 2 function(s): `onReceive()`, `if()`
- **`LogReceiver`** — 2 function(s): `onReceive()`, `if()`

</details>

### Package `com.yftech.engineeringmode.adapter`  (7 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AppInfoAdapter` | class | RecyclerView.Adapter<ViewHolder> | 93 | 15 |
| `CheckInfoAdapter` | class | RecyclerView.Adapter<ViewHolder> | 86 | 13 |
| `ConfigReadAdapter` | class | RecyclerView.Adapter<ViewHolder> | 116 | 20 |
| `FaultCodeAdapter` | class | BaseAdapter | 111 | 12 |
| `ModuleAdapter` | class | RecyclerView.Adapter<ViewHolder> | 68 | 10 |
| `ScreenTpGridViewAdapter` | class | BaseAdapter implements View.OnLongClickListener | 86 | 11 |
| `USBFileAdapter` | class | BaseAdapter | 75 | 9 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.adapter</code></b> (click to expand)</summary>

- **`AppInfoAdapter`** — 14 function(s): `AppInfoAdapter()`, `setPackageInfos()`, `notifyDataSetChanged()`, `onCreateViewHolder()`, `ViewHolder()`, `onBindViewHolder()`, `getItemCount()`, `if()`, `super()`, `setAppIcon()`, `setAppName()`, `setAppPackage()`, `setVersionCode()`, `setVersionName()`
- **`CheckInfoAdapter`** — 12 function(s): `CheckInfoAdapter()`, `onCreateViewHolder()`, `ViewHolder()`, `onBindViewHolder()`, `getItemCount()`, `if()`, `super()`, `setValueVisibility()`, `setName()`, `setFileValue()`, `setDeviceValue()`, `setResult()`
- **`ConfigReadAdapter`** — 15 function(s): `ConfigReadAdapter()`, `setData()`, `if()`, `notifyDataSetChanged()`, `getData()`, `onCreateViewHolder()`, `ViewHolder()`, `onBindViewHolder()`, `onClick()`, `showConfigModifyDialog()`, `getItemCount()`, `super()`, `onDismiss()`, `onValue()`, `notifyItemChanged()`
- **`FaultCodeAdapter`** — 10 function(s): `FaultCodeAdapter()`, `getCount()`, `getItem()`, `getItemId()`, `getView()`, `if()`, `onClick()`, `openDialog()`, `FaultMapping()`, `while()`
- **`ModuleAdapter`** — 10 function(s): `onItemClick()`, `ViewHolder()`, `super()`, `ModuleAdapter()`, `onCreateViewHolder()`, `onBindViewHolder()`, `onClick()`, `if()`, `getItemCount()`, `setOnItemClickListener()`
- **`ScreenTpGridViewAdapter`** — 8 function(s): `ScreenTpGridViewAdapter()`, `getCount()`, `getItem()`, `getItemId()`, `getView()`, `if()`, `onLongClick()`, `ViewHolder()`
- **`USBFileAdapter`** — 7 function(s): `USBFileAdapter()`, `getCount()`, `getItem()`, `getItemId()`, `getView()`, `onClick()`, `openMedia()`

</details>

### Package `com.yftech.engineeringmode.dialog`  (13 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AtcMetazoneInpuDialog` | class | Dialog implements AdapterView.OnItemSelectedListener | 140 | 23 |
| `CheckInfoDialog` | class | Dialog | 57 | 10 |
| `ConfigModifyDialog` | class | Dialog | 126 | 25 |
| `ConfirmDialog` | class | Dialog | 80 | 18 |
| `FaultCodeDetailDialog` | class | Dialog | 48 | 8 |
| `InputDialog` | class | Dialog | 124 | 26 |
| `LoadingDialog` | class | Dialog | 37 | 6 |
| `MediaDialog` | class | Dialog | 320 | 46 |
| `ScreenDisplayDetectionDialog` | class | Dialog | 164 | 31 |
| `ScreenTpTestDialog` | class | Dialog implements View.OnTouchListener, AdapterView.OnItemLongClickListener | 245 | 40 |
| `ScreenUpgradeCA1105Dialog` | class | Dialog implements View.OnClickListener, ScreenUpgradeCA1105Manager.ScreenUpgradeCA1105L... | 124 | 21 |
| `UpgradeCheckDialog` | class | Dialog | 176 | 32 |
| `UpgradeDialog` | class | Dialog implements View.OnClickListener | 376 | 61 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.dialog</code></b> (click to expand)</summary>

- **`AtcMetazoneInpuDialog`** — 16 function(s): `read()`, `write()`, `AtcMetazoneInpuDialog()`, `super()`, `onCreate()`, `setContentView()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onClick()`, `if()`, `dismiss()`, `setEditTextRequestFocus()`, `onItemSelected()`, `onNothingSelected()`, `setOnButtonClickListener()`, `setEditIndex()`
- **`CheckInfoDialog`** — 10 function(s): `CheckInfoDialog()`, `super()`, `onCreate()`, `setContentView()`, `if()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `findViewById()`, `onClick()`, `dismiss()`
- **`ConfigModifyDialog`** — 15 function(s): `onValue()`, `ConfigModifyDialog()`, `super()`, `setOnConfigModifyDialogListener()`, `setView()`, `if()`, `onCreate()`, `setContentView()`, `getWindow()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onClick()`, `onEditorAction()`, `setEditTextRequestFocus()`, `dismiss()`
- **`ConfirmDialog`** — 15 function(s): `cancelButtonClick()`, `sureButtonClick()`, `ConfirmDialog()`, `super()`, `setTipMessage()`, `onStart()`, `if()`, `onCreate()`, `setContentView()`, `getWindow()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onClick()`, `dismiss()`, `setOnButtonClickListener()`
- **`FaultCodeDetailDialog`** — 7 function(s): `FaultCodeDetailDialog()`, `super()`, `onCreate()`, `setContentView()`, `initView()`, `onClick()`, `dismiss()`
- **`InputDialog`** — 16 function(s): `onSure()`, `InputDialog()`, `super()`, `onCreate()`, `setContentView()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onClick()`, `findViewById()`, `onEditorAction()`, `setEditTextRequestFocus()`, `if()`, `dismiss()`, `setHint()`, `showToast()`, `setCallback()`
- **`LoadingDialog`** — 6 function(s): `LoadingDialog()`, `super()`, `onCreate()`, `setContentView()`, `Handler()`, `run()`
- **`MediaDialog`** — 25 function(s): `MediaDialog()`, `super()`, `handleMessage()`, `if()`, `onChangePlayMusic()`, `onChangeProgress()`, `onChangedVolume()`, `onProgressChanged()`, `switchImageResource()`, `onStartTrackingTouch()`, `onStopTrackingTouch()`, `onPlayChange()`, `onPrepared()`, `onProgress()`, `onCreate()`, `requestWindowFeature()`, `setContentView()`, `initView()`, `onClick()`, `pause()`, `next()`, `playAndPause()`, `nextVideo()`, `dismiss()`, `currentPlay()`
- **`ScreenDisplayDetectionDialog`** — 16 function(s): `ScreenDisplayDetectionDialog()`, `super()`, `run()`, `if()`, `onCreate()`, `requestWindowFeature()`, `setContentView()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onTouch()`, `dismiss()`, `next()`, `setBackgroundColor()`, `showColor()`, `show()`, `while()`
- **`ScreenTpTestDialog`** — 20 function(s): `ScreenTpTestDialog()`, `super()`, `onGlobalLayout()`, `for()`, `run()`, `if()`, `onCreate()`, `setContentView()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onStart()`, `startAutoBrightness()`, `onStop()`, `stopAutoBrightness()`, `onTouch()`, `onItemLongClick()`, `dismiss()`, `isSelect()`, `setSelect()`, `TouchScreenBean()`
- **`ScreenUpgradeCA1105Dialog`** — 15 function(s): `ScreenUpgradeCA1105Dialog()`, `super()`, `onCreate()`, `setContentView()`, `getWindow()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `initView()`, `if()`, `onStart()`, `onStop()`, `onClick()`, `dismiss()`, `onScreenUpgradeCA1105State()`, `run()`
- **`UpgradeCheckDialog`** — 15 function(s): `onCancel()`, `onUpgrade()`, `UpgradeCheckDialog()`, `super()`, `show()`, `setOnUpgradeCheckDialogListener()`, `onCreate()`, `setContentView()`, `if()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `onClick()`, `onCheckedChanged()`, `onStart()`, `updateButton()`
- **`UpgradeDialog`** — 23 function(s): `UpgradeDialog()`, `super()`, `onUpgradeProgress()`, `onUpgradeState()`, `if()`, `switch()`, `start()`, `show()`, `onCreate()`, `requestWindowFeature()`, `setContentView()`, `setCanceledOnTouchOutside()`, `setCancelable()`, `initView()`, `onStart()`, `initData()`, `startUpgrade()`, `onStop()`, `onClick()`, `dismiss()`, `requestBspInfo()`, `Handler()`, `run()`

</details>

### Package `com.yftech.engineeringmode.fragment`  (24 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AAHeadUnitInfoFragment` | class | BaseFragment | 133 | 22 |
| `AdditionalFragment` | class | BaseFragment implements View.OnClickListener, SeekBar.OnSeekBarChangeListener, AdapterV... | 316 | 44 |
| `AppInfoFragment` | class | BaseFragment | 47 | 6 |
| `AtcMetazoneFragment` | class | BaseFragment implements AdapterView.OnItemSelectedListener, View.OnClickListener | 196 | 33 |
| `AuthenticationFragment` | class | BaseFragment implements CompoundButton.OnCheckedChangeListener, AdapterView.OnItemSelec... | 177 | 30 |
| `BackupRecoveryFragment` | class | BaseFragment implements View.OnClickListener, View.OnTouchListener | 86 | 15 |
| `BaseFragment` | class | Fragment | 27 | 4 |
| `BluetoothFragment` | class | BaseFragment | 210 | 37 |
| `CameraFragment` | class | BaseFragment implements View.OnClickListener | 38 | 8 |
| `ConfigFragment` | class | BaseFragment implements AdapterView.OnItemSelectedListener | 123 | 16 |
| `EQFragment` | class | BaseFragment implements View.OnClickListener | 600 | 109 |
| `FaultCodeFragment` | class | BaseFragment implements View.OnClickListener | 142 | 18 |
| `LogFragment` | class | BaseFragment implements AdapterView.OnItemSelectedListener, View.OnClickListener, Compo... | 402 | 75 |
| `LoudSpeakerFragment` | class | BaseFragment implements SeekBar.OnSeekBarChangeListener, SoundVolumeManager.SoundVolume... | 337 | 72 |
| `MicTestFragment` | class | BaseFragment implements View.OnClickListener | 146 | 17 |
| `OtherFragment` | class | BaseFragment implements CompoundButton.OnCheckedChangeListener | 146 | 31 |
| `ProductInfoFragment` | class | BaseFragment | 237 | 37 |
| `ScreenFragment` | class | BaseFragment implements View.OnClickListener, SeekBar.OnSeekBarChangeListener | 179 | 30 |
| `StreelingWheelKeyFragment` | class | BaseFragment | 163 | 15 |
| `TemperatureInfoFragment` | class | BaseFragment | 185 | 27 |
| `TunerFragment` | class | BaseFragment implements View.OnClickListener | 163 | 26 |
| `USBTestFragment` | class | BaseFragment implements View.OnClickListener | 234 | 32 |
| `UsbUpgradeFragment` | class | BaseFragment | 31 | 4 |
| `WifiFragment` | class | BaseFragment | 118 | 27 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.fragment</code></b> (click to expand)</summary>

- **`AAHeadUnitInfoFragment`** — 9 function(s): `onCreateView()`, `initView()`, `onResume()`, `if()`, `for()`, `parseHeadUnitInfoXml()`, `accept()`, `parseSingleXmlFile()`, `HashMap()`
- **`AdditionalFragment`** — 32 function(s): `handleMessage()`, `onVehicleSpeedChanged()`, `onSwcAngleChanged()`, `AnonymousClass5()`, `onKeyboardBacklightChanged()`, `run()`, `if()`, `onCreateView()`, `initView()`, `onResume()`, `onPause()`, `onCheckedChanged()`, `onClick()`, `switch()`, `onDismiss()`, `openRebootDialog()`, `onProgressChanged()`, `onStartTrackingTouch()`, `onStopTrackingTouch()`, `onItemSelected()`, `setCameraType()`, `setScreenTemperatureProtectionState()`, `onNothingSelected()`, `sureButtonClick()`, `cancelButtonClick()`, `getCameraType()`, `getScreenTemperatureProtectionState()`, `getVehicleSpeed()`, `getSteeringWheelAngle()`, `getMcuBootloaderVersion()`, `getSystemVersion()`, `reboot()`
- **`AppInfoFragment`** — 5 function(s): `onCreateView()`, `initView()`, `onResume()`, `getPackageInfos()`, `if()`
- **`AtcMetazoneFragment`** — 20 function(s): `onCreateView()`, `initView()`, `initData()`, `onItemSelected()`, `if()`, `onNothingSelected()`, `onClick()`, `switch()`, `write()`, `read()`, `readMetazone()`, `run()`, `writeMetazone()`, `getIndex()`, `ArrayList()`, `bytesToInt()`, `return()`, `bytesToInts()`, `while()`, `for()`
- **`AuthenticationFragment`** — 13 function(s): `onCreateView()`, `initView()`, `onResume()`, `onCheckedChanged()`, `if()`, `createCertificateFile()`, `removeCertificateFile()`, `createHiCarCertificateFile()`, `removeHiCarCertificateFile()`, `onItemSelected()`, `onNothingSelected()`, `getCarType()`, `while()`
- **`BackupRecoveryFragment`** — 10 function(s): `onCreateView()`, `initView()`, `startFactory()`, `getContext()`, `onClick()`, `if()`, `openConfirmDialog()`, `sureButtonClick()`, `cancelButtonClick()`, `onTouch()`
- **`BaseFragment`** — 4 function(s): `onCreateView()`, `onResume()`, `onStop()`, `onDestroy()`
- **`BluetoothFragment`** — 22 function(s): `onConnectionStateChange()`, `if()`, `onReadRemoteRssi()`, `handleMessage()`, `onBluetoothConnectStateChanged()`, `onResume()`, `onCreateView()`, `initData()`, `initView()`, `getBluetoothRssi()`, `getBluetoothLocalName()`, `getBluetoothLocalAddress()`, `getBluetoothLocalVersion()`, `getBluetoothRemoteName()`, `getBluetoothRemoteAddress()`, `getBluetoothConnectStatus()`, `getString()`, `ReadRssiThread()`, `run()`, `while()`, `sleep()`, `onPause()`
- **`CameraFragment`** — 6 function(s): `onCreateView()`, `initView()`, `onClick()`, `if()`, `startRvc()`, `getActivity()`
- **`ConfigFragment`** — 12 function(s): `run()`, `onCreateView()`, `initView()`, `onClick()`, `openConfirmDialogDialog()`, `onResume()`, `onItemSelected()`, `if()`, `onNothingSelected()`, `sureButtonClick()`, `cancelButtonClick()`, `reboot()`
- **`EQFragment`** — 22 function(s): `onCreateView()`, `initView()`, `onClick()`, `onResume()`, `initData()`, `onStop()`, `onDestroy()`, `if()`, `while()`, `intStringToIntArray()`, `switch()`, `addFreqOne()`, `decFreqOne()`, `addGainOne()`, `decGainOne()`, `setBandGains()`, `copyIntArray()`, `for()`, `setBandValue()`, `setEq()`, `getFreqValues()`, `getGainValues()`
- **`FaultCodeFragment`** — 12 function(s): `handleMessage()`, `onFactoryModeErrorCodeChanged()`, `if()`, `onResume()`, `onCreateView()`, `initView()`, `onClick()`, `clearListView()`, `startTimer()`, `run()`, `cancelTimer()`, `onPause()`
- **`LogFragment`** — 28 function(s): `onDownloadLogState()`, `if()`, `onCreateView()`, `initView()`, `onItemSelected()`, `switch()`, `setTimeLogState()`, `setLevelLogState()`, `setMPULogState()`, `setMCULogState()`, `onNothingSelected()`, `getMPULogState()`, `while()`, `getMCULogState()`, `getLevelLogState()`, `getTimeLogState()`, `onClick()`, `downloadTBoxLog()`, `sureButtonClick()`, `cancelButtonClick()`, `cleanLog()`, `onCheckedChanged()`, `setCanLogDisplayView()`, `onStart()`, `onStop()`, `setTBoxLogButtonEnabled()`, `showToast()`, `isSupportTboxLog()`
- **`LoudSpeakerFragment`** — 22 function(s): `onAudioFocusChange()`, `if()`, `onCreateView()`, `initView()`, `onResume()`, `initData()`, `setVolumeProgress()`, `onPause()`, `audioStop()`, `setBtnBackgroundColor()`, `onProgressChanged()`, `switch()`, `handleVolumeChanged()`, `onStartTrackingTouch()`, `onStopTrackingTouch()`, `onChangedVolume()`, `onClick()`, `setBtnClickDisable()`, `audioPlay()`, `onCompletion()`, `setBtnClickAble()`, `getLoudSpeakerBalance()`
- **`MicTestFragment`** — 10 function(s): `onCreateView()`, `initView()`, `onResume()`, `initData()`, `onClick()`, `switch()`, `if()`, `for()`, `onCompletion()`, `setTitle()`
- **`OtherFragment`** — 16 function(s): `onCreateView()`, `initView()`, `onClick()`, `onResume()`, `initData()`, `onStop()`, `hideSNDialog()`, `onCheckedChanged()`, `if()`, `setHideCar()`, `showWriteSNDialog()`, `onDismiss()`, `onSure()`, `checkInputSNValue()`, `showSNError()`, `isAlphanumeric()`
- **`ProductInfoFragment`** — 31 function(s): `run()`, `onCreateView()`, `initView()`, `onResume()`, `getContext()`, `onPause()`, `if()`, `onClick()`, `LoadingDialog()`, `getSupplier()`, `getPartNumber()`, `getSN()`, `getVIN()`, `getMcuVersion()`, `getMcuBootVersion()`, `getSystemVersion()`, `getGPSVersion()`, `getBluetoothVersion()`, `getWifiVersion()`, `getVoiceVersion()`, `getDisplaySn()`, `getDisplayPn()`, `getDisplayCreateDate()`, `getDisplaySoftwareVersion()`, `getDisplayHardwareVersion()`, `getDisplaySupplierSoftwareVersion()`, `getDisplaySupplierHardwareVersion()`, `ProductInfoReceiver()`, `onReceive()`, `requestBspInfo()`, `Handler()`
- **`ScreenFragment`** — 14 function(s): `onChangedScreenBrightness()`, `if()`, `onCreateView()`, `initView()`, `onResume()`, `onPause()`, `onCheckedChanged()`, `onClick()`, `switch()`, `showScreenDisplayDetectionDialog()`, `onDismiss()`, `onProgressChanged()`, `onStartTrackingTouch()`, `onStopTrackingTouch()`
- **`StreelingWheelKeyFragment`** — 9 function(s): `AnonymousClass1()`, `onSteeringWheelKeyEvent()`, `if()`, `switch()`, `run()`, `onCreateView()`, `initView()`, `onResume()`, `onPause()`
- **`TemperatureInfoFragment`** — 18 function(s): `handleMessage()`, `onCreateView()`, `initView()`, `onStart()`, `getSOCTemperature()`, `readSocTemperature()`, `getCPUUtilization()`, `readCpuUtilization()`, `getAmplifierTemperature()`, `getTFTTemperature()`, `readTFTTemperature()`, `if()`, `for()`, `ReadTemperatureThread()`, `run()`, `while()`, `sleep()`, `onPause()`
- **`TunerFragment`** — 15 function(s): `onFreqSignal()`, `if()`, `onSeekStatusChange()`, `onFreqChanage()`, `onAudioFocusChange()`, `onPlayPause()`, `onCreateView()`, `initView()`, `onCreate()`, `Listener()`, `onClick()`, `onChanged()`, `initDate()`, `onDestroy()`, `switch()`
- **`USBTestFragment`** — 19 function(s): `handleMessage()`, `onChangePlayMusic()`, `if()`, `onUsbStatusChange()`, `UsbInfomationReceiveer()`, `onReceive()`, `onCreate()`, `onResume()`, `onPause()`, `onCreateView()`, `initView()`, `for()`, `onClick()`, `switch()`, `getMusic()`, `getVideo()`, `USBStateForPhotoAndVideoEvent()`, `toString()`, `clearListView()`
- **`UsbUpgradeFragment`** — 3 function(s): `onCreateView()`, `initView()`, `onClick()`
- **`WifiFragment`** — 14 function(s): `onCreateView()`, `initView()`, `getWifiSwitchStatus()`, `if()`, `getString()`, `getWifiConnectStatus()`, `getWifiName()`, `getIPaddress()`, `return()`, `getInternetId()`, `getConnectSpeed()`, `getWifiSignalStrength()`, `getMacAddress()`, `getClientStatusInfo()`

</details>

### Package `com.yftech.engineeringmode.manager`  (4 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ConfigManager` | class | — | 235 | 50 |
| `ScreenUpgradeCA1105Manager` | class | — | 274 | 46 |
| `SoundVolumeManager` | class | — | 162 | 36 |
| `UpgradeManager` | class | — | 395 | 58 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.manager</code></b> (click to expand)</summary>

- **`ConfigManager`** — 19 function(s): `getConfigs()`, `getNames()`, `ConfigManager()`, `getInstance()`, `synchronized()`, `if()`, `init()`, `loadConfigs()`, `setConfig0101()`, `setConfigData()`, `setConfig0100()`, `setConfigData0100()`, `setConfig()`, `for()`, `getConfigData()`, `return()`, `getConfigData0100()`, `setBitValue()`, `while()`
- **`ScreenUpgradeCA1105Manager`** — 20 function(s): `onScreenUpgradeCA1105State()`, `ScreenUpgradeCA1105Manager()`, `getInstance()`, `synchronized()`, `if()`, `addScreenUpgradeCA1105Listener()`, `removeScreenUpgradeCA1105Listener()`, `startUpgrade()`, `notifyOnScreenUpgradeCA1105State()`, `start()`, `Thread()`, `run()`, `checkScreenUpgradeFile()`, `for()`, `getCurScreenVersion()`, `getScreenUpgradeFileVersion()`, `while()`, `writeUpgradeBin()`, `checkAutoScreenUpgrade()`, `onDismiss()`
- **`SoundVolumeManager`** — 16 function(s): `onChangedVolume()`, `if()`, `for()`, `SoundVolumeManager()`, `getInstance()`, `synchronized()`, `init()`, `deInit()`, `addSoundVolumeListener()`, `removeSoundVolumeListener()`, `setVolume()`, `getVolume()`, `getMaxVolume()`, `slideVolume()`, `setRecoverVolume()`, `getRecoverVolume()`
- **`UpgradeManager`** — 21 function(s): `UpgradeManager()`, `getInstance()`, `synchronized()`, `if()`, `init()`, `deInit()`, `checkUpgradeFile()`, `for()`, `showCheckUpgradeFileDialog()`, `hideCheckUpgradeFileDialog()`, `onDismiss()`, `onUpgrade()`, `onCancel()`, `startUpgrade()`, `matchMCUUpgradeFile()`, `getMcuUpgradeFileVersion()`, `while()`, `matchMCUUpgradeFileSoc()`, `return()`, `getMcuVersion()`, `matchSocVersionAndMcuUpgradeFileVersion()`

</details>

### Package `com.yftech.engineeringmode.model`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CheckInfo` | class | — | 57 | 11 |
| `Metazone` | class | — | 45 | 4 |
| `Module` | class | — | 33 | 6 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.model</code></b> (click to expand)</summary>

- **`CheckInfo`** — 11 function(s): `getName()`, `setName()`, `getKey()`, `setKey()`, `getValue()`, `setValue()`, `getRealValue()`, `setRealValue()`, `getResult()`, `setResult()`, `toString()`
- **`Metazone`** — 3 function(s): `getBinaryIndex()`, `for()`, `getDwordIndex()`
- **`Module`** — 6 function(s): `getTag()`, `setTag()`, `getName()`, `setName()`, `isShow()`, `setShow()`

</details>

### Package `com.yftech.engineeringmode.util`  (8 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AppConstants` | class | — | 13 | 0 |
| `AudioSettingUtil` | class | — | 79 | 13 |
| `Copier` | class | — | 233 | 48 |
| `DeleteUtil` | class | — | 162 | 35 |
| `FactorySetting` | class | — | 89 | 8 |
| `LogManager` | class | — | 100 | 18 |
| `SharedPreferencesUtils` | class | — | 173 | 30 |
| `Utils` | class | — | 166 | 22 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.util</code></b> (click to expand)</summary>

- **`AudioSettingUtil`** — 9 function(s): `requestAudioFocus()`, `if()`, `abandonAudioFocus()`, `getStreamMaxVolume()`, `getStreamVolume()`, `setStreamVolume()`, `playSystemClickSoundEffect()`, `setMasterMute()`, `isMasterMute()`
- **`Copier`** — 9 function(s): `onProgress()`, `Copier()`, `getDirectoryFileCount()`, `if()`, `for()`, `copyFile()`, `while()`, `copyDirectory()`, `copy()`
- **`DeleteUtil`** — 7 function(s): `delete()`, `if()`, `deleteSingleFile()`, `deleteDirectory()`, `for()`, `deleFotaData()`, `deleteEntry()`
- **`FactorySetting`** — 5 function(s): `factoryReset()`, `clearOsData()`, `deleteSystemFile()`, `if()`, `run()`
- **`LogManager`** — 10 function(s): `onUsbStatusChange()`, `if()`, `LogManager()`, `getInstance()`, `synchronized()`, `init()`, `deInit()`, `startLog()`, `showToast()`, `while()`
- **`SharedPreferencesUtils`** — 19 function(s): `getInstance()`, `if()`, `putString()`, `getString()`, `putBoolean()`, `getBoolean()`, `putLong()`, `getLong()`, `putInt()`, `getInt()`, `putObject()`, `put()`, `getObject()`, `return()`, `setDataList()`, `getDataList()`, `setMap()`, `getMap()`, `get()`
- **`Utils`** — 12 function(s): `hexStr2ByteArray()`, `if()`, `for()`, `bytesToHexString()`, `formatHHMMSS()`, `getTime()`, `killProcess()`, `isSupportConfigSetting()`, `getScreenTpAutoBrightnessEnable()`, `setScreenTpAutoBrightnessEnable()`, `setNodeString()`, `getNodeString()`

</details>

### Package `com.yftech.engineeringmode.widget`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CanLogFloatView` | class | View.OnTouchListener | 137 | 18 |
| `GainEditText` | class | EditText | 46 | 11 |
| `SeekBarNumber` | class | AppCompatSeekBar | 170 | 34 |

<details>
<summary><b>Function list for <code>com.yftech.engineeringmode.widget</code></b> (click to expand)</summary>

- **`CanLogFloatView`** — 11 function(s): `onCanLogInfoChanged()`, `if()`, `run()`, `CanLogFloatView()`, `initFloatView()`, `onTouch()`, `floatLayoutTouch()`, `showFloatWindow()`, `hideFloatWindow()`, `setInfoText()`, `for()`
- **`GainEditText`** — 7 function(s): `GainEditText()`, `super()`, `setTextWatcher()`, `addTextChangedListener()`, `beforeTextChanged()`, `onTextChanged()`, `afterTextChanged()`
- **`SeekBarNumber`** — 16 function(s): `SeekBarNumber()`, `super()`, `initTextPaint()`, `initProgressPaint()`, `setAttrsFromXml()`, `onDraw()`, `if()`, `drawProgressPaint()`, `setNumberMin()`, `getNumberMin()`, `setSetVolume()`, `getSetVolume()`, `onTouchEvent()`, `isMoveOutside()`, `getMoveOutsideProgress()`, `setPaintProgress()`

</details>

### Package `android.arch.core`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.arch.core</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.arch.core.executor`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ArchTaskExecutor` | class | TaskExecutor | 65 | 13 |
| `DefaultTaskExecutor` | class | TaskExecutor | 36 | 6 |
| `TaskExecutor` | class | — | 19 | 6 |

<details>
<summary><b>Function list for <code>android.arch.core.executor</code></b> (click to expand)</summary>

- **`ArchTaskExecutor`** — 11 function(s): `execute()`, `ArchTaskExecutor()`, `getInstance()`, `if()`, `synchronized()`, `setDelegate()`, `executeOnDiskIO()`, `postToMainThread()`, `getMainThreadExecutor()`, `getIOThreadExecutor()`, `isMainThread()`
- **`DefaultTaskExecutor`** — 5 function(s): `executeOnDiskIO()`, `postToMainThread()`, `if()`, `synchronized()`, `isMainThread()`
- **`TaskExecutor`** — 5 function(s): `executeOnDiskIO()`, `isMainThread()`, `postToMainThread()`, `executeOnMainThread()`, `if()`

</details>

### Package `android.arch.core.internal`  (2 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `FastSafeIterableMap` | class | SafeIterableMap<K, V> | 44 | 7 |
| `SafeIterableMap` | class | Iterable<Map.Entry<K, V>> | 319 | 67 |

<details>
<summary><b>Function list for <code>android.arch.core.internal</code></b> (click to expand)</summary>

- **`FastSafeIterableMap`** — 6 function(s): `get()`, `putIfAbsent()`, `if()`, `remove()`, `contains()`, `ceil()`
- **`SafeIterableMap`** — 32 function(s): `supportRemove()`, `get()`, `while()`, `putIfAbsent()`, `if()`, `put()`, `remove()`, `for()`, `size()`, `iterator()`, `descendingIterator()`, `iteratorWithAdditions()`, `eldest()`, `newest()`, `equals()`, `return()`, `toString()`, `backward()`, `forward()`, `ListIterator()`, `hasNext()`, `nextNode()`, `next()`, `AscendingIterator()`, `super()`, `DescendingIterator()`, `IteratorWithAdditions()`, `Entry()`, `getKey()`, `getValue()`, `setValue()`, `UnsupportedOperationException()`

</details>

### Package `android.arch.core.util`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `Function` | class | — | 7 | 1 |

<details>
<summary><b>Function list for <code>android.arch.core.util</code></b> (click to expand)</summary>

- **`Function`** — 1 function(s): `apply()`

</details>

### Package `android.arch.lifecycle`  (29 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AndroidViewModel` | class | ViewModel | 17 | 3 |
| `ClassesInfoCache` | class | — | 206 | 52 |
| `CompositeGeneratedAdaptersObserver` | class | GenericLifecycleObserver | 25 | 4 |
| `ComputableLiveData` | class | — | 77 | 14 |
| `FullLifecycleObserver` | class | LifecycleObserver | 17 | 6 |
| `FullLifecycleObserverAdapter` | class | GenericLifecycleObserver | 43 | 4 |
| `GeneratedAdapter` | class | — | 9 | 1 |
| `GenericLifecycleObserver` | class | LifecycleObserver | 9 | 1 |
| `Lifecycle` | class | — | 36 | 5 |
| `LifecycleObserver` | class | — | 6 | 0 |
| `LifecycleOwner` | class | — | 7 | 1 |
| `LifecycleRegistry` | class | Lifecycle | 298 | 67 |
| `LifecycleRegistryOwner` | class | LifecycleOwner | 9 | 1 |
| `Lifecycling` | class | — | 136 | 33 |
| `LiveData` | class | LiveData<T>.ObserverWrapper implements GenericLifecycleObserver | 289 | 67 |
| `MediatorLiveData` | class | MutableLiveData<T> | 75 | 15 |
| `MethodCallsLogger` | class | — | 18 | 1 |
| `MutableLiveData` | class | LiveData<T> | 15 | 2 |
| `Observer` | class | — | 7 | 1 |
| `OnLifecycleEvent` | class | — | 15 | 1 |
| `R` | class | — | 8 | 1 |
| `ReflectiveGenericLifecycleObserver` | class | GenericLifecycleObserver | 23 | 2 |
| `ReportFragment` | class | Fragment | 111 | 32 |
| `SingleGeneratedAdapterObserver` | class | GenericLifecycleObserver | 20 | 2 |
| `Transformations` | class | — | 51 | 9 |
| `ViewModel` | class | — | 9 | 1 |
| `ViewModelProvider` | class | Factory | 93 | 23 |
| `ViewModelStore` | class | — | 29 | 5 |
| `ViewModelStoreOwner` | class | — | 7 | 1 |

<details>
<summary><b>Function list for <code>android.arch.lifecycle</code></b> (click to expand)</summary>

- **`AndroidViewModel`** — 3 function(s): `AndroidViewModel()`, `getApplication()`, `return()`
- **`ClassesInfoCache`** — 18 function(s): `hasLifecycleMethods()`, `if()`, `for()`, `createInfo()`, `getDeclaredMethods()`, `IllegalArgumentException()`, `getInfo()`, `verifyAndPutHandler()`, `while()`, `CallbackInfo()`, `invokeCallbacks()`, `invokeMethodsForEvent()`, `MethodReference()`, `invokeCallback()`, `RuntimeException()`, `equals()`, `hashCode()`, `return()`
- **`CompositeGeneratedAdaptersObserver`** — 3 function(s): `CompositeGeneratedAdaptersObserver()`, `onStateChanged()`, `for()`
- **`ComputableLiveData`** — 9 function(s): `compute()`, `ComputableLiveData()`, `this()`, `run()`, `if()`, `while()`, `onActive()`, `getLiveData()`, `invalidate()`
- **`FullLifecycleObserver`** — 6 function(s): `onCreate()`, `onDestroy()`, `onPause()`, `onResume()`, `onStart()`, `onStop()`
- **`FullLifecycleObserverAdapter`** — 4 function(s): `FullLifecycleObserverAdapter()`, `onStateChanged()`, `switch()`, `IllegalArgumentException()`
- **`GeneratedAdapter`** — 1 function(s): `callMethods()`
- **`GenericLifecycleObserver`** — 1 function(s): `onStateChanged()`
- **`Lifecycle`** — 5 function(s): `addObserver()`, `getCurrentState()`, `removeObserver()`, `isAtLeast()`, `compareTo()`
- **`LifecycleOwner`** — 1 function(s): `getLifecycle()`
- **`LifecycleRegistry`** — 26 function(s): `LifecycleRegistry()`, `markState()`, `moveToState()`, `handleLifecycleEvent()`, `if()`, `sync()`, `isSynced()`, `calculateTargetState()`, `min()`, `addObserver()`, `while()`, `pushParentState()`, `popParentState()`, `removeObserver()`, `getObserverCount()`, `getCurrentState()`, `getStateAfter()`, `switch()`, `IllegalArgumentException()`, `downEvent()`, `upEvent()`, `forwardPass()`, `backwardPass()`, `return()`, `ObserverWithState()`, `dispatchEvent()`
- **`LifecycleRegistryOwner`** — 1 function(s): `getLifecycle()`
- **`Lifecycling`** — 14 function(s): `getCallback()`, `if()`, `FullLifecycleObserverAdapter()`, `return()`, `SingleGeneratedAdapterObserver()`, `for()`, `CompositeGeneratedAdaptersObserver()`, `ReflectiveGenericLifecycleObserver()`, `createGeneratedAdapter()`, `RuntimeException()`, `getObserverConstructorType()`, `resolveObserverCallbackType()`, `isLifecycleParent()`, `getAdapterName()`
- **`LiveData`** — 31 function(s): `LiveData()`, `run()`, `synchronized()`, `considerNotify()`, `if()`, `dispatchingValue()`, `while()`, `observe()`, `IllegalArgumentException()`, `observeForever()`, `removeObserver()`, `assertMainThread()`, `removeObservers()`, `postValue()`, `setValue()`, `getValue()`, `getVersion()`, `onActive()`, `onInactive()`, `hasObservers()`, `hasActiveObservers()`, `LifecycleBoundObserver()`, `super()`, `shouldBeActive()`, `onStateChanged()`, `activeStateChanged()`, `isAttachedTo()`, `detachObserver()`, `ObserverWrapper()`, `AlwaysActiveObserver()`, `IllegalStateException()`
- **`MediatorLiveData`** — 11 function(s): `addSource()`, `if()`, `IllegalArgumentException()`, `removeSource()`, `onActive()`, `while()`, `onInactive()`, `Source()`, `plug()`, `unplug()`, `onChanged()`
- **`MethodCallsLogger`** — 1 function(s): `approveCall()`
- **`MutableLiveData`** — 2 function(s): `postValue()`, `setValue()`
- **`Observer`** — 1 function(s): `onChanged()`
- **`OnLifecycleEvent`** — 1 function(s): `value()`
- **`R`** — 1 function(s): `R()`
- **`ReflectiveGenericLifecycleObserver`** — 2 function(s): `ReflectiveGenericLifecycleObserver()`, `onStateChanged()`
- **`ReportFragment`** — 16 function(s): `onCreate()`, `onResume()`, `onStart()`, `injectIfNeededIn()`, `if()`, `get()`, `return()`, `dispatchCreate()`, `dispatchStart()`, `dispatchResume()`, `onActivityCreated()`, `dispatch()`, `onPause()`, `onStop()`, `onDestroy()`, `setProcessListener()`
- **`SingleGeneratedAdapterObserver`** — 2 function(s): `SingleGeneratedAdapterObserver()`, `onStateChanged()`
- **`Transformations`** — 5 function(s): `Transformations()`, `map()`, `onChanged()`, `switchMap()`, `if()`
- **`ViewModel`** — 1 function(s): `onCleared()`
- **`ViewModelProvider`** — 10 function(s): `create()`, `ViewModelProvider()`, `this()`, `get()`, `if()`, `IllegalArgumentException()`, `return()`, `RuntimeException()`, `getInstance()`, `AndroidViewModelFactory()`
- **`ViewModelStore`** — 5 function(s): `put()`, `if()`, `get()`, `clear()`, `for()`
- **`ViewModelStoreOwner`** — 1 function(s): `getViewModelStore()`

</details>

### Package `android.arch.lifecycle.livedata`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.arch.lifecycle.livedata</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.arch.lifecycle.livedata.core`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.arch.lifecycle.livedata.core</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.arch.lifecycle.viewmodel`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.arch.lifecycle.viewmodel</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.support.annotation`  (51 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AnimRes` | class | — | 15 | 0 |
| `AnimatorRes` | class | — | 15 | 0 |
| `AnyRes` | class | — | 15 | 0 |
| `AnyThread` | class | — | 15 | 0 |
| `ArrayRes` | class | — | 15 | 0 |
| `AttrRes` | class | — | 15 | 0 |
| `BinderThread` | class | — | 15 | 0 |
| `BoolRes` | class | — | 15 | 0 |
| `CallSuper` | class | — | 15 | 0 |
| `CheckResult` | class | — | 16 | 1 |
| `ColorInt` | class | — | 13 | 0 |
| `ColorLong` | class | — | 13 | 0 |
| `ColorRes` | class | — | 15 | 0 |
| `DimenRes` | class | — | 15 | 0 |
| `Dimension` | class | — | 20 | 1 |
| `DrawableRes` | class | — | 15 | 0 |
| `FloatRange` | class | — | 20 | 4 |
| `FontRes` | class | — | 15 | 0 |
| `FractionRes` | class | — | 15 | 0 |
| `GuardedBy` | class | — | 14 | 1 |
| `HalfFloat` | class | — | 13 | 0 |
| `IdRes` | class | — | 15 | 0 |
| `IntDef` | class | — | 16 | 2 |
| `IntRange` | class | — | 16 | 2 |
| `IntegerRes` | class | — | 15 | 0 |
| `InterpolatorRes` | class | — | 15 | 0 |
| `Keep` | class | — | 13 | 0 |
| `LayoutRes` | class | — | 15 | 0 |
| `LongDef` | class | — | 16 | 2 |
| `MainThread` | class | — | 15 | 0 |
| `MenuRes` | class | — | 15 | 0 |
| `NavigationRes` | class | — | 15 | 0 |
| `NonNull` | class | — | 15 | 0 |
| `Nullable` | class | — | 15 | 0 |
| `PluralsRes` | class | — | 15 | 0 |
| `Px` | class | — | 15 | 0 |
| `RawRes` | class | — | 15 | 0 |
| `RequiresApi` | class | — | 16 | 2 |
| `RequiresFeature` | class | — | 16 | 2 |
| `RequiresPermission` | class | — | 33 | 6 |
| `RestrictTo` | class | — | 24 | 1 |
| `Size` | class | — | 20 | 4 |
| `StringDef` | class | — | 14 | 1 |
| `StringRes` | class | — | 15 | 0 |
| `StyleRes` | class | — | 15 | 0 |
| `StyleableRes` | class | — | 15 | 0 |
| `TransitionRes` | class | — | 15 | 0 |
| `UiThread` | class | — | 15 | 0 |
| `VisibleForTesting` | class | — | 16 | 1 |
| `WorkerThread` | class | — | 15 | 0 |
| `XmlRes` | class | — | 15 | 0 |

<details>
<summary><b>Function list for <code>android.support.annotation</code></b> (click to expand)</summary>

- **`CheckResult`** — 1 function(s): `suggest()`
- **`Dimension`** — 1 function(s): `unit()`
- **`FloatRange`** — 4 function(s): `from()`, `fromInclusive()`, `to()`, `toInclusive()`
- **`GuardedBy`** — 1 function(s): `value()`
- **`IntDef`** — 2 function(s): `flag()`, `value()`
- **`IntRange`** — 2 function(s): `from()`, `to()`
- **`LongDef`** — 2 function(s): `flag()`, `value()`
- **`RequiresApi`** — 2 function(s): `api()`, `value()`
- **`RequiresFeature`** — 2 function(s): `enforcement()`, `name()`
- **`RequiresPermission`** — 4 function(s): `value()`, `allOf()`, `anyOf()`, `conditional()`
- **`RestrictTo`** — 1 function(s): `value()`
- **`Size`** — 4 function(s): `max()`, `min()`, `multiple()`, `value()`
- **`StringDef`** — 1 function(s): `value()`
- **`VisibleForTesting`** — 1 function(s): `otherwise()`

</details>

### Package `android.support.asynclayoutinflater`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.asynclayoutinflater</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.compat`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.compat</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.coordinatorlayout`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 237 | 11 |

<details>
<summary><b>Function list for <code>android.support.coordinatorlayout</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.coreui`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 237 | 11 |

<details>
<summary><b>Function list for <code>android.support.coreui</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.coreutils`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.coreutils</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.cursoradapter`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.support.cursoradapter</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.support.customview`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.customview</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.design`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 2,551 | 15 |

<details>
<summary><b>Function list for <code>android.support.design</code></b> (click to expand)</summary>

- **`R`** — 15 function(s): `R()`, `anim()`, `animator()`, `attr()`, `bool()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `interpolator()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.design.animation`  (10 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AnimationUtils` | class | — | 26 | 3 |
| `AnimatorSetCompat` | class | — | 23 | 2 |
| `ArgbEvaluatorCompat` | class | TypeEvaluator<Integer> | 33 | 2 |
| `ChildrenAlphaProperty` | class | Property<ViewGroup, Float> | 36 | 6 |
| `DrawableAlphaProperty` | class | Property<Drawable, Integer> | 37 | 7 |
| `ImageMatrixProperty` | class | Property<ImageView, Matrix> | 27 | 4 |
| `MatrixEvaluator` | class | TypeEvaluator<Matrix> | 27 | 2 |
| `MotionSpec` | class | — | 108 | 26 |
| `MotionTiming` | class | — | 115 | 22 |
| `Positioning` | class | — | 15 | 1 |

<details>
<summary><b>Function list for <code>android.support.design.animation</code></b> (click to expand)</summary>

- **`AnimationUtils`** — 2 function(s): `lerp()`, `return()`
- **`AnimatorSetCompat`** — 2 function(s): `playTogether()`, `for()`
- **`ArgbEvaluatorCompat`** — 2 function(s): `getInstance()`, `evaluate()`
- **`ChildrenAlphaProperty`** — 6 function(s): `ChildrenAlphaProperty()`, `super()`, `get()`, `if()`, `set()`, `for()`
- **`DrawableAlphaProperty`** — 5 function(s): `DrawableAlphaProperty()`, `super()`, `get()`, `if()`, `set()`
- **`ImageMatrixProperty`** — 4 function(s): `ImageMatrixProperty()`, `super()`, `set()`, `get()`
- **`MatrixEvaluator`** — 2 function(s): `evaluate()`, `for()`
- **`MotionSpec`** — 14 function(s): `hasTiming()`, `getTiming()`, `if()`, `IllegalArgumentException()`, `setTiming()`, `getTotalDuration()`, `for()`, `createFromAttribute()`, `createFromResource()`, `createSpecFromAnimators()`, `addTimingFromAnimator()`, `equals()`, `hashCode()`, `toString()`
- **`MotionTiming`** — 14 function(s): `MotionTiming()`, `apply()`, `if()`, `getDelay()`, `getDuration()`, `getInterpolator()`, `getRepeatCount()`, `getRepeatMode()`, `createFromAnimator()`, `getInterpolatorCompat()`, `equals()`, `hashCode()`, `return()`, `toString()`
- **`Positioning`** — 1 function(s): `Positioning()`

</details>

### Package `android.support.design.behavior`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `HideBottomViewOnScrollBehavior` | class | View> extends CoordinatorLayout.Behavior<V> | 85 | 17 |

<details>
<summary><b>Function list for <code>android.support.design.behavior</code></b> (click to expand)</summary>

- **`HideBottomViewOnScrollBehavior`** — 10 function(s): `HideBottomViewOnScrollBehavior()`, `super()`, `onLayoutChild()`, `onStartNestedScroll()`, `onNestedScroll()`, `if()`, `slideDown()`, `slideUp()`, `animateChildTo()`, `onAnimationEnd()`

</details>

### Package `android.support.design.bottomappbar`  (2 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BottomAppBar` | class | Toolbar implements CoordinatorLayout.AttachedBehavior | 611 | 135 |
| `BottomAppBarTopEdgeTreatment` | class | EdgeTreatment | 110 | 16 |

<details>
<summary><b>Function list for <code>android.support.design.bottomappbar</code></b> (click to expand)</summary>

- **`BottomAppBar`** — 61 function(s): `BottomAppBar()`, `this()`, `super()`, `onAnimationStart()`, `getFabAlignmentMode()`, `setFabAlignmentMode()`, `maybeAnimateModeChange()`, `maybeAnimateMenuView()`, `setBackgroundTint()`, `getBackgroundTint()`, `getFabCradleMargin()`, `setFabCradleMargin()`, `if()`, `getFabCradleRoundedCornerRadius()`, `setFabCradleRoundedCornerRadius()`, `getCradleVerticalOffset()`, `setCradleVerticalOffset()`, `getHideOnScroll()`, `setHideOnScroll()`, `replaceMenu()`, `getMenu()`, `inflateMenu()`, `setFabDiameter()`, `createCradleTranslationAnimation()`, `createFabTranslationXAnimation()`, `onAnimationEnd()`, `onAnimationUpdate()`, `findDependentFab()`, `for()`, `return()`, `isVisibleFab()`, `createMenuViewTranslationAnimation()`, `onAnimationCancel()`, `maybeAnimateAttachChange()`, `createCradleShapeAnimation()`, `createFabTranslationYAnimation()`, `getFabTranslationY()`, `getFabTranslationX()`, `getActionMenuView()`, `translateActionMenuView()`, `cancelAnimations()`, `isAnimationRunning()`, `onLayout()`, `setCutoutState()`, `addFabAnimationListeners()`, `removeFabAnimationListeners()`, `setTitle()`, `setSubtitle()`, `getBehavior()`, `Behavior()`, `updateFabPositionAndVisibility()`, `onLayoutChild()`, `onStartNestedScroll()`, `slideUp()`, `slideDown()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`
- **`BottomAppBarTopEdgeTreatment`** — 14 function(s): `BottomAppBarTopEdgeTreatment()`, `if()`, `IllegalArgumentException()`, `getEdgePath()`, `setHorizontalOffset()`, `getHorizontalOffset()`, `getCradleVerticalOffset()`, `setCradleVerticalOffset()`, `getFabDiameter()`, `setFabDiameter()`, `getFabCradleMargin()`, `setFabCradleMargin()`, `getFabCradleRoundedCornerRadius()`, `setFabCradleRoundedCornerRadius()`

</details>

### Package `android.support.design.bottomnavigation`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `LabelVisibilityMode` | class | — | 14 | 0 |

<details>
<summary><b>Function list for <code>android.support.design.bottomnavigation</code></b> (click to expand)</summary>


</details>

### Package `android.support.design.button`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `MaterialButton` | class | AppCompatButton | 392 | 111 |
| `MaterialButtonBackgroundDrawable` | class | RippleDrawable | 28 | 4 |
| `MaterialButtonHelper` | class | — | 318 | 61 |

<details>
<summary><b>Function list for <code>android.support.design.button</code></b> (click to expand)</summary>

- **`MaterialButton`** — 53 function(s): `MaterialButton()`, `this()`, `super()`, `setCompoundDrawablePadding()`, `updateIcon()`, `onDraw()`, `if()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `setBackgroundTintList()`, `getBackgroundTintList()`, `setBackgroundTintMode()`, `getBackgroundTintMode()`, `setBackgroundColor()`, `setBackground()`, `setBackgroundDrawable()`, `setBackgroundResource()`, `getBackground()`, `onLayout()`, `onMeasure()`, `isLayoutRTL()`, `setInternalBackground()`, `setIconPadding()`, `getIconPadding()`, `setIconSize()`, `IllegalArgumentException()`, `getIconSize()`, `setIcon()`, `setIconResource()`, `getIcon()`, `setIconTint()`, `setIconTintResource()`, `getIconTint()`, `setIconTintMode()`, `getIconTintMode()`, `setRippleColor()`, `setRippleColorResource()`, `getRippleColor()`, `setStrokeColor()`, `setStrokeColorResource()`, `getStrokeColor()`, `setStrokeWidth()`, `setStrokeWidthResource()`, `getStrokeWidth()`, `setCornerRadius()`, `setCornerRadiusResource()`, `getCornerRadius()`, `getIconGravity()`, `setIconGravity()`, `isUsingOriginalBackground()`, `return()`
- **`MaterialButtonBackgroundDrawable`** — 4 function(s): `MaterialButtonBackgroundDrawable()`, `super()`, `setColorFilter()`, `if()`
- **`MaterialButtonHelper`** — 30 function(s): `MaterialButtonHelper()`, `loadFromAttributes()`, `setBackgroundOverwritten()`, `isBackgroundOverwritten()`, `drawStroke()`, `if()`, `createBackgroundCompat()`, `wrapDrawableWithInset()`, `InsetDrawable()`, `setSupportBackgroundTintList()`, `updateTintAndTintModeLollipop()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `createBackgroundLollipop()`, `MaterialButtonBackgroundDrawable()`, `updateMaskBounds()`, `setBackgroundColor()`, `setRippleColor()`, `getRippleColor()`, `setStrokeColor()`, `updateStroke()`, `getStrokeColor()`, `setStrokeWidth()`, `getStrokeWidth()`, `setCornerRadius()`, `unwrapBackgroundDrawable()`, `unwrapStrokeDrawable()`, `getCornerRadius()`, `return()`

</details>

### Package `android.support.design.canvas`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CanvasCompat` | class | — | 26 | 5 |

<details>
<summary><b>Function list for <code>android.support.design.canvas</code></b> (click to expand)</summary>

- **`CanvasCompat`** — 3 function(s): `CanvasCompat()`, `saveLayerAlpha()`, `if()`

</details>

### Package `android.support.design.card`  (2 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `MaterialCardView` | class | CardView | 52 | 11 |
| `MaterialCardViewHelper` | class | — | 72 | 15 |

<details>
<summary><b>Function list for <code>android.support.design.card</code></b> (click to expand)</summary>

- **`MaterialCardView`** — 8 function(s): `MaterialCardView()`, `this()`, `super()`, `setStrokeColor()`, `getStrokeColor()`, `setStrokeWidth()`, `getStrokeWidth()`, `setRadius()`
- **`MaterialCardViewHelper`** — 10 function(s): `MaterialCardViewHelper()`, `loadFromAttributes()`, `updateForeground()`, `adjustContentPadding()`, `setStrokeColor()`, `getStrokeColor()`, `setStrokeWidth()`, `getStrokeWidth()`, `createForegroundDrawable()`, `if()`

</details>

### Package `android.support.design.chip`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `Chip` | class | AppCompatCheckBox implements ChipDrawable.Delegate | 1,569 | 460 |
| `ChipDrawable` | class | Drawable implements TintAwareDrawable, Drawable.Callback | 1,480 | 486 |
| `ChipGroup` | class | FlowLayout | 334 | 108 |

<details>
<summary><b>Function list for <code>android.support.design.chip</code></b> (click to expand)</summary>

- **`Chip`** — 176 function(s): `Chip()`, `this()`, `super()`, `onFontRetrieved()`, `onFontRetrievalFailed()`, `validateAttributes()`, `setChipDrawable()`, `initOutlineProvider()`, `setChecked()`, `setText()`, `setEllipsize()`, `setIncludeFontPadding()`, `if()`, `updateTextPaintDrawState()`, `setSingleLine()`, `setGravity()`, `updatePaddingInternal()`, `UnsupportedOperationException()`, `setOutlineProvider()`, `getOutline()`, `getChipDrawable()`, `unapplyChipDrawable()`, `applyChipDrawable()`, `onCreateDrawableState()`, `mergeDrawableStates()`, `onDraw()`, `calculateTextOffsetFromStart()`, `setBackgroundTintList()`, `setBackgroundTintMode()`, `setBackgroundColor()`, `setBackgroundResource()`, `setBackground()`, `setBackgroundDrawable()`, `setCompoundDrawables()`, `setCompoundDrawablesWithIntrinsicBounds()`, `setCompoundDrawablesRelative()`, `setCompoundDrawablesRelativeWithIntrinsicBounds()`, `getEllipsize()`, `setLines()`, `setMinLines()`, `setMaxLines()`, `setMaxWidth()`, `onChipDrawableSizeChange()`, `requestLayout()`, `invalidateOutline()`, `setOnCheckedChangeListenerInternal()`, `setOnCloseIconClickListener()`, `performCloseIconClick()`, `playSoundEffect()`, `onTouchEvent()`, `setCloseIconPressed()`, `onHoverEvent()`, `setCloseIconHovered()`, `handleAccessibilityExit()`, `dispatchHoverEvent()`, `dispatchKeyEvent()`, `onFocusChanged()`, `setFocusedVirtualView()`, `invalidate()`, `onKeyDown()`, `switch()`, `performClick()`, `moveFocus()`, `ensureFocus()`, `getFocusedRect()`, `setCloseIconFocused()`, `refreshDrawableState()`, `drawableStateChanged()`, `createCloseIconDrawableState()`, `hasCloseIcon()`, `return()`, `getCloseIconTouchBounds()`, `getCloseIconTouchBoundsInt()`, `onResolvePointerIcon()`, `ChipTouchHelper()`, `getVirtualViewAt()`, `getVisibleVirtualViews()`, `onPopulateNodeForVirtualView()`, `onPopulateNodeForHost()`, `onPerformActionForVirtualView()`, `getChipBackgroundColor()`, `setChipBackgroundColorResource()`, `setChipBackgroundColor()`, `getChipMinHeight()`, `setChipMinHeightResource()`, `setChipMinHeight()`, `getChipCornerRadius()`, `setChipCornerRadiusResource()`, `setChipCornerRadius()`, `getChipStrokeColor()`, `setChipStrokeColorResource()`, `setChipStrokeColor()`, `getChipStrokeWidth()`, `setChipStrokeWidthResource()`, `setChipStrokeWidth()`, `getRippleColor()`, `setRippleColorResource()`, `setRippleColor()`, `getText()`, `getChipText()`, `setChipTextResource()`, `setChipText()`, `getTextAppearance()`, `setTextAppearanceResource()`, `setTextAppearance()`, `isChipIconVisible()`, `isChipIconEnabled()`, `setChipIconVisible()`, `setChipIconEnabledResource()`, `setChipIconEnabled()`, `getChipIcon()`, `setChipIconResource()`, `setChipIcon()`, `getChipIconTint()`, `setChipIconTintResource()`, `setChipIconTint()`, `getChipIconSize()`, `setChipIconSizeResource()`, `setChipIconSize()`, `isCloseIconVisible()`, `isCloseIconEnabled()`, `setCloseIconVisible()`, `setCloseIconEnabledResource()`, `setCloseIconEnabled()`, `getCloseIcon()`, `setCloseIconResource()`, `setCloseIcon()`, `getCloseIconTint()`, `setCloseIconTintResource()`, `setCloseIconTint()`, `getCloseIconSize()`, `setCloseIconSizeResource()`, `setCloseIconSize()`, `setCloseIconContentDescription()`, `getCloseIconContentDescription()`, `isCheckable()`, `setCheckableResource()`, `setCheckable()`, `isCheckedIconVisible()`, `isCheckedIconEnabled()`, `setCheckedIconVisible()`, `setCheckedIconEnabledResource()`, `setCheckedIconEnabled()`, `getCheckedIcon()`, `setCheckedIconResource()`, `setCheckedIcon()`, `getShowMotionSpec()`, `setShowMotionSpecResource()`, `setShowMotionSpec()`, `getHideMotionSpec()`, `setHideMotionSpecResource()`, `setHideMotionSpec()`, `getChipStartPadding()`, `setChipStartPaddingResource()`, `setChipStartPadding()`, `getIconStartPadding()`, `setIconStartPaddingResource()`, `setIconStartPadding()`, `getIconEndPadding()`, `setIconEndPaddingResource()`, `setIconEndPadding()`, `getTextStartPadding()`, `setTextStartPaddingResource()`, `setTextStartPadding()`, `getTextEndPadding()`, `setTextEndPaddingResource()`, `setTextEndPadding()`, `getCloseIconStartPadding()`, `setCloseIconStartPaddingResource()`, `setCloseIconStartPadding()`, `getCloseIconEndPadding()`, `setCloseIconEndPaddingResource()`, `setCloseIconEndPadding()`, `getChipEndPadding()`, `setChipEndPaddingResource()`, `setChipEndPadding()`
- **`ChipDrawable`** — 170 function(s): `onFontRetrieved()`, `onFontRetrievalFailed()`, `onChipDrawableSizeChange()`, `createFromAttributes()`, `createFromResource()`, `if()`, `XmlPullParserException()`, `ChipDrawable()`, `setState()`, `setCloseIconState()`, `loadFromAttributes()`, `setChipBackgroundColor()`, `setChipMinHeight()`, `setChipCornerRadius()`, `setChipStrokeColor()`, `setChipStrokeWidth()`, `setRippleColor()`, `setText()`, `setTextAppearance()`, `setEllipsize()`, `setChipIconVisible()`, `setChipIcon()`, `setChipIconTint()`, `setChipIconSize()`, `setCloseIconVisible()`, `setCloseIcon()`, `setCloseIconTint()`, `setCloseIconSize()`, `setCheckable()`, `setCheckedIconVisible()`, `setCheckedIcon()`, `setShowMotionSpec()`, `setHideMotionSpec()`, `setChipStartPadding()`, `setIconStartPadding()`, `setIconEndPadding()`, `setTextStartPadding()`, `setTextEndPadding()`, `setCloseIconStartPadding()`, `setCloseIconEndPadding()`, `setChipEndPadding()`, `setMaxWidth()`, `setUseCompatRipple()`, `updateCompatRippleColor()`, `onStateChange()`, `getUseCompatRipple()`, `setDelegate()`, `onSizeChange()`, `getChipTouchBounds()`, `calculateChipTouchBounds()`, `getCloseIconTouchBounds()`, `calculateCloseIconTouchBounds()`, `getIntrinsicWidth()`, `getIntrinsicHeight()`, `return()`, `showsChipIcon()`, `showsCheckedIcon()`, `showsCloseIcon()`, `canShowCheckedIcon()`, `calculateChipIconWidth()`, `getTextWidth()`, `calculateTextWidth()`, `calculateCloseIconWidth()`, `draw()`, `drawChipBackground()`, `drawChipStroke()`, `drawCompatRipple()`, `drawChipIcon()`, `drawCheckedIcon()`, `drawText()`, `drawCloseIcon()`, `drawDebug()`, `calculateChipIconBounds()`, `calculateTextBounds()`, `calculateCloseIconBounds()`, `calculateTextOriginAndAlignment()`, `calculateTextCenterFromBaseline()`, `isStateful()`, `isCloseIconStateful()`, `getCloseIconState()`, `invalidateSelf()`, `onLayoutDirectionChanged()`, `onLevelChange()`, `setVisible()`, `setAlpha()`, `getAlpha()`, `setColorFilter()`, `getColorFilter()`, `setTintList()`, `setTintMode()`, `getOpacity()`, `getOutline()`, `invalidateDrawable()`, `scheduleDrawable()`, `unscheduleDrawable()`, `unapplyChildDrawable()`, `applyChildDrawable()`, `getTintColorFilter()`, `hasState()`, `for()`, `getChipBackgroundColor()`, `setChipBackgroundColorResource()`, `getChipMinHeight()`, `setChipMinHeightResource()`, `getChipCornerRadius()`, `setChipCornerRadiusResource()`, `getChipStrokeColor()`, `setChipStrokeColorResource()`, `getChipStrokeWidth()`, `setChipStrokeWidthResource()`, `getRippleColor()`, `setRippleColorResource()`, `getText()`, `setTextResource()`, `getTextAppearance()`, `setTextAppearanceResource()`, `getEllipsize()`, `isChipIconVisible()`, `isChipIconEnabled()`, `setChipIconEnabledResource()`, `setChipIconEnabled()`, `getChipIcon()`, `setChipIconResource()`, `getChipIconTint()`, `setChipIconTintResource()`, `getChipIconSize()`, `setChipIconSizeResource()`, `isCloseIconVisible()`, `isCloseIconEnabled()`, `setCloseIconEnabledResource()`, `setCloseIconEnabled()`, `getCloseIcon()`, `setCloseIconResource()`, `getCloseIconTint()`, `setCloseIconTintResource()`, `getCloseIconSize()`, `setCloseIconSizeResource()`, `setCloseIconContentDescription()`, `getCloseIconContentDescription()`, `isCheckable()`, `setCheckableResource()`, `isCheckedIconVisible()`, `isCheckedIconEnabled()`, `setCheckedIconEnabledResource()`, `setCheckedIconEnabled()`, `getCheckedIcon()`, `setCheckedIconResource()`, `getShowMotionSpec()`, `setShowMotionSpecResource()`, `getHideMotionSpec()`, `setHideMotionSpecResource()`, `getChipStartPadding()`, `setChipStartPaddingResource()`, `getIconStartPadding()`, `setIconStartPaddingResource()`, `getIconEndPadding()`, `setIconEndPaddingResource()`, `getTextStartPadding()`, `setTextStartPaddingResource()`, `getTextEndPadding()`, `setTextEndPaddingResource()`, `getCloseIconStartPadding()`, `setCloseIconStartPaddingResource()`, `getCloseIconEndPadding()`, `setCloseIconEndPaddingResource()`, `getChipEndPadding()`, `setChipEndPaddingResource()`, `getMaxWidth()`, `shouldDrawText()`, `setShouldDrawText()`
- **`ChipGroup`** — 43 function(s): `onCheckedChanged()`, `LayoutParams()`, `super()`, `ChipGroup()`, `this()`, `setChipSpacingHorizontal()`, `setChipSpacingVertical()`, `setSingleLine()`, `setSingleSelection()`, `if()`, `generateLayoutParams()`, `generateDefaultLayoutParams()`, `checkLayoutParams()`, `setOnHierarchyChangeListener()`, `onFinishInflate()`, `setCheckedStateForView()`, `setCheckedId()`, `addView()`, `setDividerDrawableHorizontal()`, `UnsupportedOperationException()`, `setDividerDrawableVertical()`, `setShowDividerHorizontal()`, `setShowDividerVertical()`, `setFlexWrap()`, `check()`, `getCheckedChipId()`, `clearCheck()`, `for()`, `setOnCheckedChangeListener()`, `setChipSpacing()`, `setChipSpacingResource()`, `getChipSpacingHorizontal()`, `setItemSpacing()`, `requestLayout()`, `setChipSpacingHorizontalResource()`, `getChipSpacingVertical()`, `setLineSpacing()`, `setChipSpacingVerticalResource()`, `isSingleSelection()`, `CheckedStateTracker()`, `PassThroughHierarchyChangeListener()`, `onChildViewAdded()`, `onChildViewRemoved()`

</details>

### Package `android.support.design.circularreveal`  (7 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CircularRevealCompat` | class | — | 62 | 11 |
| `CircularRevealFrameLayout` | class | FrameLayout implements CircularRevealWidget | 92 | 18 |
| `CircularRevealGridLayout` | class | GridLayout implements CircularRevealWidget | 92 | 18 |
| `CircularRevealHelper` | class | — | 243 | 50 |
| `CircularRevealLinearLayout` | class | LinearLayout implements CircularRevealWidget | 92 | 18 |
| `CircularRevealRelativeLayout` | class | RelativeLayout implements CircularRevealWidget | 92 | 18 |
| `CircularRevealWidget` | class | CircularRevealHelper.Delegate | 117 | 27 |

<details>
<summary><b>Function list for <code>android.support.design.circularreveal</code></b> (click to expand)</summary>

- **`CircularRevealCompat`** — 8 function(s): `CircularRevealCompat()`, `createCircularReveal()`, `if()`, `IllegalStateException()`, `createCircularRevealListener()`, `AnimatorListenerAdapter()`, `onAnimationStart()`, `onAnimationEnd()`
- **`CircularRevealFrameLayout`** — 16 function(s): `CircularRevealFrameLayout()`, `this()`, `super()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `getRevealInfo()`, `setRevealInfo()`, `getCircularRevealScrimColor()`, `setCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `draw()`, `if()`, `actualDraw()`, `isOpaque()`, `actualIsOpaque()`
- **`CircularRevealGridLayout`** — 16 function(s): `CircularRevealGridLayout()`, `this()`, `super()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `getRevealInfo()`, `setRevealInfo()`, `getCircularRevealScrimColor()`, `setCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `draw()`, `if()`, `actualDraw()`, `isOpaque()`, `actualIsOpaque()`
- **`CircularRevealHelper`** — 24 function(s): `actualDraw()`, `actualIsOpaque()`, `if()`, `CircularRevealHelper()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `setRevealInfo()`, `invalidateRevealInfo()`, `getRevealInfo()`, `setCircularRevealScrimColor()`, `getCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `getDistanceToFurthestCorner()`, `draw()`, `IllegalStateException()`, `drawOverlayDrawable()`, `isOpaque()`, `shouldDrawCircularReveal()`, `shouldDrawScrim()`, `return()`, `shouldDrawOverlayDrawable()`, `drawDebugMode()`, `drawDebugCircle()`
- **`CircularRevealLinearLayout`** — 16 function(s): `CircularRevealLinearLayout()`, `this()`, `super()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `getRevealInfo()`, `setRevealInfo()`, `getCircularRevealScrimColor()`, `setCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `draw()`, `if()`, `actualDraw()`, `isOpaque()`, `actualIsOpaque()`
- **`CircularRevealRelativeLayout`** — 16 function(s): `CircularRevealRelativeLayout()`, `this()`, `super()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `getRevealInfo()`, `setRevealInfo()`, `getCircularRevealScrimColor()`, `setCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `draw()`, `if()`, `actualDraw()`, `isOpaque()`, `actualIsOpaque()`
- **`CircularRevealWidget`** — 19 function(s): `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `draw()`, `getCircularRevealOverlayDrawable()`, `getCircularRevealScrimColor()`, `getRevealInfo()`, `isOpaque()`, `setCircularRevealOverlayDrawable()`, `setCircularRevealScrimColor()`, `setRevealInfo()`, `RevealInfo()`, `this()`, `set()`, `isInvalid()`, `CircularRevealProperty()`, `super()`, `get()`, `evaluate()`, `CircularRevealScrimColorProperty()`

</details>

### Package `android.support.design.circularreveal.cardview`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CircularRevealCardView` | class | CardView implements CircularRevealWidget | 93 | 18 |

<details>
<summary><b>Function list for <code>android.support.design.circularreveal.cardview</code></b> (click to expand)</summary>

- **`CircularRevealCardView`** — 16 function(s): `CircularRevealCardView()`, `this()`, `super()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `setRevealInfo()`, `getRevealInfo()`, `setCircularRevealScrimColor()`, `getCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `draw()`, `if()`, `actualDraw()`, `isOpaque()`, `actualIsOpaque()`

</details>

### Package `android.support.design.circularreveal.coordinatorlayout`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CircularRevealCoordinatorLayout` | class | CoordinatorLayout implements CircularRevealWidget | 93 | 18 |

<details>
<summary><b>Function list for <code>android.support.design.circularreveal.coordinatorlayout</code></b> (click to expand)</summary>

- **`CircularRevealCoordinatorLayout`** — 16 function(s): `CircularRevealCoordinatorLayout()`, `this()`, `super()`, `buildCircularRevealCache()`, `destroyCircularRevealCache()`, `setRevealInfo()`, `getRevealInfo()`, `setCircularRevealScrimColor()`, `getCircularRevealScrimColor()`, `getCircularRevealOverlayDrawable()`, `setCircularRevealOverlayDrawable()`, `draw()`, `if()`, `actualDraw()`, `isOpaque()`, `actualIsOpaque()`

</details>

### Package `android.support.design.drawable`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `DrawableUtils` | class | — | 21 | 4 |

<details>
<summary><b>Function list for <code>android.support.design.drawable</code></b> (click to expand)</summary>

- **`DrawableUtils`** — 4 function(s): `DrawableUtils()`, `updateTintFilter()`, `if()`, `PorterDuffColorFilter()`

</details>

### Package `android.support.design.expandable`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ExpandableTransformationWidget` | class | ExpandableWidget | 9 | 2 |
| `ExpandableWidget` | class | — | 9 | 2 |
| `ExpandableWidgetHelper` | class | — | 62 | 13 |

<details>
<summary><b>Function list for <code>android.support.design.expandable</code></b> (click to expand)</summary>

- **`ExpandableTransformationWidget`** — 2 function(s): `getExpandedComponentIdHint()`, `setExpandedComponentIdHint()`
- **`ExpandableWidget`** — 2 function(s): `isExpanded()`, `setExpanded()`
- **`ExpandableWidgetHelper`** — 9 function(s): `ExpandableWidgetHelper()`, `setExpanded()`, `if()`, `dispatchExpandedStateChanged()`, `isExpanded()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setExpandedComponentIdHint()`, `getExpandedComponentIdHint()`

</details>

### Package `android.support.design.internal`  (18 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BaselineLayout` | class | ViewGroup | 85 | 18 |
| `BottomNavigationItemView` | class | FrameLayout implements MenuView.ItemView | 299 | 90 |
| `BottomNavigationMenu` | class | MenuBuilder | 37 | 10 |
| `BottomNavigationMenuView` | class | ViewGroup implements MenuView | 444 | 91 |
| `BottomNavigationPresenter` | class | MenuPresenter | 138 | 25 |
| `Experimental` | class | — | 14 | 1 |
| `FlowLayout` | class | ViewGroup | 175 | 35 |
| `ForegroundLinearLayout` | class | LinearLayoutCompat | 171 | 40 |
| `NavigationMenu` | class | MenuBuilder | 23 | 3 |
| `NavigationMenuItemView` | class | ForegroundLinearLayout implements MenuView.ItemView | 242 | 58 |
| `NavigationMenuPresenter` | class | MenuPresenter | 639 | 146 |
| `NavigationMenuView` | class | RecyclerView implements MenuView | 34 | 9 |
| `NavigationSubMenu` | class | SubMenuBuilder | 20 | 3 |
| `ParcelableSparseArray` | class | SparseArray<Parcelable> implements Parcelable | 59 | 12 |
| `ScrimInsetsFrameLayout` | class | FrameLayout | 97 | 16 |
| `TextScale` | class | Transition | 57 | 10 |
| `ThemeEnforcement` | class | — | 103 | 32 |
| `ViewUtils` | class | — | 36 | 6 |

<details>
<summary><b>Function list for <code>android.support.design.internal</code></b> (click to expand)</summary>

- **`BaselineLayout`** — 9 function(s): `BaselineLayout()`, `super()`, `onMeasure()`, `for()`, `if()`, `measureChild()`, `setMeasuredDimension()`, `onLayout()`, `getBaseline()`
- **`BottomNavigationItemView`** — 36 function(s): `BottomNavigationItemView()`, `this()`, `super()`, `setBackgroundResource()`, `setFocusable()`, `calculateTextScaleFactors()`, `initialize()`, `setCheckable()`, `setChecked()`, `setEnabled()`, `setIcon()`, `setTitle()`, `setId()`, `if()`, `setContentDescription()`, `setVisibility()`, `setItemPosition()`, `getItemPosition()`, `setShifting()`, `setLabelVisibilityMode()`, `getItemData()`, `refreshDrawableState()`, `setViewLayoutParams()`, `setViewValues()`, `setSelected()`, `onCreateDrawableState()`, `mergeDrawableStates()`, `setShortcut()`, `prefersCondensedTitle()`, `showsIcon()`, `setIconTintList()`, `setIconSize()`, `setTextAppearanceInactive()`, `setTextAppearanceActive()`, `setTextColor()`, `setItemBackground()`
- **`BottomNavigationMenu`** — 9 function(s): `BottomNavigationMenu()`, `super()`, `addSubMenu()`, `UnsupportedOperationException()`, `addInternal()`, `if()`, `IllegalArgumentException()`, `stopDispatchingItemsChanged()`, `startDispatchingItemsChanged()`
- **`BottomNavigationMenuView`** — 42 function(s): `BottomNavigationMenuView()`, `this()`, `super()`, `onClick()`, `if()`, `initialize()`, `onMeasure()`, `while()`, `for()`, `setMeasuredDimension()`, `onLayout()`, `getWindowAnimations()`, `setIconTintList()`, `getIconTintList()`, `setItemIconSize()`, `getItemIconSize()`, `setItemTextColor()`, `getItemTextColor()`, `setItemTextAppearanceInactive()`, `getItemTextAppearanceInactive()`, `setItemTextAppearanceActive()`, `getItemTextAppearanceActive()`, `setItemBackgroundRes()`, `getItemBackgroundRes()`, `setItemBackground()`, `getItemBackground()`, `setLabelVisibilityMode()`, `getLabelVisibilityMode()`, `setItemHorizontalTranslationEnabled()`, `isItemHorizontalTranslationEnabled()`, `createDefaultColorStateList()`, `ColorStateList()`, `setPresenter()`, `buildMenuView()`, `removeAllViews()`, `addView()`, `updateMenuView()`, `getNewItem()`, `BottomNavigationItemView()`, `getSelectedItemId()`, `isShifting()`, `tryRestoreSelectedItemId()`
- **`BottomNavigationPresenter`** — 21 function(s): `setBottomNavigationMenuView()`, `initForMenu()`, `getMenuView()`, `updateMenuView()`, `if()`, `setCallback()`, `onSubMenuSelected()`, `onCloseMenu()`, `flagActionItems()`, `expandItemActionView()`, `collapseItemActionView()`, `setId()`, `getId()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setUpdateSuspended()`, `createFromParcel()`, `SavedState()`, `newArray()`, `describeContents()`, `writeToParcel()`
- **`Experimental`** — 1 function(s): `value()`
- **`FlowLayout`** — 18 function(s): `FlowLayout()`, `this()`, `super()`, `loadFromAttributes()`, `getLineSpacing()`, `setLineSpacing()`, `getItemSpacing()`, `setItemSpacing()`, `isSingleLine()`, `setSingleLine()`, `onMeasure()`, `while()`, `if()`, `measureChild()`, `setMeasuredDimension()`, `getMeasuredDimension()`, `onLayout()`, `for()`
- **`ForegroundLinearLayout`** — 19 function(s): `ForegroundLinearLayout()`, `this()`, `super()`, `if()`, `setForeground()`, `getForegroundGravity()`, `setForegroundGravity()`, `requestLayout()`, `verifyDrawable()`, `jumpDrawablesToCurrentState()`, `drawableStateChanged()`, `unscheduleDrawable()`, `setWillNotDraw()`, `invalidate()`, `getForeground()`, `onLayout()`, `onSizeChanged()`, `draw()`, `drawableHotspotChanged()`
- **`NavigationMenu`** — 3 function(s): `NavigationMenu()`, `super()`, `addSubMenu()`
- **`NavigationMenuItemView`** — 33 function(s): `NavigationMenuItemView()`, `this()`, `super()`, `onInitializeAccessibilityNodeInfo()`, `setOrientation()`, `initialize()`, `setVisibility()`, `if()`, `setCheckable()`, `setChecked()`, `setEnabled()`, `setTitle()`, `setIcon()`, `setActionView()`, `setContentDescription()`, `adjustAppearance()`, `shouldExpandActionArea()`, `recycle()`, `createDefaultBackground()`, `getItemData()`, `refreshDrawableState()`, `setShortcut()`, `prefersCondensedTitle()`, `showsIcon()`, `onCreateDrawableState()`, `mergeDrawableStates()`, `setIconTintList()`, `setTextAppearance()`, `setTextColor()`, `setNeedsEmptyIcon()`, `setHorizontalPadding()`, `setPadding()`, `setIconPadding()`
- **`NavigationMenuPresenter`** — 63 function(s): `onClick()`, `if()`, `initForMenu()`, `getMenuView()`, `updateMenuView()`, `setCallback()`, `onSubMenuSelected()`, `onCloseMenu()`, `flagActionItems()`, `expandItemActionView()`, `collapseItemActionView()`, `getId()`, `setId()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setCheckedItem()`, `getCheckedItem()`, `inflateHeaderView()`, `addHeaderView()`, `removeHeaderView()`, `getHeaderCount()`, `getHeaderView()`, `getItemTintList()`, `setItemIconTintList()`, `getItemTextColor()`, `setItemTextColor()`, `setItemTextAppearance()`, `getItemBackground()`, `setItemBackground()`, `getItemHorizontalPadding()`, `setItemHorizontalPadding()`, `getItemIconPadding()`, `setItemIconPadding()`, `setUpdateSuspended()`, `dispatchApplyWindowInsets()`, `ViewHolder()`, `super()`, `NormalViewHolder()`, `SubheaderViewHolder()`, `SeparatorViewHolder()`, `HeaderViewHolder()`, `NavigationMenuAdapter()`, `prepareMenuItems()`, `getItemId()`, `getItemCount()`, `getItemViewType()`, `RuntimeException()`, `onCreateViewHolder()`, `onBindViewHolder()`, `onViewRecycled()`, `update()`, `notifyDataSetChanged()`, `while()`, `for()`, `appendTransparentIconIfMissing()`, `createInstanceState()`, `restoreInstanceState()`, `NavigationMenuTextItem()`, `getMenuItem()`, `NavigationMenuSeparatorItem()`, `getPaddingTop()`, `getPaddingBottom()`, `NavigationMenuHeaderItem()`
- **`NavigationMenuView`** — 6 function(s): `NavigationMenuView()`, `this()`, `super()`, `setLayoutManager()`, `initialize()`, `getWindowAnimations()`
- **`NavigationSubMenu`** — 3 function(s): `NavigationSubMenu()`, `super()`, `onItemsChanged()`
- **`ParcelableSparseArray`** — 7 function(s): `createFromParcel()`, `ParcelableSparseArray()`, `newArray()`, `for()`, `put()`, `describeContents()`, `writeToParcel()`
- **`ScrimInsetsFrameLayout`** — 10 function(s): `ScrimInsetsFrameLayout()`, `this()`, `super()`, `setWillNotDraw()`, `onApplyWindowInsets()`, `if()`, `draw()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `onInsetsChanged()`
- **`TextScale`** — 6 function(s): `captureStartValues()`, `captureValues()`, `captureEndValues()`, `if()`, `createAnimator()`, `onAnimationUpdate()`
- **`ThemeEnforcement`** — 15 function(s): `ThemeEnforcement()`, `obtainStyledAttributes()`, `checkCompatibleTheme()`, `checkTextAppearance()`, `obtainTintedStyledAttributes()`, `if()`, `checkMaterialTheme()`, `checkAppCompatTheme()`, `IllegalArgumentException()`, `isCustomTextAppearanceValid()`, `for()`, `checkTheme()`, `isAppCompatTheme()`, `isTheme()`, `isMaterialTheme()`
- **`ViewUtils`** — 4 function(s): `parseTintMode()`, `if()`, `switch()`, `isLayoutRtl()`

</details>

### Package `android.support.design.resources`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `MaterialResources` | class | — | 48 | 10 |
| `TextAppearance` | class | — | 165 | 28 |
| `TextAppearanceConfig` | class | — | 15 | 2 |

<details>
<summary><b>Function list for <code>android.support.design.resources</code></b> (click to expand)</summary>

- **`MaterialResources`** — 7 function(s): `MaterialResources()`, `getColorStateList()`, `if()`, `getDrawable()`, `getTextAppearance()`, `TextAppearance()`, `getIndexWithValue()`
- **`TextAppearance`** — 10 function(s): `TextAppearance()`, `getFont()`, `if()`, `createFallbackTypeface()`, `getFontAsync()`, `updateTextPaintMeasureState()`, `onFontRetrieved()`, `onFontRetrievalFailed()`, `updateDrawState()`, `updateMeasureState()`
- **`TextAppearanceConfig`** — 2 function(s): `setShouldLoadFontSynchronously()`, `shouldLoadFontSynchronously()`

</details>

### Package `android.support.design.ripple`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `RippleUtils` | class | — | 109 | 8 |

<details>
<summary><b>Function list for <code>android.support.design.ripple</code></b> (click to expand)</summary>

- **`RippleUtils`** — 6 function(s): `RippleUtils()`, `convertToRippleDrawableColor()`, `if()`, `ColorStateList()`, `getColorForState()`, `doubleAlpha()`

</details>

### Package `android.support.design.shape`  (9 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CornerTreatment` | class | — | 8 | 1 |
| `CutCornerTreatment` | class | CornerTreatment | 17 | 2 |
| `EdgeTreatment` | class | — | 9 | 1 |
| `InterpolateOnScrollPositionChangeHelper` | class | — | 69 | 11 |
| `MaterialShapeDrawable` | class | Drawable implements TintAwareDrawable | 416 | 99 |
| `RoundedCornerTreatment` | class | CornerTreatment | 18 | 2 |
| `ShapePath` | class | PathOperation | 137 | 15 |
| `ShapePathModel` | class | — | 121 | 21 |
| `TriangleEdgeTreatment` | class | EdgeTreatment | 21 | 2 |

<details>
<summary><b>Function list for <code>android.support.design.shape</code></b> (click to expand)</summary>

- **`CornerTreatment`** — 1 function(s): `getCornerPath()`
- **`CutCornerTreatment`** — 2 function(s): `CutCornerTreatment()`, `getCornerPath()`
- **`EdgeTreatment`** — 1 function(s): `getEdgePath()`
- **`InterpolateOnScrollPositionChangeHelper`** — 9 function(s): `onScrollChanged()`, `InterpolateOnScrollPositionChangeHelper()`, `setMaterialShapeDrawable()`, `setContainingScrollView()`, `startListeningForScrollChanges()`, `stopListeningForScrollChanges()`, `updateInterpolationForScreenPosition()`, `if()`, `IllegalStateException()`
- **`MaterialShapeDrawable`** — 47 function(s): `MaterialShapeDrawable()`, `this()`, `for()`, `modulateAlpha()`, `return()`, `getShapedViewModel()`, `setShapedViewModel()`, `invalidateSelf()`, `getTintList()`, `setTintList()`, `updateTintFilter()`, `setTintMode()`, `setTint()`, `getOpacity()`, `setAlpha()`, `setColorFilter()`, `getTransparentRegion()`, `getPath()`, `isPointInTransparentRegion()`, `isShadowEnabled()`, `setShadowEnabled()`, `getInterpolation()`, `setInterpolation()`, `getShadowElevation()`, `setShadowElevation()`, `getShadowRadius()`, `setShadowRadius()`, `getScale()`, `setScale()`, `setUseTintColorForShadow()`, `setShadowColor()`, `getPaintStyle()`, `setPaintStyle()`, `getStrokeWidth()`, `setStrokeWidth()`, `draw()`, `if()`, `getPathForSize()`, `setCornerPathAndTransform()`, `setEdgeTransform()`, `appendCornerPath()`, `appendEdgePath()`, `getCoordinatesOfCorner()`, `getCornerTreatmentForIndex()`, `getEdgeTreatmentForIndex()`, `angleOfCorner()`, `angleOfEdge()`
- **`RoundedCornerTreatment`** — 2 function(s): `RoundedCornerTreatment()`, `getCornerPath()`
- **`ShapePath`** — 8 function(s): `applyToPath()`, `ShapePath()`, `reset()`, `lineTo()`, `quadToPoint()`, `addArc()`, `for()`, `PathArcOperation()`
- **`ShapePathModel`** — 21 function(s): `ShapePathModel()`, `setAllCorners()`, `setAllEdges()`, `setCornerTreatments()`, `setEdgeTreatments()`, `getTopLeftCorner()`, `setTopLeftCorner()`, `getTopRightCorner()`, `setTopRightCorner()`, `getBottomRightCorner()`, `setBottomRightCorner()`, `getBottomLeftCorner()`, `setBottomLeftCorner()`, `getTopEdge()`, `setTopEdge()`, `getRightEdge()`, `setRightEdge()`, `getBottomEdge()`, `setBottomEdge()`, `getLeftEdge()`, `setLeftEdge()`
- **`TriangleEdgeTreatment`** — 2 function(s): `TriangleEdgeTreatment()`, `getEdgePath()`

</details>

### Package `android.support.design.snackbar`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ContentViewCallback` | class | — | 9 | 2 |

<details>
<summary><b>Function list for <code>android.support.design.snackbar</code></b> (click to expand)</summary>

- **`ContentViewCallback`** — 2 function(s): `animateContentIn()`, `animateContentOut()`

</details>

### Package `android.support.design.stateful`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ExtendableSavedState` | class | AbsSavedState | 68 | 13 |

<details>
<summary><b>Function list for <code>android.support.design.stateful</code></b> (click to expand)</summary>

- **`ExtendableSavedState`** — 7 function(s): `createFromParcel()`, `ExtendableSavedState()`, `newArray()`, `super()`, `for()`, `writeToParcel()`, `toString()`

</details>

### Package `android.support.design.theme`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `MaterialComponentsViewInflater` | class | AppCompatViewInflater | 16 | 2 |

<details>
<summary><b>Function list for <code>android.support.design.theme</code></b> (click to expand)</summary>

- **`MaterialComponentsViewInflater`** — 2 function(s): `createButton()`, `MaterialButton()`

</details>

### Package `android.support.design.transformation`  (7 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ExpandableBehavior` | class | CoordinatorLayout.Behavior<View> | 103 | 23 |
| `ExpandableTransformationBehavior` | class | ExpandableBehavior | 44 | 8 |
| `FabTransformationBehavior` | class | ExpandableTransformationBehavior | 460 | 89 |
| `FabTransformationScrimBehavior` | class | ExpandableTransformationBehavior | 89 | 14 |
| `FabTransformationSheetBehavior` | class | FabTransformationBehavior | 81 | 16 |
| `TransformationChildCard` | class | CircularRevealCardView | 17 | 4 |
| `TransformationChildLayout` | class | CircularRevealFrameLayout | 17 | 4 |

<details>
<summary><b>Function list for <code>android.support.design.transformation</code></b> (click to expand)</summary>

- **`ExpandableBehavior`** — 14 function(s): `layoutDependsOn()`, `onExpandedStateChange()`, `ExpandableBehavior()`, `super()`, `onLayoutChild()`, `if()`, `onPreDraw()`, `onDependentViewChanged()`, `findExpandableWidget()`, `for()`, `return()`, `didStateChange()`, `from()`, `IllegalArgumentException()`
- **`ExpandableTransformationBehavior`** — 6 function(s): `onCreateExpandedStateChangeAnimation()`, `ExpandableTransformationBehavior()`, `super()`, `onExpandedStateChange()`, `if()`, `onAnimationEnd()`
- **`FabTransformationBehavior`** — 31 function(s): `onCreateMotionSpec()`, `FabTransformationBehavior()`, `super()`, `layoutDependsOn()`, `if()`, `IllegalStateException()`, `onAttachedToLayoutParams()`, `onCreateExpandedStateChangeAnimation()`, `createElevationAnimation()`, `createTranslationAnimation()`, `createIconFadeAnimation()`, `createExpansionAnimation()`, `createColorAnimation()`, `createChildrenFadeAnimation()`, `onAnimationStart()`, `onAnimationEnd()`, `for()`, `calculateChildVisibleBoundsAtEndOfExpansion()`, `onAnimationUpdate()`, `createPreFillRadialExpansion()`, `createPostFillRadialExpansion()`, `calculateTranslationX()`, `calculateWindowBounds()`, `calculateTranslationY()`, `calculateRevealCenterX()`, `calculateRevealCenterY()`, `calculateValueOfAnimationAtEndOfExpansion()`, `calculateChildContentContainer()`, `toViewGroupOrNull()`, `return()`, `getBackgroundTint()`
- **`FabTransformationScrimBehavior`** — 9 function(s): `FabTransformationScrimBehavior()`, `super()`, `layoutDependsOn()`, `onTouchEvent()`, `onCreateExpandedStateChangeAnimation()`, `createScrimAnimation()`, `onAnimationStart()`, `if()`, `onAnimationEnd()`
- **`FabTransformationSheetBehavior`** — 7 function(s): `FabTransformationSheetBehavior()`, `super()`, `onCreateMotionSpec()`, `if()`, `onExpandedStateChange()`, `updateImportantForAccessibility()`, `for()`
- **`TransformationChildCard`** — 3 function(s): `TransformationChildCard()`, `this()`, `super()`
- **`TransformationChildLayout`** — 3 function(s): `TransformationChildLayout()`, `this()`, `super()`

</details>

### Package `android.support.design.widget`  (38 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AppBarLayout` | class | LinearLayout | 1,236 | 289 |
| `BaseTransientBottomBar` | class | BaseTransientBottomBar<B>> | 592 | 113 |
| `BottomNavigationView` | class | FrameLayout | 311 | 78 |
| `BottomSheetBehavior` | class | View> extends CoordinatorLayout.Behavior<V> | 881 | 193 |
| `BottomSheetDialog` | class | AppCompatDialog | 206 | 42 |
| `BottomSheetDialogFragment` | class | AppCompatDialogFragment | 14 | 2 |
| `CheckableImageButton` | class | AppCompatImageButton implements Checkable | 72 | 18 |
| `CircularBorderDrawable` | class | Drawable | 166 | 34 |
| `CircularBorderDrawableLollipop` | class | CircularBorderDrawable | 13 | 2 |
| `CollapsingTextHelper` | class | — | 594 | 138 |
| `CollapsingToolbarLayout` | class | FrameLayout | 795 | 209 |
| `CoordinatorLayout` | class | ViewGroup implements NestedScrollingParent2 | 2,041 | 493 |
| `CutoutDrawable` | class | GradientDrawable | 89 | 22 |
| `DescendantOffsetUtils` | class | — | 52 | 10 |
| `DrawableUtils` | class | — | 43 | 6 |
| `FloatingActionButton` | class | VisibilityAwareImageButton implements TintableBackgroundView, TintableImageSourceView, ... | 809 | 224 |
| `FloatingActionButtonImpl` | class | AnimatorListenerAdapter implements ValueAnimator.AnimatorUpdateListener | 676 | 136 |
| `FloatingActionButtonImplLollipop` | class | FloatingActionButtonImpl | 184 | 32 |
| `HeaderBehavior` | class | View> extends ViewOffsetBehavior<V> | 247 | 56 |
| `HeaderScrollingViewBehavior` | class | ViewOffsetBehavior<View> | 130 | 22 |
| `IndicatorViewController` | class | — | 464 | 118 |
| `MathUtils` | class | — | 32 | 10 |
| `NavigationView` | class | ScrimInsetsFrameLayout | 324 | 72 |
| `ShadowDrawableWrapper` | class | DrawableWrapper | 321 | 55 |
| `ShadowViewDelegate` | class | — | 15 | 4 |
| `Snackbar` | class | BaseTransientBottomBar<Snackbar> | 212 | 45 |
| `SnackbarContentLayout` | class | LinearLayout implements ContentViewCallback | 119 | 25 |
| `SnackbarManager` | class | — | 204 | 55 |
| `StateListAnimator` | class | — | 91 | 18 |
| `SwipeDismissBehavior` | class | View> extends CoordinatorLayout.Behavior<V> | 282 | 52 |
| `TabItem` | class | View | 29 | 4 |
| `TabLayout` | class | HorizontalScrollView | 1,858 | 483 |
| `TextInputEditText` | class | AppCompatEditText | 61 | 16 |
| `TextInputLayout` | class | LinearLayout | 1,402 | 369 |
| `ViewOffsetBehavior` | class | View> extends CoordinatorLayout.Behavior<V> | 85 | 17 |
| `ViewOffsetHelper` | class | — | 65 | 14 |
| `ViewUtilsLollipop` | class | — | 49 | 4 |
| `VisibilityAwareImageButton` | class | ImageButton | 40 | 11 |

<details>
<summary><b>Function list for <code>android.support.design.widget</code></b> (click to expand)</summary>

- **`AppBarLayout`** — 104 function(s): `onOffsetChanged()`, `AppBarLayout()`, `this()`, `super()`, `setOrientation()`, `if()`, `setExpanded()`, `setKeyboardNavigationCluster()`, `setTouchscreenBlocksFocus()`, `onApplyWindowInsets()`, `addOnOffsetChangedListener()`, `removeOnOffsetChangedListener()`, `onMeasure()`, `invalidateScrollRanges()`, `onLayout()`, `while()`, `setLiftableState()`, `hasCollapsibleChild()`, `for()`, `IllegalArgumentException()`, `requestLayout()`, `checkLayoutParams()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `hasChildWithInterpolator()`, `getTotalScrollRange()`, `hasScrollableChildren()`, `getUpNestedPreScrollRange()`, `getDownNestedPreScrollRange()`, `getDownNestedScrollRange()`, `dispatchOffsetUpdates()`, `getMinimumHeightForVisibleOverlappingContent()`, `return()`, `getHeight()`, `onCreateDrawableState()`, `mergeDrawableStates()`, `setLiftable()`, `refreshDrawableState()`, `setLifted()`, `setLiftedState()`, `setLiftOnScroll()`, `isLiftOnScroll()`, `setTargetElevation()`, `getTargetElevation()`, `getPendingAction()`, `resetPendingAction()`, `getTopInset()`, `onWindowInsetChanged()`, `setScrollFlags()`, `getScrollFlags()`, `setScrollInterpolator()`, `getScrollInterpolator()`, `isCollapsible()`, `Behavior()`, `canDrag()`, `BaseBehavior()`, `onStartNestedScroll()`, `canScrollChildren()`, `onNestedPreScroll()`, `stopNestedScrollIfNeeded()`, `onNestedScroll()`, `scroll()`, `onStopNestedScroll()`, `snapToChildIfNeeded()`, `setDragCallback()`, `animateOffsetTo()`, `animateOffsetWithDuration()`, `onAnimationUpdate()`, `getChildIndexOnOffset()`, `checkFlag()`, `onMeasureChild()`, `onLayoutChild()`, `setHeaderTopBottomOffset()`, `setTopAndBottomOffset()`, `updateAppBarLayoutDrawableState()`, `canDragView()`, `onFlingFinished()`, `getMaxDragOffset()`, `getScrollRangeForDragFling()`, `isOffsetAnimatorRunning()`, `interpolateOffset()`, `shouldJumpElevationState()`, `getAppBarChildOnOffset()`, `findFirstScrollingChild()`, `getTopBottomOffsetForScrollingSibling()`, `getTopAndBottomOffset()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `findFirstDependency()`, `ScrollingViewBehavior()`, `setOverlayTop()`, `layoutDependsOn()`, `onDependentViewChanged()`, `offsetChildAsNeeded()`, `updateLiftedStateIfNeeded()`, `onRequestChildRectangleOnScreen()`, `getOverlapRatioForOffset()`, `getAppBarLayoutOffset()`, `getScrollRange()`
- **`BaseTransientBottomBar`** — 59 function(s): `show()`, `dismiss()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `onLayoutChange()`, `onDismissed()`, `onShown()`, `handleMessage()`, `if()`, `BaseTransientBottomBar()`, `IllegalArgumentException()`, `onApplyWindowInsets()`, `onInitializeAccessibilityNodeInfo()`, `performAccessibilityAction()`, `getSnackbarBaseLayoutResId()`, `hasSnackbarStyleAttr()`, `setDuration()`, `getDuration()`, `setBehavior()`, `getBehavior()`, `getContext()`, `getView()`, `dispatchDismiss()`, `addCallback()`, `removeCallback()`, `isShown()`, `isShownOrQueued()`, `Behavior()`, `showView()`, `onDismiss()`, `onDragStateChanged()`, `run()`, `animateViewIn()`, `onViewShown()`, `onAnimationStart()`, `onAnimationEnd()`, `onAnimationUpdate()`, `animateViewOut()`, `getTranslationYBottom()`, `hideView()`, `onViewHidden()`, `for()`, `shouldAnimate()`, `SnackbarBaseLayout()`, `this()`, `super()`, `onTouchExplorationStateChanged()`, `setClickableOrFocusableBasedOnAccessibility()`, `setClickable()`, `setFocusable()`, `onLayout()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `setOnLayoutChangeListener()`, `setOnAttachStateChangeListener()`, `setBaseTransientBottomBar()`, `canSwipeDismissView()`, `onInterceptTouchEvent()`, `BehaviorDelegate()`
- **`BottomNavigationView`** — 45 function(s): `onNavigationItemReselected()`, `onNavigationItemSelected()`, `BottomNavigationView()`, `this()`, `super()`, `if()`, `setItemIconSize()`, `setItemTextAppearanceInactive()`, `setItemTextAppearanceActive()`, `setItemTextColor()`, `setLabelVisibilityMode()`, `setItemHorizontalTranslationEnabled()`, `inflateMenu()`, `addView()`, `addCompatibilityTopDivider()`, `onMenuItemSelected()`, `return()`, `onMenuModeChange()`, `setOnNavigationItemSelectedListener()`, `setOnNavigationItemReselectedListener()`, `getMenu()`, `getMenuInflater()`, `getMaxItemCount()`, `getItemIconTintList()`, `setItemIconTintList()`, `setItemIconSizeRes()`, `getItemIconSize()`, `getItemTextColor()`, `getItemBackgroundResource()`, `setItemBackgroundResource()`, `getItemBackground()`, `setItemBackground()`, `getSelectedItemId()`, `setSelectedItemId()`, `getLabelVisibilityMode()`, `getItemTextAppearanceInactive()`, `getItemTextAppearanceActive()`, `isItemHorizontalTranslationEnabled()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `createFromParcel()`, `SavedState()`, `newArray()`, `readFromParcel()`, `writeToParcel()`
- **`BottomSheetBehavior`** — 54 function(s): `onSlide()`, `onStateChanged()`, `BottomSheetBehavior()`, `tryCaptureView()`, `if()`, `onViewPositionChanged()`, `onViewDragStateChanged()`, `onViewReleased()`, `clampViewPositionVertical()`, `clampViewPositionHorizontal()`, `getViewVerticalDragRange()`, `super()`, `setPeekHeight()`, `setHideable()`, `setFitToContents()`, `setSkipCollapsed()`, `onSaveInstanceState()`, `SavedState()`, `onRestoreInstanceState()`, `onLayoutChild()`, `calculateCollapsedOffset()`, `onInterceptTouchEvent()`, `reset()`, `return()`, `onTouchEvent()`, `onStartNestedScroll()`, `onNestedPreScroll()`, `setStateInternal()`, `dispatchOnSlide()`, `onStopNestedScroll()`, `onNestedPreFling()`, `isFitToContents()`, `getPeekHeight()`, `isHideable()`, `getSkipCollapsed()`, `setBottomSheetCallback()`, `setState()`, `run()`, `startSettlingAnimation()`, `getState()`, `updateImportantForAccessibility()`, `shouldHide()`, `findScrollingChild()`, `for()`, `getYVelocity()`, `getExpandedOffset()`, `IllegalArgumentException()`, `getPeekHeightMin()`, `SettleRunnable()`, `createFromParcel()`, `newArray()`, `this()`, `writeToParcel()`, `from()`
- **`BottomSheetDialog`** — 19 function(s): `BottomSheetDialog()`, `this()`, `super()`, `onStateChanged()`, `if()`, `onSlide()`, `supportRequestWindowFeature()`, `setContentView()`, `onCreate()`, `setCancelable()`, `onStart()`, `setCanceledOnTouchOutside()`, `wrapInBottomSheet()`, `onClick()`, `onInitializeAccessibilityNodeInfo()`, `performAccessibilityAction()`, `onTouch()`, `shouldWindowCloseOnTouchOutside()`, `getThemeResId()`
- **`BottomSheetDialogFragment`** — 2 function(s): `onCreateDialog()`, `BottomSheetDialog()`
- **`CheckableImageButton`** — 13 function(s): `CheckableImageButton()`, `this()`, `super()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `setChecked()`, `if()`, `refreshDrawableState()`, `sendAccessibilityEvent()`, `isChecked()`, `toggle()`, `onCreateDrawableState()`, `mergeDrawableStates()`
- **`CircularBorderDrawable`** — 23 function(s): `CircularBorderDrawable()`, `getConstantState()`, `setGradientColors()`, `setBorderWidth()`, `if()`, `invalidateSelf()`, `draw()`, `copyBounds()`, `getPadding()`, `setAlpha()`, `setBorderTint()`, `setColorFilter()`, `getOpacity()`, `setRotation()`, `onBoundsChange()`, `isStateful()`, `return()`, `onStateChange()`, `createGradientShader()`, `LinearGradient()`, `CircularBorderState()`, `newDrawable()`, `getChangingConfigurations()`
- **`CircularBorderDrawableLollipop`** — 2 function(s): `getOutline()`, `copyBounds()`
- **`CollapsingTextHelper`** — 55 function(s): `if()`, `CollapsingTextHelper()`, `setTextSizeInterpolator()`, `recalculate()`, `setPositionInterpolator()`, `setExpandedTextSize()`, `setCollapsedTextSize()`, `setCollapsedTextColor()`, `setExpandedTextColor()`, `setExpandedBounds()`, `onBoundsChanged()`, `setCollapsedBounds()`, `calculateCollapsedTextWidth()`, `getTextPaintCollapsed()`, `getCollapsedTextHeight()`, `getCollapsedTextActualBounds()`, `setExpandedTextGravity()`, `getExpandedTextGravity()`, `setCollapsedTextGravity()`, `getCollapsedTextGravity()`, `setCollapsedTextAppearance()`, `setExpandedTextAppearance()`, `readFontFamilyTypeface()`, `setCollapsedTypeface()`, `setExpandedTypeface()`, `setTypefaces()`, `getCollapsedTypeface()`, `getExpandedTypeface()`, `setExpansionFraction()`, `calculateCurrentOffsets()`, `setState()`, `isStateful()`, `return()`, `getExpansionFraction()`, `getCollapsedTextSize()`, `getExpandedTextSize()`, `calculateOffsets()`, `interpolateBounds()`, `setInterpolatedTextSize()`, `getCurrentExpandedTextColor()`, `getCurrentCollapsedTextColor()`, `calculateBaseOffsets()`, `calculateUsingTextSize()`, `clearTexture()`, `draw()`, `calculateIsRtl()`, `ensureExpandedTexture()`, `setText()`, `getText()`, `isClose()`, `getExpandedTextColor()`, `getCollapsedTextColor()`, `blendColors()`, `lerp()`, `rectEquals()`
- **`CollapsingToolbarLayout`** — 87 function(s): `CollapsingToolbarLayout()`, `this()`, `super()`, `if()`, `setTitle()`, `setContentScrim()`, `setStatusBarScrim()`, `setWillNotDraw()`, `onApplyWindowInsets()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `onWindowInsetChanged()`, `requestLayout()`, `draw()`, `ensureToolbar()`, `drawChild()`, `onSizeChanged()`, `while()`, `updateDummyView()`, `isToolbarChild()`, `findDirectChild()`, `for()`, `onMeasure()`, `onLayout()`, `getViewOffsetHelper()`, `setMinimumHeight()`, `updateScrimVisibility()`, `getHeightWithMargins()`, `updateContentDescriptionFromTitle()`, `getTitle()`, `setTitleEnabled()`, `isTitleEnabled()`, `setScrimsShown()`, `animateScrim()`, `setScrimAlpha()`, `onAnimationUpdate()`, `getScrimAlpha()`, `setContentScrimColor()`, `setContentScrimResource()`, `getContentScrim()`, `drawableStateChanged()`, `invalidate()`, `verifyDrawable()`, `setVisibility()`, `setStatusBarScrimColor()`, `setStatusBarScrimResource()`, `getStatusBarScrim()`, `setCollapsedTitleTextAppearance()`, `setCollapsedTitleTextColor()`, `setCollapsedTitleGravity()`, `getCollapsedTitleGravity()`, `setExpandedTitleTextAppearance()`, `setExpandedTitleColor()`, `setExpandedTitleTextColor()`, `setExpandedTitleGravity()`, `getExpandedTitleGravity()`, `setCollapsedTitleTypeface()`, `getCollapsedTitleTypeface()`, `setExpandedTitleTypeface()`, `getExpandedTitleTypeface()`, `setExpandedTitleMargin()`, `getExpandedTitleMarginStart()`, `setExpandedTitleMarginStart()`, `getExpandedTitleMarginTop()`, `setExpandedTitleMarginTop()`, `getExpandedTitleMarginEnd()`, `setExpandedTitleMarginEnd()`, `getExpandedTitleMarginBottom()`, `setExpandedTitleMarginBottom()`, `setScrimVisibleHeightTrigger()`, `getScrimVisibleHeightTrigger()`, `getHeight()`, `setScrimAnimationDuration()`, `getScrimAnimationDuration()`, `checkLayoutParams()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `setParallaxMultiplier()`, `setCollapseMode()`, `getCollapseMode()`, `getParallaxMultiplier()`, `getMaxOffsetForPinChild()`, `return()`, `setContentDescription()`, `OffsetUpdateListener()`, `onOffsetChanged()`
- **`CoordinatorLayout`** — 142 function(s): `getBehavior()`, `if()`, `acquireTempRect()`, `Rect()`, `releaseTempRect()`, `CoordinatorLayout()`, `this()`, `super()`, `for()`, `setupForInsets()`, `setOnHierarchyChangeListener()`, `onAttachedToWindow()`, `resetTouchBehaviors()`, `onDetachedFromWindow()`, `onStopNestedScroll()`, `setStatusBarBackground()`, `getStatusBarBackground()`, `drawableStateChanged()`, `invalidate()`, `verifyDrawable()`, `setVisibility()`, `setStatusBarBackgroundResource()`, `setStatusBarBackgroundColor()`, `setWindowInsets()`, `setWillNotDraw()`, `requestLayout()`, `getLastWindowInsets()`, `getTopSortedChildren()`, `performIntercept()`, `onInterceptTouchEvent()`, `onTouchEvent()`, `requestDisallowInterceptTouchEvent()`, `getKeyline()`, `parseBehavior()`, `return()`, `RuntimeException()`, `getResolvedLayoutParams()`, `prepareChildren()`, `getDescendantRect()`, `getSuggestedMinimumWidth()`, `getSuggestedMinimumHeight()`, `onMeasureChild()`, `measureChildWithMargins()`, `onMeasure()`, `ensurePreDrawListener()`, `while()`, `setMeasuredDimension()`, `dispatchApplyWindowInsetsToBehaviors()`, `onLayoutChild()`, `IllegalStateException()`, `layoutChildWithAnchor()`, `layoutChildWithKeyline()`, `layoutChild()`, `onLayout()`, `onDraw()`, `setFitsSystemWindows()`, `recordLastChildRect()`, `getLastChildRect()`, `getChildRect()`, `getDesiredAnchoredChildRectWithoutConstraints()`, `constrainChildRect()`, `getDesiredAnchoredChildRect()`, `resolveGravity()`, `resolveKeylineGravity()`, `resolveAnchoredChildGravity()`, `drawChild()`, `clamp()`, `onChildViewsChanged()`, `offsetChildToAnchor()`, `offsetChildByInset()`, `IllegalArgumentException()`, `setInsetOffsetY()`, `setInsetOffsetX()`, `dispatchDependentViewsChanged()`, `getDependencies()`, `getDependents()`, `getDependencySortedChildren()`, `addPreDrawListener()`, `removePreDrawListener()`, `hasDependencies()`, `isPointInChildBounds()`, `doViewsOverlap()`, `generateLayoutParams()`, `LayoutParams()`, `generateDefaultLayoutParams()`, `checkLayoutParams()`, `onStartNestedScroll()`, `onNestedScrollAccepted()`, `onNestedScroll()`, `onNestedPreScroll()`, `onNestedFling()`, `onNestedPreFling()`, `getNestedScrollAxes()`, `OnPreDrawListener()`, `onPreDraw()`, `ViewElevationComparator()`, `compare()`, `Behavior()`, `onAttachedToLayoutParams()`, `onDetachedFromLayoutParams()`, `getScrimColor()`, `getScrimOpacity()`, `blocksInteractionBelow()`, `layoutDependsOn()`, `onDependentViewChanged()`, `onDependentViewRemoved()`, `setTag()`, `getTag()`, `onApplyWindowInsets()`, `onRequestChildRectangleOnScreen()`, `onRestoreInstanceState()`, `onSaveInstanceState()`, `getInsetDodgeRect()`, `getAnchorId()`, `setAnchorId()`, `invalidateAnchor()`, `setBehavior()`, `setLastChildRect()`, `checkAnchorChanged()`, `didBlockInteraction()`, `isBlockingInteractionBelow()`, `resetTouchBehaviorTracking()`, `resetNestedScroll()`, `setNestedScrollAccepted()`, `isNestedScrollAccepted()`, `getChangedAfterNestedScroll()`, `setChangedAfterNestedScroll()`, `resetChangedAfterNestedScroll()`, `dependsOn()`, `findAnchorView()`, `resolveAnchorView()`, `verifyAnchorView()`, `shouldDodge()`, `HierarchyChangeListener()`, `onChildViewAdded()`, `onChildViewRemoved()`, `requestChildRectangleOnScreen()`, `setSystemUiVisibility()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`
- **`CutoutDrawable`** — 12 function(s): `CutoutDrawable()`, `setPaintStyles()`, `hasCutout()`, `setCutout()`, `if()`, `invalidateSelf()`, `removeCutout()`, `draw()`, `preDraw()`, `postDraw()`, `saveCanvasLayer()`, `useHardwareLayer()`
- **`DescendantOffsetUtils`** — 4 function(s): `offsetDescendantRect()`, `if()`, `offsetDescendantMatrix()`, `getDescendantRect()`
- **`DrawableUtils`** — 4 function(s): `DrawableUtils()`, `setContainerConstantState()`, `setContainerConstantStateV9()`, `if()`
- **`FloatingActionButton`** — 104 function(s): `onShown()`, `onHidden()`, `FloatingActionButton()`, `this()`, `super()`, `getImpl()`, `setScaleType()`, `onMeasure()`, `setMeasuredDimension()`, `getRippleColor()`, `if()`, `getRippleColorStateList()`, `setRippleColor()`, `getBackgroundTintList()`, `setBackgroundTintList()`, `getBackgroundTintMode()`, `setBackgroundTintMode()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `setSupportImageTintList()`, `onApplySupportImageTint()`, `getSupportImageTintList()`, `setSupportImageTintMode()`, `getSupportImageTintMode()`, `setBackgroundDrawable()`, `setBackgroundResource()`, `setBackgroundColor()`, `setImageResource()`, `setImageDrawable()`, `show()`, `addOnShowAnimationListener()`, `removeOnShowAnimationListener()`, `hide()`, `addOnHideAnimationListener()`, `removeOnHideAnimationListener()`, `setExpanded()`, `isExpanded()`, `setExpandedComponentIdHint()`, `getExpandedComponentIdHint()`, `setUseCompatPadding()`, `getUseCompatPadding()`, `setSize()`, `requestLayout()`, `getSize()`, `wrapOnVisibilityChangedListener()`, `isOrWillBeHidden()`, `isOrWillBeShown()`, `setCustomSize()`, `IllegalArgumentException()`, `getCustomSize()`, `clearCustomSize()`, `getSizeDimension()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `drawableStateChanged()`, `jumpDrawablesToCurrentState()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `getContentRect()`, `offsetRectWithShadow()`, `getMeasuredContentRect()`, `getContentBackground()`, `resolveAdjustedSize()`, `onTouchEvent()`, `Behavior()`, `BaseBehavior()`, `setAutoHideEnabled()`, `isAutoHideEnabled()`, `onAttachedToLayoutParams()`, `onDependentViewChanged()`, `updateFabVisibilityForAppBarLayout()`, `updateFabVisibilityForBottomSheet()`, `isBottomSheet()`, `return()`, `setInternalAutoHideListener()`, `shouldUpdateVisibility()`, `onLayoutChild()`, `for()`, `offsetIfNeeded()`, `getInsetDodgeRect()`, `getCompatElevation()`, `setCompatElevation()`, `setCompatElevationResource()`, `getCompatHoveredFocusedTranslationZ()`, `setCompatHoveredFocusedTranslationZ()`, `setCompatHoveredFocusedTranslationZResource()`, `getCompatPressedTranslationZ()`, `setCompatPressedTranslationZ()`, `setCompatPressedTranslationZResource()`, `getShowMotionSpec()`, `setShowMotionSpec()`, `setShowMotionSpecResource()`, `getHideMotionSpec()`, `setHideMotionSpec()`, `setHideMotionSpecResource()`, `createImpl()`, `FloatingActionButtonImplLollipop()`, `FloatingActionButtonImpl()`, `ShadowDelegateImpl()`, `getRadius()`, `setShadowPadding()`, `isCompatPaddingEnabled()`
- **`FloatingActionButtonImpl`** — 67 function(s): `onHidden()`, `onShown()`, `FloatingActionButtonImpl()`, `setBackgroundDrawable()`, `if()`, `setBackgroundTintList()`, `setBackgroundTintMode()`, `setRippleColor()`, `setElevation()`, `onElevationsChanged()`, `getElevation()`, `getHoveredFocusedTranslationZ()`, `getPressedTranslationZ()`, `setHoveredFocusedTranslationZ()`, `setPressedTranslationZ()`, `setMaxImageSize()`, `updateImageMatrixScale()`, `setImageMatrixScale()`, `calculateImageMatrixFromScale()`, `getShowMotionSpec()`, `setShowMotionSpec()`, `getHideMotionSpec()`, `setHideMotionSpec()`, `updatePadding()`, `onDrawableStateChanged()`, `jumpDrawableToCurrentState()`, `addOnShowAnimationListener()`, `removeOnShowAnimationListener()`, `addOnHideAnimationListener()`, `removeOnHideAnimationListener()`, `hide()`, `onAnimationStart()`, `onAnimationCancel()`, `onAnimationEnd()`, `while()`, `show()`, `getDefaultShowMotionSpec()`, `getDefaultHideMotionSpec()`, `createAnimator()`, `getContentBackground()`, `onCompatShadowChanged()`, `getPadding()`, `onPaddingUpdated()`, `onAttachedToWindow()`, `ensurePreDrawListener()`, `onDetachedFromWindow()`, `requirePreDrawListener()`, `createBorderDrawable()`, `newCircularDrawable()`, `CircularBorderDrawable()`, `onPreDraw()`, `updateFromViewRotation()`, `createShapeDrawable()`, `newGradientDrawableForShape()`, `GradientDrawable()`, `isOrWillBeShown()`, `isOrWillBeHidden()`, `createElevationAnimator()`, `getTargetShadowSize()`, `ShadowAnimatorImpl()`, `onAnimationUpdate()`, `ResetElevationAnimation()`, `super()`, `ElevateToHoveredFocusedTranslationZAnimation()`, `ElevateToPressedTranslationZAnimation()`, `DisabledElevationAnimation()`, `shouldAnimateVisibilityChange()`
- **`FloatingActionButtonImplLollipop`** — 20 function(s): `FloatingActionButtonImplLollipop()`, `super()`, `setBackgroundDrawable()`, `if()`, `setRippleColor()`, `onElevationsChanged()`, `updatePadding()`, `createElevationAnimator()`, `getElevation()`, `onCompatShadowChanged()`, `onPaddingUpdated()`, `onDrawableStateChanged()`, `jumpDrawableToCurrentState()`, `requirePreDrawListener()`, `newCircularDrawable()`, `CircularBorderDrawableLollipop()`, `newGradientDrawableForShape()`, `AlwaysStatefulGradientDrawable()`, `getPadding()`, `isStateful()`
- **`HeaderBehavior`** — 18 function(s): `HeaderBehavior()`, `super()`, `if()`, `onInterceptTouchEvent()`, `ensureVelocityTracker()`, `onTouchEvent()`, `fling()`, `scroll()`, `setHeaderTopBottomOffset()`, `setTopAndBottomOffset()`, `getTopBottomOffsetForScrollingSibling()`, `getTopAndBottomOffset()`, `onFlingFinished()`, `canDragView()`, `getMaxDragOffset()`, `getScrollRangeForDragFling()`, `FlingRunnable()`, `run()`
- **`HeaderScrollingViewBehavior`** — 13 function(s): `findFirstDependency()`, `HeaderScrollingViewBehavior()`, `super()`, `onMeasureChild()`, `if()`, `layoutChild()`, `getOverlapRatioForOffset()`, `getOverlapPixelsForOffset()`, `resolveGravity()`, `getScrollRange()`, `getVerticalLayoutGap()`, `setOverlayTop()`, `getOverlayTop()`
- **`IndicatorViewController`** — 45 function(s): `IndicatorViewController()`, `showHelper()`, `cancelCaptionAnimator()`, `if()`, `updateCaptionViewsVisibility()`, `hideHelperText()`, `showError()`, `hideError()`, `shouldAnimateCaptionView()`, `createCaptionAnimators()`, `onAnimationEnd()`, `onAnimationStart()`, `setCaptionViewVisibilities()`, `createCaptionOpacityAnimator()`, `createCaptionTranslationYAnimator()`, `isCaptionView()`, `getCaptionViewFromDisplayState()`, `adjustIndicatorPadding()`, `canAdjustIndicatorPadding()`, `return()`, `addIndicator()`, `removeIndicator()`, `setViewGroupGoneIfEmpty()`, `setErrorEnabled()`, `setErrorTextAppearance()`, `isErrorEnabled()`, `isHelperTextEnabled()`, `setHelperTextEnabled()`, `setHelperTextAppearance()`, `errorIsDisplayed()`, `isCaptionStateError()`, `errorShouldBeShown()`, `helperTextIsDisplayed()`, `isCaptionStateHelperText()`, `helperTextShouldBeShown()`, `getErrorText()`, `getHelperText()`, `setTypefaces()`, `setTextViewTypeface()`, `getErrorViewCurrentTextColor()`, `getErrorViewTextColors()`, `setErrorViewTextColor()`, `getHelperTextViewCurrentTextColor()`, `getHelperTextViewColors()`, `setHelperTextViewTextColor()`
- **`MathUtils`** — 7 function(s): `MathUtils()`, `dist()`, `return()`, `lerp()`, `geq()`, `distanceToFurthestCorner()`, `max()`
- **`NavigationView`** — 44 function(s): `onNavigationItemSelected()`, `NavigationView()`, `this()`, `super()`, `if()`, `onMenuItemSelected()`, `onMenuModeChange()`, `addView()`, `inflateMenu()`, `inflateHeaderView()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setNavigationItemSelectedListener()`, `onMeasure()`, `onInsetsChanged()`, `getMenuInflater()`, `getMenu()`, `addHeaderView()`, `removeHeaderView()`, `getHeaderCount()`, `getHeaderView()`, `getItemIconTintList()`, `setItemIconTintList()`, `getItemTextColor()`, `setItemTextColor()`, `getItemBackground()`, `setItemBackgroundResource()`, `setItemBackground()`, `getItemHorizontalPadding()`, `setItemHorizontalPadding()`, `setItemHorizontalPaddingResource()`, `getItemIconPadding()`, `setItemIconPadding()`, `setItemIconPaddingResource()`, `setCheckedItem()`, `IllegalArgumentException()`, `getCheckedItem()`, `setItemTextAppearance()`, `createDefaultColorStateList()`, `ColorStateList()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`
- **`ShadowDrawableWrapper`** — 28 function(s): `ShadowDrawableWrapper()`, `super()`, `setShadowSize()`, `toEven()`, `setAddPaddingForCorners()`, `invalidateSelf()`, `setAlpha()`, `onBoundsChange()`, `if()`, `IllegalArgumentException()`, `getShadowSize()`, `getPadding()`, `calculateVerticalPadding()`, `return()`, `calculateHorizontalPadding()`, `getOpacity()`, `setCornerRadius()`, `draw()`, `buildComponents()`, `drawShadow()`, `setRotation()`, `buildShadowCorners()`, `getWrappedDrawable()`, `getCornerRadius()`, `setMaxShadowSize()`, `getMaxShadowSize()`, `getMinWidth()`, `getMinHeight()`
- **`ShadowViewDelegate`** — 4 function(s): `getRadius()`, `isCompatPaddingEnabled()`, `setBackgroundDrawable()`, `setShadowPadding()`
- **`Snackbar`** — 25 function(s): `onShown()`, `onDismissed()`, `Snackbar()`, `super()`, `show()`, `dismiss()`, `isShown()`, `make()`, `if()`, `IllegalArgumentException()`, `hasSnackbarButtonStyleAttr()`, `findSuitableParent()`, `while()`, `return()`, `setText()`, `setAction()`, `onClick()`, `getDuration()`, `setActionTextColor()`, `setCallback()`, `removeCallback()`, `addCallback()`, `SnackbarLayout()`, `onMeasure()`, `for()`
- **`SnackbarContentLayout`** — 13 function(s): `SnackbarContentLayout()`, `this()`, `super()`, `onFinishInflate()`, `getMessageView()`, `getActionView()`, `onMeasure()`, `if()`, `updateViewsWithinLayout()`, `setOrientation()`, `updateTopBottomPadding()`, `animateContentIn()`, `animateContentOut()`
- **`SnackbarManager`** — 21 function(s): `handleMessage()`, `if()`, `dismiss()`, `show()`, `getInstance()`, `SnackbarManager()`, `synchronized()`, `scheduleTimeoutLocked()`, `showNextSnackbarLocked()`, `cancelSnackbarLocked()`, `onDismissed()`, `onShown()`, `pauseTimeout()`, `restoreTimeoutIfPaused()`, `isCurrent()`, `isCurrentOrNext()`, `SnackbarRecord()`, `isSnackbar()`, `isCurrentSnackbarLocked()`, `isNextSnackbarLocked()`, `handleTimeout()`
- **`StateListAnimator`** — 9 function(s): `onAnimationEnd()`, `if()`, `addState()`, `setState()`, `while()`, `cancel()`, `start()`, `jumpToCurrentState()`, `Tuple()`
- **`SwipeDismissBehavior`** — 28 function(s): `tryCaptureView()`, `onViewCaptured()`, `if()`, `onViewDragStateChanged()`, `onViewReleased()`, `shouldDismiss()`, `getViewHorizontalDragRange()`, `clampViewPositionHorizontal()`, `clampViewPositionVertical()`, `onViewPositionChanged()`, `onDismiss()`, `onDragStateChanged()`, `setListener()`, `setSwipeDirection()`, `setDragDismissDistance()`, `setStartAlphaSwipeDistance()`, `setEndAlphaSwipeDistance()`, `setSensitivity()`, `onInterceptTouchEvent()`, `ensureViewDragHelper()`, `onTouchEvent()`, `canSwipeDismissView()`, `SettleRunnable()`, `run()`, `clamp()`, `getDragState()`, `fraction()`, `return()`
- **`TabItem`** — 3 function(s): `TabItem()`, `this()`, `super()`
- **`TabLayout`** — 161 function(s): `onTabReselected()`, `onTabSelected()`, `onTabUnselected()`, `TabLayout()`, `this()`, `super()`, `setHorizontalScrollBarEnabled()`, `setSelectedTabIndicator()`, `setSelectedTabIndicatorGravity()`, `setTabIndicatorFullWidth()`, `if()`, `applyModeAndGravity()`, `setSelectedTabIndicatorColor()`, `setSelectedTabIndicatorHeight()`, `setScrollPosition()`, `scrollTo()`, `setSelectedTabView()`, `addTab()`, `IllegalArgumentException()`, `configureTab()`, `addTabView()`, `addTabFromItemView()`, `setOnTabSelectedListener()`, `removeOnTabSelectedListener()`, `addOnTabSelectedListener()`, `clearOnTabSelectedListeners()`, `newTab()`, `createTabFromPool()`, `Tab()`, `releaseFromTabPool()`, `getTabCount()`, `getTabAt()`, `getSelectedTabPosition()`, `removeTab()`, `removeTabAt()`, `removeTabViewAt()`, `for()`, `selectTab()`, `removeAllTabs()`, `while()`, `setTabMode()`, `getTabMode()`, `setTabGravity()`, `getTabGravity()`, `getTabIndicatorGravity()`, `isTabIndicatorFullWidth()`, `setInlineLabel()`, `setInlineLabelResource()`, `isInlineLabel()`, `setUnboundedRipple()`, `setUnboundedRippleResource()`, `hasUnboundedRipple()`, `setTabTextColors()`, `updateAllTabs()`, `getTabTextColors()`, `setTabIconTint()`, `setTabIconTintResource()`, `getTabIconTint()`, `getTabRippleColor()`, `setTabRippleColor()`, `setTabRippleColorResource()`, `getTabSelectedIndicator()`, `setupWithViewPager()`, `setPagerAdapter()`, `setTabsFromPagerAdapter()`, `shouldDelayChildPressedState()`, `getTabScrollRange()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `populateFromPagerAdapter()`, `createTabView()`, `addView()`, `addViewInternal()`, `createLayoutParamsForTabs()`, `updateTabViewLayoutParams()`, `dpToPx()`, `onDraw()`, `onMeasure()`, `requestLayout()`, `animateToTab()`, `ensureScrollAnimator()`, `onAnimationUpdate()`, `setScrollAnimatorListener()`, `dispatchTabReselected()`, `dispatchTabUnselected()`, `dispatchTabSelected()`, `calculateScrollXForTab()`, `updateTabViews()`, `getTag()`, `setTag()`, `getCustomView()`, `setCustomView()`, `updateView()`, `getIcon()`, `getPosition()`, `setPosition()`, `getText()`, `setIcon()`, `setText()`, `select()`, `isSelected()`, `setContentDescription()`, `getContentDescription()`, `reset()`, `TabView()`, `updateBackgroundDrawable()`, `setGravity()`, `setOrientation()`, `setClickable()`, `drawBackground()`, `drawableStateChanged()`, `invalidate()`, `performClick()`, `playSoundEffect()`, `setSelected()`, `sendAccessibilityEvent()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `setTab()`, `update()`, `removeView()`, `updateTextAndIcon()`, `updateOrientation()`, `setVisibility()`, `getContentWidth()`, `getTab()`, `approximateLineWidth()`, `SlidingTabIndicator()`, `setWillNotDraw()`, `setSelectedIndicatorColor()`, `setSelectedIndicatorHeight()`, `childrenNeedLayout()`, `setIndicatorPositionFromTabPosition()`, `updateIndicatorPosition()`, `getIndicatorPosition()`, `onRtlPropertiesChanged()`, `onLayout()`, `animateIndicatorToPosition()`, `calculateTabViewContentBounds()`, `setIndicatorPosition()`, `onAnimationEnd()`, `draw()`, `createColorStateList()`, `ColorStateList()`, `getDefaultHeight()`, `return()`, `getTabMinWidth()`, `generateLayoutParams()`, `generateDefaultLayoutParams()`, `getTabMaxWidth()`, `TabLayoutOnPageChangeListener()`, `onPageScrollStateChanged()`, `onPageScrolled()`, `onPageSelected()`, `ViewPagerOnTabSelectedListener()`, `PagerAdapterObserver()`, `onChanged()`, `onInvalidated()`, `AdapterChangeListener()`, `onAdapterChanged()`, `setAutoRefresh()`
- **`TextInputEditText`** — 10 function(s): `TextInputEditText()`, `this()`, `super()`, `getHint()`, `if()`, `onCreateInputConnection()`, `getTextInputLayout()`, `for()`, `return()`, `getHintFromLayout()`
- **`TextInputLayout`** — 130 function(s): `TextInputLayout()`, `this()`, `super()`, `setOrientation()`, `setWillNotDraw()`, `setAddStatesFromChildren()`, `addView()`, `setHint()`, `setBoxBackgroundMode()`, `if()`, `setHintTextAppearance()`, `setCounterMaxLength()`, `setHelperTextEnabled()`, `setHelperText()`, `setHelperTextTextAppearance()`, `setErrorEnabled()`, `setErrorTextAppearance()`, `setCounterEnabled()`, `applyPasswordToggleTint()`, `updateInputLayoutMargins()`, `setEditText()`, `getBoxBackground()`, `IllegalStateException()`, `onApplyBoxBackgroundMode()`, `assignBoxBackgroundByMode()`, `updateTextInputBoxBounds()`, `setBoxStrokeColor()`, `updateTextInputBoxState()`, `getBoxStrokeColor()`, `setBoxBackgroundColorResource()`, `setBoxBackgroundColor()`, `applyBoxAttributes()`, `getBoxBackgroundColor()`, `setBoxCornerRadiiResources()`, `setBoxCornerRadii()`, `getBoxCornerRadiusTopStart()`, `getBoxCornerRadiusTopEnd()`, `getBoxCornerRadiusBottomEnd()`, `getBoxCornerRadiusBottomStart()`, `getCornerRadiiAsArray()`, `setTypeface()`, `getTypeface()`, `dispatchProvideAutofillStructure()`, `IllegalArgumentException()`, `setTextInputAccessibilityDelegate()`, `afterTextChanged()`, `beforeTextChanged()`, `onTextChanged()`, `updateCounter()`, `updatePasswordToggleView()`, `updateLabelState()`, `collapseHint()`, `expandHint()`, `getEditText()`, `setHintInternal()`, `sendAccessibilityEvent()`, `openCutout()`, `getHint()`, `setHintEnabled()`, `isHintEnabled()`, `isProvidingHint()`, `setDefaultHintTextColor()`, `getDefaultHintTextColor()`, `setErrorTextColor()`, `getErrorCurrentTextColors()`, `isErrorEnabled()`, `isHelperTextEnabled()`, `setHelperTextColor()`, `getHelperTextCurrentTextColor()`, `setError()`, `setTextAppearanceCompatWithErrorFallback()`, `isCounterEnabled()`, `setEnabled()`, `recursiveSetEnabled()`, `for()`, `getCounterMaxLength()`, `getCounterOverflowDescription()`, `updateEditTextBackground()`, `updateEditTextBackgroundBounds()`, `calculateBoxBackgroundTop()`, `calculateLabelMarginTop()`, `return()`, `calculateCollapsedTextTopBounds()`, `getPaddingTop()`, `setBoxAttributes()`, `invalidate()`, `ensureBackgroundDrawableStateWorkaround()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `toString()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `passwordVisibilityToggleRequested()`, `requestLayout()`, `dispatchRestoreInstanceState()`, `getError()`, `getHelperText()`, `isHintAnimationEnabled()`, `setHintAnimationEnabled()`, `draw()`, `onMeasure()`, `onClick()`, `setPasswordVisibilityToggleDrawable()`, `setPasswordVisibilityToggleContentDescription()`, `getPasswordVisibilityToggleDrawable()`, `getPasswordVisibilityToggleContentDescription()`, `isPasswordVisibilityToggleEnabled()`, `setPasswordVisibilityToggleEnabled()`, `setPasswordVisibilityToggleTintList()`, `setPasswordVisibilityToggleTintMode()`, `hasPasswordTransformation()`, `shouldShowPasswordIcon()`, `onLayout()`, `animateToExpansionFraction()`, `cutoutEnabled()`, `applyCutoutPadding()`, `closeCutout()`, `cutoutIsOpen()`, `drawableStateChanged()`, `onAnimationUpdate()`, `isHintExpanded()`, `isHelperTextDisplayed()`, `getHintCurrentCollapsedTextColor()`, `getHintCollapsedTextHeight()`, `getErrorTextCurrentColor()`, `AccessibilityDelegate()`, `onInitializeAccessibilityNodeInfo()`, `onPopulateAccessibilityEvent()`
- **`ViewOffsetBehavior`** — 9 function(s): `ViewOffsetBehavior()`, `super()`, `onLayoutChild()`, `layoutChild()`, `if()`, `setTopAndBottomOffset()`, `setLeftAndRightOffset()`, `getTopAndBottomOffset()`, `getLeftAndRightOffset()`
- **`ViewOffsetHelper`** — 10 function(s): `ViewOffsetHelper()`, `onViewLayout()`, `updateOffsets()`, `setTopAndBottomOffset()`, `if()`, `setLeftAndRightOffset()`, `getTopAndBottomOffset()`, `getLeftAndRightOffset()`, `getLayoutTop()`, `getLayoutLeft()`
- **`ViewUtilsLollipop`** — 4 function(s): `setBoundsViewOutlineProvider()`, `setStateListAnimatorFromAttrs()`, `if()`, `setDefaultAppBarLayoutStateListAnimator()`
- **`VisibilityAwareImageButton`** — 7 function(s): `VisibilityAwareImageButton()`, `this()`, `super()`, `setVisibility()`, `internalSetVisibility()`, `if()`, `getUserSetVisibility()`

</details>

### Package `android.support.documentfile`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.support.documentfile</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.support.drawerlayout`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.drawerlayout</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.fragment`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 237 | 11 |

<details>
<summary><b>Function list for <code>android.support.fragment</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.graphics.drawable`  (10 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AndroidResources` | class | — | 88 | 1 |
| `Animatable2Compat` | class | Animatable | 44 | 9 |
| `AnimatedVectorDrawableCompat` | class | VectorDrawableCommon implements Animatable2Compat | 727 | 152 |
| `AnimationUtilsCompat` | class | — | 122 | 17 |
| `AnimatorInflaterCompat` | class | — | 715 | 126 |
| `ArgbEvaluator` | class | TypeEvaluator | 33 | 2 |
| `PathInterpolatorCompat` | class | Interpolator | 150 | 40 |
| `R` | class | — | 237 | 11 |
| `VectorDrawableCommon` | class | Drawable implements TintAwareDrawable | 177 | 36 |
| `VectorDrawableCompat` | class | VectorDrawableCommon | 1,595 | 310 |

<details>
<summary><b>Function list for <code>android.support.graphics.drawable</code></b> (click to expand)</summary>

- **`AndroidResources`** — 1 function(s): `AndroidResources()`
- **`Animatable2Compat`** — 7 function(s): `clearAnimationCallbacks()`, `registerAnimationCallback()`, `unregisterAnimationCallback()`, `onAnimationStart()`, `onAnimationEnd()`, `getPlatformCallback()`, `if()`
- **`AnimatedVectorDrawableCompat`** — 54 function(s): `this()`, `AnimatedVectorDrawableCompat()`, `invalidateDrawable()`, `scheduleDrawable()`, `unscheduleDrawable()`, `if()`, `mutate()`, `create()`, `XmlPullParserException()`, `createFromXmlInner()`, `getConstantState()`, `AnimatedVectorDrawableDelegateState()`, `getChangingConfigurations()`, `draw()`, `invalidateSelf()`, `onBoundsChange()`, `onStateChange()`, `onLevelChange()`, `getAlpha()`, `setAlpha()`, `setColorFilter()`, `setTint()`, `setTintList()`, `setTintMode()`, `setVisible()`, `isStateful()`, `getOpacity()`, `getIntrinsicWidth()`, `getIntrinsicHeight()`, `isAutoMirrored()`, `setAutoMirrored()`, `inflate()`, `while()`, `setupAnimatorsForTarget()`, `IllegalStateException()`, `applyTheme()`, `canApplyTheme()`, `newDrawable()`, `AnimatedVectorDrawableCompatState()`, `for()`, `setupAnimatorSet()`, `setupColorAnimator()`, `isRunning()`, `return()`, `start()`, `stop()`, `unregisterPlatformCallback()`, `registerAnimationCallback()`, `registerPlatformCallback()`, `onAnimationStart()`, `onAnimationEnd()`, `removeAnimatorSetListener()`, `unregisterAnimationCallback()`, `clearAnimationCallbacks()`
- **`AnimationUtilsCompat`** — 7 function(s): `loadInterpolator()`, `if()`, `FastOutLinearInInterpolator()`, `createInterpolatorFromXml()`, `while()`, `RuntimeException()`, `AnimationUtilsCompat()`
- **`AnimatorInflaterCompat`** — 25 function(s): `loadAnimator()`, `if()`, `PathDataEvaluator()`, `evaluate()`, `IllegalArgumentException()`, `for()`, `getPVH()`, `InflateException()`, `parseAnimatorFromTypeArray()`, `setupObjectAnimator()`, `setupPathMotion()`, `while()`, `createAnimatorFromXml()`, `RuntimeException()`, `loadValues()`, `inferValueTypeOfKeyframe()`, `inferValueTypeFromValues()`, `dumpKeyframes()`, `loadPvh()`, `distributeKeyframes()`, `createNewKeyframe()`, `loadKeyframe()`, `loadObjectAnimator()`, `isColorType()`, `AnimatorInflaterCompat()`
- **`ArgbEvaluator`** — 2 function(s): `getInstance()`, `evaluate()`
- **`PathInterpolatorCompat`** — 13 function(s): `PathInterpolatorCompat()`, `this()`, `parseInterpolatorFromTypeArray()`, `if()`, `InflateException()`, `initPath()`, `initCubic()`, `initQuad()`, `IllegalArgumentException()`, `for()`, `while()`, `getInterpolation()`, `return()`
- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`
- **`VectorDrawableCommon`** — 19 function(s): `setColorFilter()`, `if()`, `getColorFilter()`, `onLevelChange()`, `onBoundsChange()`, `setHotspot()`, `setHotspotBounds()`, `setFilterBitmap()`, `jumpToCurrentState()`, `applyTheme()`, `clearColorFilter()`, `getCurrent()`, `getMinimumWidth()`, `getMinimumHeight()`, `getPadding()`, `getState()`, `getTransparentRegion()`, `setChangingConfigurations()`, `setState()`
- **`VectorDrawableCompat`** — 113 function(s): `mutate()`, `if()`, `getTargetByName()`, `getConstantState()`, `VectorDrawableDelegateState()`, `draw()`, `copyBounds()`, `getAlpha()`, `setAlpha()`, `invalidateSelf()`, `setColorFilter()`, `updateTintFilter()`, `PorterDuffColorFilter()`, `setTint()`, `setTintList()`, `setTintMode()`, `isStateful()`, `onStateChange()`, `getOpacity()`, `getIntrinsicWidth()`, `return()`, `getIntrinsicHeight()`, `canApplyTheme()`, `isAutoMirrored()`, `setAutoMirrored()`, `getPixelSize()`, `create()`, `XmlPullParserException()`, `createFromXmlInner()`, `applyAlpha()`, `inflate()`, `updateStateFromTypedArray()`, `inflateInternal()`, `parseTintModeCompat()`, `switch()`, `for()`, `printGroupTree()`, `setAllowCaching()`, `needMirroring()`, `onBoundsChange()`, `getChangingConfigurations()`, `scheduleSelf()`, `setVisible()`, `unscheduleSelf()`, `newDrawable()`, `VectorDrawableCompatState()`, `drawCachedBitmapWithRootAlpha()`, `hasTranslucentRoot()`, `getPaint()`, `updateCachedBitmap()`, `createCachedBitmapIfNeeded()`, `canReuseBitmap()`, `canReuseCache()`, `updateCacheStates()`, `VectorDrawableCompat()`, `onStateChanged()`, `VPathRenderer()`, `setRootAlpha()`, `getRootAlpha()`, `drawGroupTree()`, `drawPath()`, `cross()`, `getMatrixScale()`, `VObject()`, `VGroup()`, `super()`, `IllegalStateException()`, `getGroupName()`, `getLocalMatrix()`, `updateLocalMatrix()`, `getRotation()`, `setRotation()`, `getPivotX()`, `setPivotX()`, `getPivotY()`, `setPivotY()`, `getScaleX()`, `setScaleX()`, `getScaleY()`, `setScaleY()`, `getTranslateX()`, `setTranslateX()`, `getTranslateY()`, `setTranslateY()`, `VPath()`, `printVPath()`, `nodesToString()`, `toPath()`, `getPathName()`, `applyTheme()`, `isClipPath()`, `getPathData()`, `setPathData()`, `VClipPath()`, `VFullPath()`, `getStrokeLineCap()`, `getStrokeLineJoin()`, `getStrokeColor()`, `setStrokeColor()`, `getStrokeWidth()`, `setStrokeWidth()`, `getStrokeAlpha()`, `setStrokeAlpha()`, `getFillColor()`, `setFillColor()`, `getFillAlpha()`, `setFillAlpha()`, `getTrimPathStart()`, `setTrimPathStart()`, `getTrimPathEnd()`, `setTrimPathEnd()`, `getTrimPathOffset()`, `setTrimPathOffset()`

</details>

### Package `android.support.interpolator`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.support.interpolator</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.support.loader`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.loader</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.localbroadcastmanager`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.support.localbroadcastmanager</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.support.print`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 8 | 1 |

<details>
<summary><b>Function list for <code>android.support.print</code></b> (click to expand)</summary>

- **`R`** — 1 function(s): `R()`

</details>

### Package `android.support.slidingpanelayout`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.slidingpanelayout</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.swiperefreshlayout`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.swiperefreshlayout</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.transition`  (59 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AnimatorUtils` | class | — | 64 | 15 |
| `ArcMotion` | class | PathMotion | 157 | 22 |
| `AutoTransition` | class | TransitionSet | 22 | 8 |
| `ChangeBounds` | class | Transition | 467 | 69 |
| `ChangeClipBounds` | class | Transition | 90 | 18 |
| `ChangeImageTransform` | class | Transition | 184 | 31 |
| `ChangeScroll` | class | Transition | 66 | 13 |
| `ChangeTransform` | class | Transition | 434 | 73 |
| `CircularPropagation` | class | VisibilityPropagation | 61 | 10 |
| `Explode` | class | Visibility | 131 | 24 |
| `Fade` | class | Visibility | 114 | 23 |
| `FloatArrayEvaluator` | class | — | 28 | 4 |
| `FragmentTransitionSupport` | class | FragmentTransitionImpl | 281 | 67 |
| `GhostViewApi14` | class | View implements GhostViewImpl | 140 | 26 |
| `GhostViewApi21` | class | GhostViewImpl | 100 | 20 |
| `GhostViewImpl` | class | — | 12 | 2 |
| `GhostViewUtils` | class | — | 30 | 5 |
| `ImageViewUtils` | class | — | 85 | 15 |
| `MatrixUtils` | class | — | 191 | 65 |
| `ObjectAnimatorUtils` | class | — | 23 | 3 |
| `PathMotion` | class | — | 17 | 3 |
| `PathProperty` | class | Property<T, Float> | 56 | 6 |
| `PatternPathMotion` | class | PathMotion | 89 | 14 |
| `PropertyValuesHolderUtils` | class | — | 23 | 3 |
| `R` | class | — | 219 | 11 |
| `RectEvaluator` | class | TypeEvaluator<Rect> | 33 | 5 |
| `Scene` | class | — | 101 | 21 |
| `SidePropagation` | class | VisibilityPropagation | 109 | 17 |
| `Slide` | class | Visibility | 202 | 35 |
| `Styleable` | class | — | 90 | 1 |
| `Transition` | class | Cloneable | 1,350 | 326 |
| `TransitionInflater` | class | — | 272 | 59 |
| `TransitionListenerAdapter` | class | Transition.TransitionListener | 27 | 5 |
| `TransitionManager` | class | ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener | 216 | 50 |
| `TransitionPropagation` | class | — | 13 | 3 |
| `TransitionSet` | class | Transition | 486 | 117 |
| `TransitionUtils` | class | TypeEvaluator<Matrix> | 142 | 15 |
| `TransitionValues` | class | — | 34 | 6 |
| `TransitionValuesMaps` | class | — | 16 | 0 |
| `TranslationAnimationCreator` | class | AnimatorListenerAdapter | 102 | 11 |
| `ViewGroupOverlayApi14` | class | ViewOverlayApi14 implements ViewGroupOverlayImpl | 30 | 6 |
| `ViewGroupOverlayApi18` | class | ViewGroupOverlayImpl | 42 | 6 |
| `ViewGroupOverlayImpl` | class | ViewOverlayImpl | 11 | 2 |
| `ViewGroupUtils` | class | — | 28 | 6 |
| `ViewGroupUtilsApi14` | class | — | 105 | 17 |
| `ViewGroupUtilsApi18` | class | — | 44 | 6 |
| `ViewOverlayApi14` | class | ViewOverlayImpl | 267 | 61 |
| `ViewOverlayApi18` | class | ViewOverlayImpl | 31 | 4 |
| `ViewOverlayImpl` | class | — | 13 | 3 |
| `ViewUtils` | class | — | 141 | 26 |
| `ViewUtilsApi19` | class | ViewUtilsBase | 80 | 15 |
| `ViewUtilsApi21` | class | ViewUtilsApi19 | 97 | 18 |
| `ViewUtilsApi22` | class | ViewUtilsApi21 | 40 | 6 |
| `ViewUtilsBase` | class | — | 111 | 21 |
| `Visibility` | class | Transition | 385 | 82 |
| `VisibilityPropagation` | class | TransitionPropagation | 56 | 11 |
| `WindowIdApi14` | class | WindowIdImpl | 22 | 4 |
| `WindowIdApi18` | class | WindowIdImpl | 23 | 4 |
| `WindowIdImpl` | class | — | 6 | 0 |

<details>
<summary><b>Function list for <code>android.support.transition</code></b> (click to expand)</summary>

- **`AnimatorUtils`** — 8 function(s): `onAnimationPause()`, `onAnimationResume()`, `addPauseListener()`, `if()`, `pause()`, `for()`, `resume()`, `AnimatorUtils()`
- **`ArcMotion`** — 13 function(s): `ArcMotion()`, `super()`, `setMinimumVerticalAngle()`, `setMinimumHorizontalAngle()`, `setMaximumAngle()`, `getMinimumHorizontalAngle()`, `getMinimumVerticalAngle()`, `getMaximumAngle()`, `toTangent()`, `if()`, `IllegalArgumentException()`, `return()`, `getPath()`
- **`AutoTransition`** — 5 function(s): `AutoTransition()`, `init()`, `super()`, `setOrdering()`, `addTransition()`
- **`ChangeBounds`** — 25 function(s): `set()`, `get()`, `PointF()`, `ChangeBounds()`, `super()`, `setResizeClip()`, `getTransitionProperties()`, `getResizeClip()`, `captureValues()`, `if()`, `captureStartValues()`, `captureEndValues()`, `parentMatches()`, `createAnimator()`, `onAnimationCancel()`, `onAnimationEnd()`, `onTransitionCancel()`, `onTransitionEnd()`, `onTransitionPause()`, `onTransitionResume()`, `addListener()`, `ViewBounds()`, `setTopLeft()`, `setLeftTopRightBottom()`, `setBottomRight()`
- **`ChangeClipBounds`** — 9 function(s): `getTransitionProperties()`, `ChangeClipBounds()`, `super()`, `captureValues()`, `if()`, `captureStartValues()`, `captureEndValues()`, `createAnimator()`, `onAnimationEnd()`
- **`ChangeImageTransform`** — 17 function(s): `evaluate()`, `set()`, `get()`, `ChangeImageTransform()`, `super()`, `captureValues()`, `if()`, `captureStartValues()`, `captureEndValues()`, `getTransitionProperties()`, `createAnimator()`, `createNullAnimator()`, `createMatrixAnimator()`, `copyImageMatrix()`, `fitXYMatrix()`, `centerCropMatrix()`, `Matrix()`
- **`ChangeScroll`** — 8 function(s): `ChangeScroll()`, `super()`, `captureStartValues()`, `captureValues()`, `captureEndValues()`, `getTransitionProperties()`, `createAnimator()`, `if()`
- **`ChangeTransform`** — 39 function(s): `get()`, `set()`, `ChangeTransform()`, `super()`, `getReparentWithOverlay()`, `setReparentWithOverlay()`, `getReparent()`, `setReparent()`, `getTransitionProperties()`, `captureValues()`, `if()`, `captureStartValues()`, `captureEndValues()`, `createAnimator()`, `setMatricesForParent()`, `createGhostView()`, `createTransformAnimator()`, `setIdentityTransforms()`, `onAnimationCancel()`, `onAnimationEnd()`, `setCurrentMatrix()`, `onAnimationPause()`, `onAnimationResume()`, `parentsMatch()`, `while()`, `setTransforms()`, `Transforms()`, `restore()`, `equals()`, `hashCode()`, `GhostListener()`, `onTransitionEnd()`, `onTransitionPause()`, `onTransitionResume()`, `PathAnimatorMatrix()`, `setAnimationMatrix()`, `setValues()`, `setTranslation()`, `getMatrix()`
- **`CircularPropagation`** — 6 function(s): `setPropagationSpeed()`, `if()`, `IllegalArgumentException()`, `getStartDelay()`, `distance()`, `return()`
- **`Explode`** — 13 function(s): `Explode()`, `setPropagation()`, `super()`, `captureValues()`, `captureStartValues()`, `captureEndValues()`, `onAppear()`, `if()`, `calculateOut()`, `onDisappear()`, `calculateMaxDistance()`, `calculateDistance()`, `return()`
- **`Fade`** — 14 function(s): `Fade()`, `setMode()`, `super()`, `captureStartValues()`, `createAnimation()`, `if()`, `addListener()`, `onTransitionEnd()`, `onAppear()`, `onDisappear()`, `getStartAlpha()`, `FadeAnimatorListener()`, `onAnimationStart()`, `onAnimationEnd()`
- **`FloatArrayEvaluator`** — 4 function(s): `FloatArrayEvaluator()`, `evaluate()`, `if()`, `for()`
- **`FragmentTransitionSupport`** — 27 function(s): `canHandle()`, `cloneTransition()`, `if()`, `wrapTransitionInSet()`, `setSharedElementTargets()`, `for()`, `bfsAddViewChildren()`, `addTargets()`, `setEpicenter()`, `getBoundsOnScreen()`, `onGetEpicenter()`, `hasSimpleTarget()`, `return()`, `mergeTransitionsTogether()`, `scheduleHideFragmentView()`, `onTransitionStart()`, `onTransitionEnd()`, `onTransitionCancel()`, `onTransitionPause()`, `onTransitionResume()`, `mergeTransitionsInSequence()`, `beginDelayedTransition()`, `scheduleRemoveTargets()`, `swapSharedElementTargets()`, `replaceTargets()`, `addTarget()`, `removeTarget()`
- **`GhostViewApi14`** — 17 function(s): `addGhost()`, `if()`, `removeGhost()`, `findFrameLayout()`, `while()`, `return()`, `super()`, `onPreDraw()`, `setLayerType()`, `onAttachedToWindow()`, `setGhostView()`, `getLocationOnScreen()`, `onDetachedFromWindow()`, `onDraw()`, `setVisibility()`, `reserveEndViewTransition()`, `getGhostView()`
- **`GhostViewApi21`** — 10 function(s): `addGhost()`, `fetchAddGhostMethod()`, `if()`, `GhostViewApi21()`, `RuntimeException()`, `removeGhost()`, `fetchRemoveGhostMethod()`, `setVisibility()`, `reserveEndViewTransition()`, `fetchGhostViewClass()`
- **`GhostViewImpl`** — 2 function(s): `reserveEndViewTransition()`, `setVisibility()`
- **`GhostViewUtils`** — 4 function(s): `addGhost()`, `if()`, `removeGhost()`, `GhostViewUtils()`
- **`ImageViewUtils`** — 8 function(s): `startAnimateTransform()`, `if()`, `animateTransform()`, `fetchAnimateTransformMethod()`, `RuntimeException()`, `reserveEndAnimateTransform()`, `onAnimationEnd()`, `ImageViewUtils()`
- **`MatrixUtils`** — 24 function(s): `oops()`, `IllegalStateException()`, `set()`, `reset()`, `setTranslate()`, `setScale()`, `setRotate()`, `setSinCos()`, `setSkew()`, `setConcat()`, `preTranslate()`, `preScale()`, `preRotate()`, `preSkew()`, `preConcat()`, `postTranslate()`, `postScale()`, `postRotate()`, `postSkew()`, `postConcat()`, `setRectToRect()`, `setPolyToPoly()`, `setValues()`, `MatrixUtils()`
- **`ObjectAnimatorUtils`** — 3 function(s): `ofPointF()`, `if()`, `ObjectAnimatorUtils()`
- **`PathMotion`** — 2 function(s): `getPath()`, `PathMotion()`
- **`PathProperty`** — 4 function(s): `get()`, `set2()`, `PathProperty()`, `super()`
- **`PatternPathMotion`** — 9 function(s): `PatternPathMotion()`, `if()`, `RuntimeException()`, `setPatternPath()`, `getPatternPath()`, `IllegalArgumentException()`, `getPath()`, `distance()`, `return()`
- **`PropertyValuesHolderUtils`** — 3 function(s): `ofPointF()`, `if()`, `PropertyValuesHolderUtils()`
- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`
- **`RectEvaluator`** — 4 function(s): `RectEvaluator()`, `evaluate()`, `if()`, `Rect()`
- **`Scene`** — 12 function(s): `getSceneForLayout()`, `if()`, `Scene()`, `getSceneRoot()`, `exit()`, `enter()`, `setCurrentScene()`, `getCurrentScene()`, `return()`, `setEnterAction()`, `setExitAction()`, `isCreatedFromLayoutResource()`
- **`SidePropagation`** — 7 function(s): `setSide()`, `setPropagationSpeed()`, `if()`, `IllegalArgumentException()`, `getStartDelay()`, `distance()`, `getMaxDistance()`
- **`Slide`** — 16 function(s): `getGoneX()`, `if()`, `getGoneY()`, `CalculateSlideHorizontal()`, `CalculateSlideVertical()`, `Slide()`, `setSlideEdge()`, `super()`, `captureValues()`, `captureStartValues()`, `captureEndValues()`, `IllegalArgumentException()`, `setPropagation()`, `getSlideEdge()`, `onAppear()`, `onDisappear()`
- **`Styleable`** — 1 function(s): `Styleable()`
- **`Transition`** — 87 function(s): `getPath()`, `onGetEpicenter()`, `onTransitionCancel()`, `onTransitionEnd()`, `onTransitionPause()`, `onTransitionResume()`, `onTransitionStart()`, `captureEndValues()`, `captureStartValues()`, `Transition()`, `if()`, `setDuration()`, `setStartDelay()`, `setInterpolator()`, `setMatchOrder()`, `parseMatchOrder()`, `while()`, `InflateException()`, `getDuration()`, `getStartDelay()`, `getInterpolator()`, `getTransitionProperties()`, `createAnimator()`, `for()`, `IllegalArgumentException()`, `isValidMatch()`, `alreadyContains()`, `matchInstances()`, `matchItemIds()`, `matchIds()`, `matchNames()`, `addUnmatched()`, `matchStartAndEnd()`, `createAnimators()`, `isValidTarget()`, `getRunningAnimators()`, `runAnimators()`, `start()`, `runAnimator()`, `end()`, `onAnimationStart()`, `onAnimationEnd()`, `animate()`, `addTarget()`, `removeTarget()`, `excludeObject()`, `excludeTarget()`, `excludeChildren()`, `excludeId()`, `excludeView()`, `excludeType()`, `getTargetIds()`, `getTargets()`, `getTargetNames()`, `getTargetTypes()`, `captureValues()`, `clearValues()`, `capturePropagationValues()`, `addViewValues()`, `captureHierarchy()`, `getTransitionValues()`, `getMatchedTransitionValues()`, `pause()`, `resume()`, `playTransition()`, `isTransitionRequired()`, `isValueChanged()`, `forceToEnd()`, `cancel()`, `addListener()`, `removeListener()`, `setPathMotion()`, `getPathMotion()`, `setEpicenterCallback()`, `getEpicenterCallback()`, `getEpicenter()`, `setPropagation()`, `getPropagation()`, `setSceneRoot()`, `setCanRemoveViews()`, `toString()`, `mo0clone()`, `getName()`, `AnimationInfo()`, `ArrayListManager()`, `add()`, `remove()`
- **`TransitionInflater`** — 14 function(s): `TransitionInflater()`, `from()`, `inflateTransition()`, `createTransitionFromXml()`, `InflateException()`, `inflateTransitionManager()`, `createTransitionManagerFromXml()`, `while()`, `if()`, `getTargetIds()`, `RuntimeException()`, `createCustom()`, `synchronized()`, `loadTransition()`
- **`TransitionListenerAdapter`** — 5 function(s): `onTransitionStart()`, `onTransitionEnd()`, `onTransitionCancel()`, `onTransitionPause()`, `onTransitionResume()`
- **`TransitionManager`** — 19 function(s): `setTransition()`, `if()`, `getTransition()`, `changeScene()`, `sceneChangeSetup()`, `sceneChangeRunTransition()`, `getRunningTransitions()`, `MultiListener()`, `removeListeners()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `while()`, `onPreDraw()`, `onTransitionEnd()`, `transitionTo()`, `go()`, `beginDelayedTransition()`, `endTransitions()`, `for()`
- **`TransitionPropagation`** — 3 function(s): `captureValues()`, `getPropagationProperties()`, `getStartDelay()`
- **`TransitionSet`** — 43 function(s): `TransitionSet()`, `super()`, `setOrdering()`, `if()`, `AndroidRuntimeException()`, `getOrdering()`, `addTransition()`, `getTransitionCount()`, `getTransitionAt()`, `setDuration()`, `for()`, `setStartDelay()`, `return()`, `setInterpolator()`, `addTarget()`, `addListener()`, `removeTarget()`, `excludeTarget()`, `removeListener()`, `setPathMotion()`, `removeTransition()`, `setupStartEndListeners()`, `while()`, `TransitionSetListener()`, `onTransitionStart()`, `onTransitionEnd()`, `createAnimators()`, `runAnimators()`, `start()`, `end()`, `captureStartValues()`, `captureEndValues()`, `capturePropagationValues()`, `pause()`, `resume()`, `cancel()`, `forceToEnd()`, `setSceneRoot()`, `setCanRemoveViews()`, `setPropagation()`, `setEpicenterCallback()`, `toString()`, `mo0clone()`
- **`TransitionUtils`** — 7 function(s): `copyViewImage()`, `if()`, `createViewBitmap()`, `mergeAnimators()`, `evaluate()`, `for()`, `TransitionUtils()`
- **`TransitionValues`** — 6 function(s): `equals()`, `if()`, `hashCode()`, `return()`, `toString()`, `for()`
- **`TranslationAnimationCreator`** — 8 function(s): `createAnimation()`, `if()`, `TransitionPositionListener()`, `onAnimationCancel()`, `onAnimationEnd()`, `onAnimationPause()`, `onAnimationResume()`, `TranslationAnimationCreator()`
- **`ViewGroupOverlayApi14`** — 6 function(s): `ViewGroupOverlayApi14()`, `super()`, `createFrom()`, `return()`, `add()`, `remove()`
- **`ViewGroupOverlayApi18`** — 4 function(s): `ViewGroupOverlayApi18()`, `add()`, `clear()`, `remove()`
- **`ViewGroupOverlayImpl`** — 2 function(s): `add()`, `remove()`
- **`ViewGroupUtils`** — 5 function(s): `getOverlay()`, `if()`, `ViewGroupOverlayApi18()`, `suppressLayout()`, `ViewGroupUtils()`
- **`ViewGroupUtilsApi14`** — 5 function(s): `suppressLayout()`, `if()`, `isChangingLayout()`, `cancelLayoutTransition()`, `ViewGroupUtilsApi14()`
- **`ViewGroupUtilsApi18`** — 4 function(s): `suppressLayout()`, `fetchSuppressLayoutMethod()`, `if()`, `ViewGroupUtilsApi18()`
- **`ViewOverlayApi14`** — 30 function(s): `ViewOverlayApi14()`, `getContentView()`, `while()`, `if()`, `return()`, `createFrom()`, `for()`, `ViewGroupOverlayApi14()`, `getOverlayView()`, `add()`, `clear()`, `remove()`, `isEmpty()`, `OverlayViewGroup()`, `super()`, `setRight()`, `setBottom()`, `dispatchTouchEvent()`, `invalidate()`, `verifyDrawable()`, `removeAllViews()`, `getChildCount()`, `invalidateDrawable()`, `dispatchDraw()`, `onLayout()`, `getOffset()`, `invalidateChildFast()`, `invalidateChildInParentFast()`, `invalidateChildInParent()`, `TouchInterceptor()`
- **`ViewOverlayApi18`** — 4 function(s): `ViewOverlayApi18()`, `add()`, `clear()`, `remove()`
- **`ViewOverlayImpl`** — 3 function(s): `add()`, `clear()`, `remove()`
- **`ViewUtils`** — 19 function(s): `if()`, `get()`, `set()`, `getOverlay()`, `ViewOverlayApi18()`, `getWindowId()`, `WindowIdApi18()`, `WindowIdApi14()`, `setTransitionAlpha()`, `getTransitionAlpha()`, `saveNonTransitionAlpha()`, `clearNonTransitionAlpha()`, `setTransitionVisibility()`, `fetchViewFlagsField()`, `transformMatrixToGlobal()`, `transformMatrixToLocal()`, `setAnimationMatrix()`, `setLeftTopRightBottom()`, `ViewUtils()`
- **`ViewUtilsApi19`** — 9 function(s): `setTransitionAlpha()`, `fetchSetTransitionAlphaMethod()`, `if()`, `RuntimeException()`, `getTransitionAlpha()`, `fetchGetTransitionAlphaMethod()`, `return()`, `saveNonTransitionAlpha()`, `clearNonTransitionAlpha()`
- **`ViewUtilsApi21`** — 8 function(s): `transformMatrixToGlobal()`, `fetchTransformMatrixToGlobalMethod()`, `if()`, `RuntimeException()`, `transformMatrixToLocal()`, `fetchTransformMatrixToLocalMethod()`, `setAnimationMatrix()`, `fetchSetAnimationMatrix()`
- **`ViewUtilsApi22`** — 4 function(s): `setLeftTopRightBottom()`, `fetchSetLeftTopRightBottomMethod()`, `if()`, `RuntimeException()`
- **`ViewUtilsBase`** — 9 function(s): `setTransitionAlpha()`, `if()`, `getTransitionAlpha()`, `saveNonTransitionAlpha()`, `clearNonTransitionAlpha()`, `transformMatrixToGlobal()`, `transformMatrixToLocal()`, `setAnimationMatrix()`, `setLeftTopRightBottom()`
- **`Visibility`** — 32 function(s): `VisibilityInfo()`, `Visibility()`, `super()`, `if()`, `setMode()`, `IllegalArgumentException()`, `getMode()`, `getTransitionProperties()`, `captureValues()`, `captureStartValues()`, `captureEndValues()`, `isVisible()`, `getVisibilityChangeInfo()`, `createAnimator()`, `onAppear()`, `onDisappear()`, `onAnimationEnd()`, `addListener()`, `isTransitionRequired()`, `DisappearListener()`, `suppressLayout()`, `onAnimationPause()`, `onAnimationResume()`, `onAnimationCancel()`, `onAnimationRepeat()`, `onAnimationStart()`, `hideViewWhenNotCanceled()`, `onTransitionStart()`, `onTransitionEnd()`, `onTransitionCancel()`, `onTransitionPause()`, `onTransitionResume()`
- **`VisibilityPropagation`** — 7 function(s): `captureValues()`, `if()`, `getPropagationProperties()`, `getViewVisibility()`, `getViewX()`, `getViewCoordinate()`, `getViewY()`
- **`WindowIdApi14`** — 4 function(s): `WindowIdApi14()`, `equals()`, `return()`, `hashCode()`
- **`WindowIdApi18`** — 4 function(s): `WindowIdApi18()`, `equals()`, `return()`, `hashCode()`

</details>

### Package `android.support.v13.view`  (2 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `DragAndDropPermissionsCompat` | class | — | 30 | 6 |
| `DragStartHelper` | class | — | 86 | 14 |

<details>
<summary><b>Function list for <code>android.support.v13.view</code></b> (click to expand)</summary>

- **`DragAndDropPermissionsCompat`** — 4 function(s): `DragAndDropPermissionsCompat()`, `request()`, `if()`, `release()`
- **`DragStartHelper`** — 8 function(s): `onLongClick()`, `onTouch()`, `onDragStart()`, `DragStartHelper()`, `attach()`, `detach()`, `if()`, `getTouchPosition()`

</details>

### Package `android.support.v13.view.inputmethod`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `EditorInfoCompat` | class | — | 41 | 7 |
| `InputConnectionCompat` | class | — | 130 | 27 |
| `InputContentInfoCompat` | class | InputContentInfoCompatImpl | 154 | 33 |

<details>
<summary><b>Function list for <code>android.support.v13.view.inputmethod</code></b> (click to expand)</summary>

- **`EditorInfoCompat`** — 4 function(s): `setContentMimeTypes()`, `if()`, `getContentMimeTypes()`, `EditorInfoCompat()`
- **`InputConnectionCompat`** — 10 function(s): `onCommitContent()`, `handlePerformPrivateCommand()`, `if()`, `commitContent()`, `while()`, `createWrapper()`, `IllegalArgumentException()`, `InputConnectionWrapper()`, `performPrivateCommand()`, `InputConnectionCompat()`
- **`InputContentInfoCompat`** — 12 function(s): `getContentUri()`, `getDescription()`, `getInputContentInfo()`, `getLinkUri()`, `releasePermission()`, `requestPermission()`, `InputContentInfoCompatBaseImpl()`, `InputContentInfoCompatApi25Impl()`, `InputContentInfoCompat()`, `if()`, `wrap()`, `unwrap()`

</details>

### Package `android.support.v4.accessibilityservice`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AccessibilityServiceInfoCompat` | class | — | 104 | 22 |

<details>
<summary><b>Function list for <code>android.support.v4.accessibilityservice</code></b> (click to expand)</summary>

- **`AccessibilityServiceInfoCompat`** — 8 function(s): `AccessibilityServiceInfoCompat()`, `loadDescription()`, `if()`, `feedbackTypeToString()`, `while()`, `flagToString()`, `getCapabilities()`, `capabilityToString()`

</details>

### Package `android.support.v4.app`  (53 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ActionBarDrawerToggle` | class | DrawerLayout.DrawerListener | 351 | 72 |
| `ActivityCompat` | class | ContextCompat | 237 | 51 |
| `ActivityManagerCompat` | class | — | 18 | 3 |
| `ActivityOptionsCompat` | class | ActivityOptionsCompat | 148 | 51 |
| `AlarmManagerCompat` | class | — | 44 | 11 |
| `AppComponentFactory` | class | android.app.AppComponentFactory | 78 | 25 |
| `AppLaunchChecker` | class | — | 32 | 5 |
| `AppOpsManagerCompat` | class | — | 56 | 11 |
| `BackStackRecord` | class | FragmentTransaction implements FragmentManager.BackStackEntry, FragmentManagerImpl.OpGe... | 840 | 177 |
| `BackStackState` | class | Parcelable | 165 | 14 |
| `BundleCompat` | class | — | 86 | 13 |
| `CoreComponentFactory` | class | android.app.AppComponentFactory | 53 | 13 |
| `DialogFragment` | class | Fragment implements DialogInterface.OnCancelListener, DialogInterface.OnDismissListener | 286 | 64 |
| `Fragment` | class | ComponentCallbacks, View.OnCreateContextMenuListener, LifecycleOwner, ViewModelStoreOwner | 1,607 | 420 |
| `FragmentActivity` | class | SupportActivity implements ViewModelStoreOwner, ActivityCompat.OnRequestPermissionsResu... | 678 | 144 |
| `FragmentContainer` | class | — | 17 | 3 |
| `FragmentController` | class | — | 198 | 45 |
| `FragmentHostCallback` | class | FragmentContainer | 123 | 28 |
| `FragmentManager` | class | — | 137 | 48 |
| `FragmentManagerImpl` | class | FragmentManager implements LayoutInflater.Factory2 | 3,086 | 844 |
| `FragmentManagerNonConfig` | class | — | 34 | 4 |
| `FragmentManagerState` | class | Parcelable | 56 | 7 |
| `FragmentPagerAdapter` | class | PagerAdapter | 104 | 22 |
| `FragmentState` | class | Parcelable | 125 | 12 |
| `FragmentStatePagerAdapter` | class | PagerAdapter | 156 | 33 |
| `FragmentTabHost` | class | TabHost implements TabHost.OnTabChangeListener | 292 | 64 |
| `FragmentTransaction` | class | — | 78 | 31 |
| `FragmentTransition` | class | — | 889 | 190 |
| `FragmentTransitionCompat21` | class | FragmentTransitionImpl | 280 | 66 |
| `FragmentTransitionImpl` | class | — | 218 | 59 |
| `FrameMetricsAggregator` | class | FrameMetricsBaseImpl | 230 | 42 |
| `INotificationSideChannel` | class | IInterface | 147 | 27 |
| `JobIntentService` | class | Service | 461 | 102 |
| `ListFragment` | class | Fragment | 235 | 52 |
| `LoaderManager` | class | — | 47 | 13 |
| `LoaderManagerImpl` | class | LoaderManager | 449 | 102 |
| `NavUtils` | class | — | 123 | 28 |
| `NotificationBuilderWithBuilderAccessor` | class | — | 9 | 1 |
| `NotificationCompat` | class | Style | 2,657 | 529 |
| `NotificationCompatBuilder` | class | NotificationBuilderWithBuilderAccessor | 297 | 77 |
| `NotificationCompatExtras` | class | — | 15 | 1 |
| `NotificationCompatJellybean` | class | — | 298 | 50 |
| `NotificationCompatSideChannelService` | class | Service | 75 | 17 |
| `NotificationManagerCompat` | class | Handler.Callback, ServiceConnection | 467 | 103 |
| `OneShotPreDrawListener` | class | ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener | 51 | 9 |
| `Person` | class | — | 140 | 24 |
| `RemoteInput` | class | — | 274 | 63 |
| `ServiceCompat` | class | — | 30 | 3 |
| `ShareCompat` | class | — | 460 | 107 |
| `SharedElementCallback` | class | — | 139 | 21 |
| `SuperNotCalledException` | class | AndroidRuntimeException | 11 | 2 |
| `SupportActivity` | class | Activity implements LifecycleOwner, KeyEventDispatcher.Component | 75 | 11 |
| `TaskStackBuilder` | class | Iterable<Intent> | 162 | 44 |

<details>
<summary><b>Function list for <code>android.support.v4.app</code></b> (click to expand)</summary>

- **`ActionBarDrawerToggle`** — 27 function(s): `getThemeUpIndicator()`, `setActionBarDescription()`, `setActionBarUpIndicator()`, `getDrawerToggleDelegate()`, `ActionBarDrawerToggle()`, `this()`, `assumeMaterial()`, `if()`, `syncState()`, `setHomeAsUpIndicator()`, `setDrawerIndicatorEnabled()`, `isDrawerIndicatorEnabled()`, `onConfigurationChanged()`, `onOptionsItemSelected()`, `onDrawerSlide()`, `onDrawerOpened()`, `onDrawerClosed()`, `onDrawerStateChanged()`, `SetIndicatorInfo()`, `SlideDrawable()`, `super()`, `setPosition()`, `invalidateSelf()`, `getPosition()`, `setOffset()`, `draw()`, `copyBounds()`
- **`ActivityCompat`** — 34 function(s): `onRequestPermissionsResult()`, `onActivityResult()`, `requestPermissions()`, `validateRequestPermissionsRequestCode()`, `ActivityCompat()`, `setPermissionCompatDelegate()`, `getPermissionCompatDelegate()`, `invalidateOptionsMenu()`, `startActivityForResult()`, `if()`, `startIntentSenderForResult()`, `finishAffinity()`, `finishAfterTransition()`, `getReferrer()`, `requireViewById()`, `return()`, `IllegalArgumentException()`, `setEnterSharedElementCallback()`, `setExitSharedElementCallback()`, `postponeEnterTransition()`, `startPostponedEnterTransition()`, `run()`, `for()`, `shouldShowRequestPermissionRationale()`, `requestDragAndDropPermissions()`, `SharedElementCallback21Impl()`, `onSharedElementStart()`, `onSharedElementEnd()`, `onRejectSharedElements()`, `onMapSharedElements()`, `onCaptureSharedElementSnapshot()`, `onCreateSnapshotView()`, `onSharedElementsArrived()`, `onSharedElementsReady()`
- **`ActivityManagerCompat`** — 3 function(s): `ActivityManagerCompat()`, `isLowRamDevice()`, `if()`
- **`ActivityOptionsCompat`** — 16 function(s): `makeCustomAnimation()`, `if()`, `ActivityOptionsCompatImpl()`, `ActivityOptionsCompat()`, `makeScaleUpAnimation()`, `makeClipRevealAnimation()`, `makeThumbnailScaleUpAnimation()`, `makeSceneTransitionAnimation()`, `for()`, `makeTaskLaunchBehind()`, `makeBasic()`, `toBundle()`, `update()`, `requestUsageTimeReport()`, `setLaunchBounds()`, `getLaunchBounds()`
- **`AlarmManagerCompat`** — 6 function(s): `setAlarmClock()`, `if()`, `setExact()`, `setAndAllowWhileIdle()`, `setExactAndAllowWhileIdle()`, `AlarmManagerCompat()`
- **`AppComponentFactory`** — 12 function(s): `instantiateActivity()`, `return()`, `instantiateApplication()`, `instantiateReceiver()`, `instantiateProvider()`, `instantiateService()`, `instantiateApplicationCompat()`, `RuntimeException()`, `instantiateActivityCompat()`, `instantiateReceiverCompat()`, `instantiateServiceCompat()`, `instantiateProviderCompat()`
- **`AppLaunchChecker`** — 4 function(s): `hasStartedFromLauncher()`, `onActivityCreate()`, `if()`, `AppLaunchChecker()`
- **`AppOpsManagerCompat`** — 7 function(s): `AppOpsManagerCompat()`, `permissionToOp()`, `if()`, `noteOp()`, `noteOpNoThrow()`, `noteProxyOp()`, `noteProxyOpNoThrow()`
- **`BackStackRecord`** — 58 function(s): `Op()`, `toString()`, `if()`, `dump()`, `for()`, `switch()`, `BackStackRecord()`, `getId()`, `getBreadCrumbTitleRes()`, `getBreadCrumbShortTitleRes()`, `getBreadCrumbTitle()`, `getBreadCrumbShortTitle()`, `addOp()`, `add()`, `doAddOp()`, `IllegalStateException()`, `IllegalArgumentException()`, `replace()`, `remove()`, `hide()`, `show()`, `detach()`, `attach()`, `setPrimaryNavigationFragment()`, `setCustomAnimations()`, `setTransition()`, `addSharedElement()`, `setTransitionStyle()`, `addToBackStack()`, `isAddToBackStackAllowed()`, `disallowAddToBackStack()`, `setBreadCrumbTitle()`, `setBreadCrumbShortTitle()`, `bumpBackStackNesting()`, `runOnCommit()`, `runOnCommitRunnables()`, `commit()`, `commitInternal()`, `commitAllowingStateLoss()`, `commitNow()`, `commitNowAllowingStateLoss()`, `setReorderingAllowed()`, `setAllowOptimization()`, `generateOps()`, `interactsWith()`, `while()`, `executeOps()`, `executePopOps()`, `expandOps()`, `trackAddedFragmentsInPop()`, `isPostponed()`, `setOnStartPostponedListener()`, `isFragmentPostponed()`, `return()`, `getName()`, `getTransition()`, `getTransitionStyle()`, `isEmpty()`
- **`BackStackState`** — 9 function(s): `createFromParcel()`, `BackStackState()`, `newArray()`, `if()`, `IllegalStateException()`, `while()`, `instantiate()`, `describeContents()`, `writeToParcel()`
- **`BundleCompat`** — 6 function(s): `BundleCompatBaseImpl()`, `getBinder()`, `if()`, `return()`, `putBinder()`, `BundleCompat()`
- **`CoreComponentFactory`** — 9 function(s): `getWrapper()`, `instantiateActivity()`, `return()`, `instantiateApplication()`, `instantiateReceiver()`, `instantiateProvider()`, `instantiateService()`, `checkCompatWrapper()`, `if()`
- **`DialogFragment`** — 30 function(s): `setStyle()`, `if()`, `show()`, `showNow()`, `dismiss()`, `dismissInternal()`, `dismissAllowingStateLoss()`, `getFragmentManager()`, `getDialog()`, `getTheme()`, `setCancelable()`, `isCancelable()`, `setShowsDialog()`, `getShowsDialog()`, `onAttach()`, `onDetach()`, `onCreate()`, `onGetLayoutInflater()`, `setupDialog()`, `return()`, `onCreateDialog()`, `Dialog()`, `onCancel()`, `onDismiss()`, `onActivityCreated()`, `IllegalStateException()`, `onStart()`, `onSaveInstanceState()`, `onStop()`, `onDestroyView()`
- **`Fragment`** — 178 function(s): `onStartEnterTransition()`, `startListening()`, `getLifecycle()`, `getViewLifecycleOwner()`, `if()`, `IllegalStateException()`, `getViewLifecycleOwnerLiveData()`, `getViewModelStore()`, `createFromParcel()`, `SavedState()`, `newArray()`, `describeContents()`, `writeToParcel()`, `InstantiationException()`, `super()`, `instantiate()`, `isSupportFragmentClass()`, `restoreViewState()`, `onViewStateRestored()`, `SuperNotCalledException()`, `setIndex()`, `isInBackStack()`, `equals()`, `hashCode()`, `toString()`, `getId()`, `getTag()`, `setArguments()`, `getArguments()`, `isStateSaved()`, `setInitialSavedState()`, `setTargetFragment()`, `IllegalArgumentException()`, `for()`, `getTargetFragment()`, `getTargetRequestCode()`, `getContext()`, `requireContext()`, `getActivity()`, `return()`, `requireActivity()`, `getHost()`, `requireHost()`, `getResources()`, `getText()`, `getString()`, `getFragmentManager()`, `requireFragmentManager()`, `getChildFragmentManager()`, `instantiateChildFragmentManager()`, `peekChildFragmentManager()`, `getParentFragment()`, `isAdded()`, `isDetached()`, `isRemoving()`, `isInLayout()`, `isResumed()`, `isVisible()`, `isHidden()`, `hasOptionsMenu()`, `isMenuVisible()`, `onHiddenChanged()`, `setRetainInstance()`, `getRetainInstance()`, `setHasOptionsMenu()`, `setMenuVisibility()`, `setUserVisibleHint()`, `getUserVisibleHint()`, `getLoaderManager()`, `startActivity()`, `startActivityForResult()`, `startIntentSenderForResult()`, `onActivityResult()`, `requestPermissions()`, `onRequestPermissionsResult()`, `shouldShowRequestPermissionRationale()`, `onGetLayoutInflater()`, `getLayoutInflater()`, `performGetLayoutInflater()`, `onInflate()`, `onAttachFragment()`, `onAttach()`, `onCreateAnimation()`, `onCreateAnimator()`, `onCreate()`, `restoreChildFragmentState()`, `onCreateView()`, `onViewCreated()`, `getView()`, `onActivityCreated()`, `onStart()`, `onResume()`, `onSaveInstanceState()`, `onMultiWindowModeChanged()`, `onPictureInPictureModeChanged()`, `onConfigurationChanged()`, `onPause()`, `onStop()`, `onLowMemory()`, `onDestroyView()`, `onDestroy()`, `initState()`, `onDetach()`, `onCreateOptionsMenu()`, `onPrepareOptionsMenu()`, `onDestroyOptionsMenu()`, `onOptionsItemSelected()`, `onOptionsMenuClosed()`, `onCreateContextMenu()`, `registerForContextMenu()`, `unregisterForContextMenu()`, `onContextItemSelected()`, `setEnterSharedElementCallback()`, `ensureAnimationInfo()`, `setExitSharedElementCallback()`, `setEnterTransition()`, `getEnterTransition()`, `setReturnTransition()`, `getReturnTransition()`, `setExitTransition()`, `getExitTransition()`, `setReenterTransition()`, `getReenterTransition()`, `setSharedElementEnterTransition()`, `getSharedElementEnterTransition()`, `setSharedElementReturnTransition()`, `getSharedElementReturnTransition()`, `setAllowEnterTransitionOverlap()`, `getAllowEnterTransitionOverlap()`, `setAllowReturnTransitionOverlap()`, `getAllowReturnTransitionOverlap()`, `postponeEnterTransition()`, `startPostponedEnterTransition()`, `run()`, `callStartTransitionListener()`, `dump()`, `findFragmentByWho()`, `onFindViewById()`, `onHasView()`, `performCreate()`, `performCreateView()`, `performActivityCreated()`, `performStart()`, `performResume()`, `noteStateNotSaved()`, `performMultiWindowModeChanged()`, `performPictureInPictureModeChanged()`, `performConfigurationChanged()`, `performLowMemory()`, `performCreateOptionsMenu()`, `performPrepareOptionsMenu()`, `performOptionsItemSelected()`, `performContextItemSelected()`, `performOptionsMenuClosed()`, `performSaveInstanceState()`, `performPause()`, `performStop()`, `performDestroyView()`, `performDestroy()`, `performDetach()`, `setOnStartEnterTransitionListener()`, `getNextAnim()`, `setNextAnim()`, `getNextTransition()`, `setNextTransition()`, `getNextTransitionStyle()`, `getEnterTransitionCallback()`, `getExitTransitionCallback()`, `getAnimatingAway()`, `setAnimatingAway()`, `setAnimator()`, `getAnimator()`, `getStateAfterAnimating()`, `setStateAfterAnimating()`, `isPostponed()`, `isHideReplaced()`, `setHideReplaced()`, `AnimationInfo()`
- **`FragmentActivity`** — 74 function(s): `handleMessage()`, `if()`, `NonConfigurationInstances()`, `onActivityResult()`, `onBackPressed()`, `supportFinishAfterTransition()`, `setEnterSharedElementCallback()`, `setExitSharedElementCallback()`, `supportPostponeEnterTransition()`, `supportStartPostponedEnterTransition()`, `onMultiWindowModeChanged()`, `onPictureInPictureModeChanged()`, `onConfigurationChanged()`, `getViewModelStore()`, `IllegalStateException()`, `getLifecycle()`, `onCreate()`, `for()`, `onCreatePanelMenu()`, `onCreateView()`, `dispatchFragmentsOnCreateView()`, `onDestroy()`, `onLowMemory()`, `onMenuItemSelected()`, `onPanelClosed()`, `onPause()`, `onResumeFragments()`, `onNewIntent()`, `onStateNotSaved()`, `onResume()`, `onPostResume()`, `onPreparePanel()`, `onPrepareOptionsPanel()`, `onRetainNonConfigurationInstance()`, `onSaveInstanceState()`, `markFragmentsCreated()`, `onStart()`, `onStop()`, `onRetainCustomNonConfigurationInstance()`, `getLastCustomNonConfigurationInstance()`, `supportInvalidateOptionsMenu()`, `invalidateOptionsMenu()`, `dump()`, `onAttachFragment()`, `getSupportFragmentManager()`, `getSupportLoaderManager()`, `startActivityForResult()`, `checkForValidRequestCode()`, `startIntentSenderForResult()`, `IllegalArgumentException()`, `validateRequestPermissionsRequestCode()`, `onRequestPermissionsResult()`, `startActivityFromFragment()`, `startIntentSenderFromFragment()`, `allocateRequestIndex()`, `while()`, `requestPermissionsFromFragment()`, `HostCallbacks()`, `super()`, `onDump()`, `onShouldSaveFragmentState()`, `onGetLayoutInflater()`, `onGetHost()`, `onSupportInvalidateOptionsMenu()`, `onStartActivityFromFragment()`, `onStartIntentSenderFromFragment()`, `onRequestPermissionsFromFragment()`, `onShouldShowRequestPermissionRationale()`, `onHasWindowAnimations()`, `onGetWindowAnimations()`, `onFindViewById()`, `onHasView()`, `return()`, `markState()`
- **`FragmentContainer`** — 3 function(s): `onFindViewById()`, `onHasView()`, `instantiate()`
- **`FragmentController`** — 43 function(s): `createController()`, `FragmentController()`, `getSupportFragmentManager()`, `getSupportLoaderManager()`, `UnsupportedOperationException()`, `findFragmentByWho()`, `getActiveFragmentsCount()`, `getActiveFragments()`, `attachHost()`, `onCreateView()`, `noteStateNotSaved()`, `saveAllState()`, `restoreAllState()`, `retainNonConfig()`, `if()`, `retainNestedNonConfig()`, `dispatchCreate()`, `dispatchActivityCreated()`, `dispatchStart()`, `dispatchResume()`, `dispatchPause()`, `dispatchStop()`, `dispatchReallyStop()`, `dispatchDestroyView()`, `dispatchDestroy()`, `dispatchMultiWindowModeChanged()`, `dispatchPictureInPictureModeChanged()`, `dispatchConfigurationChanged()`, `dispatchLowMemory()`, `dispatchCreateOptionsMenu()`, `dispatchPrepareOptionsMenu()`, `dispatchOptionsItemSelected()`, `dispatchContextItemSelected()`, `dispatchOptionsMenuClosed()`, `execPendingActions()`, `doLoaderStart()`, `doLoaderStop()`, `doLoaderRetain()`, `doLoaderDestroy()`, `reportLoaderStart()`, `retainLoaderNonConfig()`, `restoreLoaderNonConfig()`, `dumpLoaders()`
- **`FragmentHostCallback`** — 22 function(s): `onGetHost()`, `FragmentHostCallback()`, `this()`, `onDump()`, `onShouldSaveFragmentState()`, `onGetLayoutInflater()`, `onSupportInvalidateOptionsMenu()`, `onStartActivityFromFragment()`, `if()`, `IllegalStateException()`, `onStartIntentSenderFromFragment()`, `onRequestPermissionsFromFragment()`, `onShouldShowRequestPermissionRationale()`, `onHasWindowAnimations()`, `onGetWindowAnimations()`, `onFindViewById()`, `onHasView()`, `getActivity()`, `getContext()`, `getHandler()`, `getFragmentManagerImpl()`, `onAttachFragment()`
- **`FragmentManager`** — 43 function(s): `getBreadCrumbShortTitle()`, `getBreadCrumbShortTitleRes()`, `getBreadCrumbTitle()`, `getBreadCrumbTitleRes()`, `getId()`, `getName()`, `onBackStackChanged()`, `addOnBackStackChangedListener()`, `beginTransaction()`, `dump()`, `executePendingTransactions()`, `findFragmentById()`, `findFragmentByTag()`, `getBackStackEntryAt()`, `getBackStackEntryCount()`, `getFragment()`, `getFragments()`, `getPrimaryNavigationFragment()`, `isDestroyed()`, `isStateSaved()`, `popBackStack()`, `popBackStackImmediate()`, `putFragment()`, `registerFragmentLifecycleCallbacks()`, `removeOnBackStackChangedListener()`, `saveFragmentInstanceState()`, `unregisterFragmentLifecycleCallbacks()`, `openTransaction()`, `enableDebugLogging()`, `onFragmentPreAttached()`, `onFragmentAttached()`, `onFragmentPreCreated()`, `onFragmentCreated()`, `onFragmentActivityCreated()`, `onFragmentViewCreated()`, `onFragmentStarted()`, `onFragmentResumed()`, `onFragmentPaused()`, `onFragmentStopped()`, `onFragmentSaveInstanceState()`, `onFragmentViewDestroyed()`, `onFragmentDestroyed()`, `onFragmentDetached()`
- **`FragmentManagerImpl`** — 152 function(s): `run()`, `generateOps()`, `FragmentLifecycleCallbacksHolder()`, `modifiesAlpha()`, `if()`, `for()`, `shouldRunOnHWLayer()`, `throwException()`, `dump()`, `beginTransaction()`, `BackStackRecord()`, `executePendingTransactions()`, `forcePostponedTransactions()`, `popBackStack()`, `enqueueAction()`, `popBackStackImmediate()`, `checkStateLoss()`, `IllegalArgumentException()`, `execPendingActions()`, `ensureExecReady()`, `removeRedundantOperationsAndExecute()`, `cleanupExec()`, `doPendingDeferredStart()`, `burpActive()`, `getBackStackEntryCount()`, `getBackStackEntryAt()`, `addOnBackStackChangedListener()`, `removeOnBackStackChangedListener()`, `putFragment()`, `getFragment()`, `getFragments()`, `synchronized()`, `getActiveFragments()`, `getActiveFragmentCount()`, `saveFragmentInstanceState()`, `isDestroyed()`, `toString()`, `makeOpenCloseAnimation()`, `AnimationOrAnimator()`, `makeFadeAnimation()`, `loadAnimation()`, `switch()`, `performPendingDeferredStart()`, `moveToState()`, `setHWLayerAnimListenerIfAlpha()`, `getAnimationListener()`, `isStateAtLeast()`, `dispatchOnFragmentStarted()`, `dispatchOnFragmentResumed()`, `IllegalStateException()`, `dispatchOnFragmentPreAttached()`, `SuperNotCalledException()`, `dispatchOnFragmentAttached()`, `dispatchOnFragmentPreCreated()`, `dispatchOnFragmentCreated()`, `ensureInflatedFragmentView()`, `dispatchOnFragmentViewCreated()`, `dispatchOnFragmentActivityCreated()`, `dispatchOnFragmentPaused()`, `dispatchOnFragmentStopped()`, `saveFragmentViewState()`, `dispatchOnFragmentViewDestroyed()`, `animateRemoveFragment()`, `dispatchOnFragmentDestroyed()`, `dispatchOnFragmentDetached()`, `makeInactive()`, `onAnimationEnd()`, `completeShowHideFragment()`, `moveFragmentToExpectedState()`, `startPendingDeferredFragments()`, `makeActive()`, `addFragment()`, `removeFragment()`, `hideFragment()`, `showFragment()`, `detachFragment()`, `attachFragment()`, `findFragmentById()`, `findFragmentByTag()`, `findFragmentByWho()`, `isStateSaved()`, `scheduleCommit()`, `allocBackStackIndex()`, `setBackStackIndex()`, `while()`, `freeBackStackIndex()`, `executePostponedTransaction()`, `execSingleAction()`, `executeOpsTogether()`, `executeOps()`, `addAddedFragments()`, `makeRemovedFragmentsInvisible()`, `reportBackStackChanged()`, `postponePostponableTransactions()`, `completeExecute()`, `findFragmentUnder()`, `endAnimatingAwayFragments()`, `generateOpsForPendingActions()`, `addBackStackState()`, `popBackStackState()`, `retainNonConfig()`, `setRetaining()`, `saveNonConfig()`, `saveFragmentBasicState()`, `dispatchOnFragmentSaveInstanceState()`, `saveAllState()`, `restoreAllState()`, `attachController()`, `noteStateNotSaved()`, `dispatchCreate()`, `dispatchStateChange()`, `dispatchActivityCreated()`, `dispatchStart()`, `dispatchResume()`, `dispatchPause()`, `dispatchStop()`, `dispatchDestroyView()`, `dispatchDestroy()`, `dispatchMultiWindowModeChanged()`, `dispatchPictureInPictureModeChanged()`, `dispatchConfigurationChanged()`, `dispatchLowMemory()`, `dispatchCreateOptionsMenu()`, `dispatchPrepareOptionsMenu()`, `dispatchOptionsItemSelected()`, `dispatchContextItemSelected()`, `dispatchOptionsMenuClosed()`, `setPrimaryNavigationFragment()`, `getPrimaryNavigationFragment()`, `registerFragmentLifecycleCallbacks()`, `unregisterFragmentLifecycleCallbacks()`, `reverseTransit()`, `transitToStyleIndex()`, `onCreateView()`, `getLayoutInflaterFactory()`, `FragmentTag()`, `PopBackStackState()`, `StartEnterTransitionListener()`, `onStartEnterTransition()`, `startListening()`, `isReady()`, `completeTransaction()`, `cancelTransaction()`, `AnimationListenerWrapper()`, `onAnimationStart()`, `onAnimationRepeat()`, `AnimateOnHWLayerIfNeededListener()`, `super()`, `AnimatorOnHWLayerIfNeededListener()`, `EndViewTransitionAnimator()`, `addAnimation()`, `getTransformation()`
- **`FragmentManagerNonConfig`** — 4 function(s): `FragmentManagerNonConfig()`, `getFragments()`, `getChildNonConfigs()`, `getViewModelStores()`
- **`FragmentManagerState`** — 5 function(s): `createFromParcel()`, `FragmentManagerState()`, `newArray()`, `describeContents()`, `writeToParcel()`
- **`FragmentPagerAdapter`** — 15 function(s): `getItem()`, `FragmentPagerAdapter()`, `startUpdate()`, `if()`, `IllegalStateException()`, `instantiateItem()`, `destroyItem()`, `setPrimaryItem()`, `finishUpdate()`, `isViewFromObject()`, `return()`, `saveState()`, `restoreState()`, `getItemId()`, `makeFragmentName()`
- **`FragmentState`** — 7 function(s): `createFromParcel()`, `FragmentState()`, `newArray()`, `instantiate()`, `if()`, `describeContents()`, `writeToParcel()`
- **`FragmentStatePagerAdapter`** — 15 function(s): `getItem()`, `FragmentStatePagerAdapter()`, `startUpdate()`, `if()`, `IllegalStateException()`, `instantiateItem()`, `while()`, `destroyItem()`, `setPrimaryItem()`, `finishUpdate()`, `isViewFromObject()`, `return()`, `saveState()`, `for()`, `restoreState()`
- **`FragmentTabHost`** — 29 function(s): `TabInfo()`, `DummyTabFactory()`, `createTabContent()`, `createFromParcel()`, `SavedState()`, `newArray()`, `super()`, `writeToParcel()`, `toString()`, `FragmentTabHost()`, `initFragmentTabHost()`, `ensureHierarchy()`, `if()`, `addView()`, `setup()`, `IllegalStateException()`, `ensureContent()`, `setId()`, `setOnTabChangedListener()`, `addTab()`, `onAttachedToWindow()`, `for()`, `onDetachedFromWindow()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setCurrentTabByTag()`, `onTabChanged()`, `doTabChanged()`, `getTabInfoForTag()`
- **`FragmentTransaction`** — 25 function(s): `add()`, `addSharedElement()`, `addToBackStack()`, `attach()`, `commit()`, `commitAllowingStateLoss()`, `commitNow()`, `commitNowAllowingStateLoss()`, `detach()`, `disallowAddToBackStack()`, `hide()`, `isAddToBackStackAllowed()`, `isEmpty()`, `remove()`, `replace()`, `runOnCommit()`, `setAllowOptimization()`, `setBreadCrumbShortTitle()`, `setBreadCrumbTitle()`, `setCustomAnimations()`, `setPrimaryNavigationFragment()`, `setReorderingAllowed()`, `setTransition()`, `setTransitionStyle()`, `show()`
- **`FragmentTransition`** — 37 function(s): `resolveSupportImpl()`, `return()`, `startTransitions()`, `if()`, `for()`, `calculatePopFragments()`, `calculateFragments()`, `configureTransitionsReordered()`, `configureTransitionsOrdered()`, `calculateNameOverrides()`, `setViewVisibility()`, `replaceHide()`, `run()`, `scheduleTargetChange()`, `chooseImpl()`, `IllegalArgumentException()`, `canHandleAll()`, `getSharedElementTransition()`, `getEnterTransition()`, `getExitTransition()`, `configureSharedElementsReordered()`, `addSharedElementsWithMatchingNames()`, `callSharedElementStartEnd()`, `setOutEpicenter()`, `configureSharedElementsOrdered()`, `captureOutSharedElements()`, `captureInSharedElements()`, `retainValues()`, `findKeyForValue()`, `getInEpicenterView()`, `configureEnteringExitingViews()`, `mergeTransitions()`, `addToFirstInLastOut()`, `supportsTransition()`, `ensureContainer()`, `FragmentContainerTransition()`, `FragmentTransition()`
- **`FragmentTransitionCompat21`** — 27 function(s): `canHandle()`, `cloneTransition()`, `if()`, `wrapTransitionInSet()`, `setSharedElementTargets()`, `for()`, `bfsAddViewChildren()`, `addTargets()`, `setEpicenter()`, `getBoundsOnScreen()`, `onGetEpicenter()`, `hasSimpleTarget()`, `return()`, `mergeTransitionsTogether()`, `scheduleHideFragmentView()`, `onTransitionStart()`, `onTransitionEnd()`, `onTransitionCancel()`, `onTransitionPause()`, `onTransitionResume()`, `mergeTransitionsInSequence()`, `beginDelayedTransition()`, `scheduleRemoveTargets()`, `swapSharedElementTargets()`, `replaceTargets()`, `addTarget()`, `removeTarget()`
- **`FragmentTransitionImpl`** — 30 function(s): `addTarget()`, `addTargets()`, `beginDelayedTransition()`, `canHandle()`, `cloneTransition()`, `mergeTransitionsInSequence()`, `mergeTransitionsTogether()`, `removeTarget()`, `replaceTargets()`, `scheduleHideFragmentView()`, `scheduleRemoveTargets()`, `setEpicenter()`, `setSharedElementTargets()`, `swapSharedElementTargets()`, `wrapTransitionInSet()`, `getBoundsOnScreen()`, `prepareSetNameOverridesReordered()`, `for()`, `setNameOverridesReordered()`, `if()`, `while()`, `run()`, `captureTransitioningViews()`, `findNamedViews()`, `setNameOverridesOrdered()`, `scheduleNameReset()`, `bfsAddViewChildren()`, `containedBeforeIndex()`, `isNullOrEmpty()`, `findKeyForValue()`
- **`FrameMetricsAggregator`** — 14 function(s): `FrameMetricsAggregator()`, `this()`, `if()`, `add()`, `remove()`, `stop()`, `reset()`, `getMetrics()`, `FrameMetricsBaseImpl()`, `onFrameMetricsAvailable()`, `FrameMetricsApi24Impl()`, `addDurationItem()`, `for()`, `while()`
- **`INotificationSideChannel`** — 12 function(s): `cancel()`, `cancelAll()`, `notify()`, `Stub()`, `attachInterface()`, `asInterface()`, `if()`, `return()`, `Proxy()`, `asBinder()`, `onTransact()`, `getInterfaceDescriptor()`
- **`JobIntentService`** — 40 function(s): `compatGetBinder()`, `dequeueWork()`, `complete()`, `getIntent()`, `onHandleWork()`, `enqueueWork()`, `WorkEnqueuer()`, `ensureJobId()`, `if()`, `IllegalArgumentException()`, `serviceStartReceived()`, `serviceProcessingStarted()`, `serviceProcessingFinished()`, `CompatWorkEnqueuer()`, `super()`, `synchronized()`, `WrapperWorkItem()`, `JobServiceEngineImpl()`, `getBinder()`, `onStartJob()`, `onStopJob()`, `while()`, `JobWorkEnqueuer()`, `CompatWorkItem()`, `CommandProcessor()`, `doInBackground()`, `onCancelled()`, `onPostExecute()`, `JobIntentService()`, `onCreate()`, `onStartCommand()`, `ensureProcessorRunningLocked()`, `onBind()`, `onDestroy()`, `getWorkEnqueuer()`, `setInterruptIfStopped()`, `isStopped()`, `onStopCurrentWork()`, `doStopCurrentWork()`, `processorFinished()`
- **`ListFragment`** — 19 function(s): `run()`, `onItemClick()`, `onCreateView()`, `onViewCreated()`, `ensureList()`, `onDestroyView()`, `onListItemClick()`, `setListAdapter()`, `if()`, `setListShown()`, `setSelection()`, `getSelectedItemPosition()`, `getSelectedItemId()`, `getListView()`, `setEmptyText()`, `IllegalStateException()`, `setListShownNoAnimation()`, `getListAdapter()`, `RuntimeException()`
- **`LoaderManager`** — 13 function(s): `onCreateLoader()`, `onLoadFinished()`, `onLoaderReset()`, `destroyLoader()`, `dump()`, `getLoader()`, `initLoader()`, `markForRedelivery()`, `restartLoader()`, `getInstance()`, `LoaderManagerImpl()`, `enableDebugLogging()`, `hasRunningLoaders()`
- **`LoaderManagerImpl`** — 39 function(s): `LoaderInfo()`, `getLoader()`, `onActive()`, `if()`, `onInactive()`, `setCallback()`, `observe()`, `removeObserver()`, `markForRedelivery()`, `isCallbackWaitingForData()`, `return()`, `destroy()`, `onLoadComplete()`, `setValue()`, `postValue()`, `toString()`, `dump()`, `LoaderObserver()`, `onChanged()`, `hasDeliveredData()`, `reset()`, `create()`, `LoaderViewModel()`, `getInstance()`, `startCreatingLoader()`, `isCreatingLoader()`, `finishCreatingLoader()`, `putLoader()`, `removeLoader()`, `hasRunningLoaders()`, `for()`, `onCleared()`, `LoaderManagerImpl()`, `createAndInstallLoader()`, `IllegalArgumentException()`, `initLoader()`, `IllegalStateException()`, `restartLoader()`, `destroyLoader()`
- **`NavUtils`** — 10 function(s): `shouldUpRecreateTask()`, `if()`, `return()`, `navigateUpFromSameTask()`, `IllegalArgumentException()`, `navigateUpTo()`, `getParentActivityIntent()`, `Intent()`, `getParentActivityName()`, `NavUtils()`
- **`NotificationBuilderWithBuilderAccessor`** — 1 function(s): `getBuilder()`
- **`NotificationCompat`** — 226 function(s): `extend()`, `Builder()`, `this()`, `setWhen()`, `setShowWhen()`, `setUsesChronometer()`, `setSmallIcon()`, `setContentTitle()`, `setContentText()`, `setSubText()`, `setRemoteInputHistory()`, `setNumber()`, `setContentInfo()`, `setProgress()`, `setContent()`, `setContentIntent()`, `setDeleteIntent()`, `setFullScreenIntent()`, `setFlag()`, `setTicker()`, `setLargeIcon()`, `reduceLargeIconSize()`, `if()`, `setSound()`, `setVibrate()`, `setLights()`, `setOngoing()`, `setColorized()`, `setOnlyAlertOnce()`, `setAutoCancel()`, `setLocalOnly()`, `setCategory()`, `setDefaults()`, `setPriority()`, `addPerson()`, `setGroup()`, `setGroupSummary()`, `setSortKey()`, `addExtras()`, `setExtras()`, `getExtras()`, `addAction()`, `addInvisibleAction()`, `setStyle()`, `setColor()`, `setVisibility()`, `setPublicVersion()`, `setCustomContentView()`, `setCustomBigContentView()`, `setCustomHeadsUpContentView()`, `setChannelId()`, `setTimeoutAfter()`, `setShortcutId()`, `setBadgeIconType()`, `setGroupAlertBehavior()`, `getNotification()`, `build()`, `NotificationCompatBuilder()`, `limitCharSequenceLength()`, `getContentView()`, `getBigContentView()`, `getHeadsUpContentView()`, `getWhenIfShowing()`, `getPriority()`, `getColor()`, `setBuilder()`, `apply()`, `makeContentView()`, `makeBigContentView()`, `makeHeadsUpContentView()`, `addCompatExtras()`, `restoreFromCompatExtras()`, `applyStandardTemplate()`, `createColoredBitmap()`, `createIconWithBackground()`, `buildIntoRemoteViews()`, `hideNormalContent()`, `calculateTopPadding()`, `constrain()`, `BigPictureStyle()`, `setBigContentTitle()`, `setSummaryText()`, `bigPicture()`, `bigLargeIcon()`, `BigTextStyle()`, `bigText()`, `MessagingStyle()`, `IllegalArgumentException()`, `getUserDisplayName()`, `getUser()`, `setConversationTitle()`, `getConversationTitle()`, `addMessage()`, `getMessages()`, `setGroupConversation()`, `isGroupConversation()`, `extractMessagingStyleFromNotification()`, `for()`, `findLatestIncomingMessage()`, `hasMessagesWithoutSender()`, `makeMessageLine()`, `makeFontColorSpan()`, `TextAppearanceSpan()`, `Message()`, `setData()`, `getText()`, `getTimestamp()`, `getSender()`, `getPerson()`, `getDataMimeType()`, `getDataUri()`, `toBundle()`, `getBundleArrayForMessages()`, `getMessagesFromBundleArray()`, `getMessageFromBundle()`, `InboxStyle()`, `addLine()`, `while()`, `createRemoteViews()`, `generateActionButton()`, `Action()`, `getIcon()`, `getTitle()`, `getActionIntent()`, `getAllowGeneratedReplies()`, `getRemoteInputs()`, `getSemanticAction()`, `getDataOnlyRemoteInputs()`, `getShowsUserInterface()`, `addRemoteInput()`, `setAllowGeneratedReplies()`, `setSemanticAction()`, `setShowsUserInterface()`, `WearableExtender()`, `m1clone()`, `setAvailableOffline()`, `isAvailableOffline()`, `return()`, `setInProgressLabel()`, `getInProgressLabel()`, `setConfirmLabel()`, `getConfirmLabel()`, `setCancelLabel()`, `getCancelLabel()`, `setHintLaunchesActivity()`, `getHintLaunchesActivity()`, `setHintDisplayActionInline()`, `getHintDisplayActionInline()`, `getActionFromActionCompat()`, `m2clone()`, `addActions()`, `clearActions()`, `getActions()`, `setDisplayIntent()`, `getDisplayIntent()`, `addPage()`, `addPages()`, `clearPages()`, `getPages()`, `setBackground()`, `getBackground()`, `setContentIcon()`, `getContentIcon()`, `setContentIconGravity()`, `getContentIconGravity()`, `setContentAction()`, `getContentAction()`, `setGravity()`, `getGravity()`, `setCustomSizePreset()`, `getCustomSizePreset()`, `setCustomContentHeight()`, `getCustomContentHeight()`, `setStartScrollBottom()`, `getStartScrollBottom()`, `setContentIntentAvailableOffline()`, `getContentIntentAvailableOffline()`, `setHintHideIcon()`, `getHintHideIcon()`, `setHintShowBackgroundOnly()`, `getHintShowBackgroundOnly()`, `setHintAvoidBackgroundClipping()`, `getHintAvoidBackgroundClipping()`, `setHintScreenTimeout()`, `getHintScreenTimeout()`, `setHintAmbientBigPicture()`, `getHintAmbientBigPicture()`, `setHintContentIntentLaunchesActivity()`, `getHintContentIntentLaunchesActivity()`, `setDismissalId()`, `getDismissalId()`, `setBridgeTag()`, `getBridgeTag()`, `CarExtender()`, `getUnreadConversationFromBundle()`, `UnreadConversation()`, `getBundleForUnreadConversation()`, `getLargeIcon()`, `setUnreadConversation()`, `getUnreadConversation()`, `getRemoteInput()`, `getReplyPendingIntent()`, `getReadPendingIntent()`, `getParticipants()`, `getParticipant()`, `getLatestTimestamp()`, `setReplyAction()`, `setReadPendingIntent()`, `setLatestTimestamp()`, `getNotificationArrayFromBundle()`, `getActionCount()`, `getAction()`, `getActionCompatFromAction()`, `getInvisibleActions()`, `getContentTitle()`, `getCategory()`, `getLocalOnly()`, `getGroup()`, `isGroupSummary()`, `getSortKey()`, `getChannelId()`, `getTimeoutAfter()`, `getBadgeIconType()`, `getShortcutId()`, `getGroupAlertBehavior()`, `NotificationCompat()`
- **`NotificationCompatBuilder`** — 9 function(s): `NotificationCompatBuilder()`, `if()`, `while()`, `addAction()`, `for()`, `getBuilder()`, `build()`, `buildInternal()`, `removeSoundAndVibration()`
- **`NotificationCompatExtras`** — 1 function(s): `NotificationCompatExtras()`
- **`NotificationCompatJellybean`** — 22 function(s): `buildActionExtrasMap()`, `for()`, `if()`, `getExtras()`, `synchronized()`, `readAction()`, `writeActionAndGetExtras()`, `getActionCount()`, `getAction()`, `getActionObjectsLocked()`, `return()`, `ensureActionReflectionReadyLocked()`, `getActionFromBundle()`, `getBundleForAction()`, `fromBundle()`, `while()`, `RemoteInput()`, `toBundle()`, `fromBundleArray()`, `toBundleArray()`, `getBundleArrayFromBundle()`, `NotificationCompatJellybean()`
- **`NotificationCompatSideChannelService`** — 10 function(s): `cancel()`, `cancelAll()`, `notify()`, `onBind()`, `if()`, `NotificationSideChannelStub()`, `restoreCallingIdentity()`, `checkPermission()`, `for()`, `SecurityException()`
- **`NotificationManagerCompat`** — 35 function(s): `send()`, `from()`, `NotificationManagerCompat()`, `cancel()`, `if()`, `pushSideChannelQueue()`, `cancelAll()`, `notify()`, `areNotificationsEnabled()`, `return()`, `getImportance()`, `getEnabledListenerPackages()`, `synchronized()`, `for()`, `useSideChannelForNotification()`, `SideChannelManager()`, `queueTask()`, `handleMessage()`, `handleQueueTask()`, `handleServiceConnected()`, `handleServiceDisconnected()`, `handleRetryListenerQueue()`, `updateListenerMap()`, `processListenerQueue()`, `ensureServiceUnbound()`, `onServiceConnected()`, `onServiceDisconnected()`, `while()`, `ensureServiceBound()`, `scheduleListenerRetry()`, `ListenerRecord()`, `ServiceConnectedEvent()`, `NotifyTask()`, `toString()`, `CancelTask()`
- **`OneShotPreDrawListener`** — 7 function(s): `OneShotPreDrawListener()`, `add()`, `onPreDraw()`, `removeListener()`, `if()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`
- **`Person`** — 20 function(s): `fromBundle()`, `Builder()`, `fromAndroidPerson()`, `toBundle()`, `toBuilder()`, `toAndroidPerson()`, `getName()`, `getIcon()`, `getUri()`, `getKey()`, `isBot()`, `isImportant()`, `setName()`, `setIcon()`, `setUri()`, `setKey()`, `setBot()`, `setImportant()`, `build()`, `Person()`
- **`RemoteInput`** — 26 function(s): `RemoteInput()`, `getResultKey()`, `getLabel()`, `getChoices()`, `getAllowedDataTypes()`, `isDataOnly()`, `return()`, `getAllowFreeFormInput()`, `getExtras()`, `Builder()`, `if()`, `IllegalArgumentException()`, `setLabel()`, `setChoices()`, `setAllowDataType()`, `setAllowFreeFormInput()`, `addExtras()`, `build()`, `getDataResultsFromIntent()`, `for()`, `getResultsFromIntent()`, `addResultsToIntent()`, `addDataResultToIntent()`, `getExtraResultsKeyForData()`, `fromCompat()`, `getClipDataIntentFromIntent()`
- **`ServiceCompat`** — 3 function(s): `ServiceCompat()`, `stopForeground()`, `if()`
- **`ShareCompat`** — 46 function(s): `ShareCompat()`, `getCallingPackage()`, `if()`, `getCallingActivity()`, `return()`, `configureMenuItem()`, `IllegalArgumentException()`, `from()`, `IntentBuilder()`, `getIntent()`, `combineArrayExtra()`, `getActivity()`, `createChooserIntent()`, `startChooser()`, `setChooserTitle()`, `setType()`, `setText()`, `setHtmlText()`, `setStream()`, `addStream()`, `setEmailTo()`, `addEmailTo()`, `setEmailCc()`, `addEmailCc()`, `setEmailBcc()`, `addEmailBcc()`, `setSubject()`, `IntentReader()`, `isShareIntent()`, `isSingleShare()`, `isMultipleShare()`, `getType()`, `getText()`, `getHtmlText()`, `withinStyle()`, `while()`, `getStream()`, `IndexOutOfBoundsException()`, `getStreamCount()`, `getEmailTo()`, `getEmailCc()`, `getEmailBcc()`, `getSubject()`, `getCallingActivityIcon()`, `getCallingApplicationIcon()`, `getCallingApplicationLabel()`
- **`SharedElementCallback`** — 11 function(s): `onSharedElementsReady()`, `onSharedElementStart()`, `onSharedElementEnd()`, `onRejectSharedElements()`, `onMapSharedElements()`, `onCaptureSharedElementSnapshot()`, `if()`, `createDrawableBitmap()`, `return()`, `onCreateSnapshotView()`, `onSharedElementsArrived()`
- **`SuperNotCalledException`** — 2 function(s): `SuperNotCalledException()`, `super()`
- **`SupportActivity`** — 10 function(s): `putExtraData()`, `onCreate()`, `onSaveInstanceState()`, `getExtraData()`, `return()`, `getLifecycle()`, `superDispatchKeyEvent()`, `dispatchKeyShortcutEvent()`, `if()`, `dispatchKeyEvent()`
- **`TaskStackBuilder`** — 19 function(s): `getSupportParentActivityIntent()`, `TaskStackBuilder()`, `create()`, `from()`, `addNextIntent()`, `addNextIntentWithParentStack()`, `if()`, `addParentStack()`, `while()`, `IllegalArgumentException()`, `getIntentCount()`, `getIntent()`, `editIntentAt()`, `iterator()`, `startActivities()`, `IllegalStateException()`, `getPendingIntent()`, `getIntents()`, `for()`

</details>

### Package `android.support.v4.content`  (13 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AsyncTaskLoader` | class | Loader<D> | 230 | 55 |
| `ContentResolverCompat` | class | — | 39 | 6 |
| `ContextCompat` | class | — | 330 | 61 |
| `CursorLoader` | class | AsyncTaskLoader<Cursor> | 202 | 42 |
| `FileProvider` | class | ContentProvider | 324 | 68 |
| `IntentCompat` | class | — | 24 | 3 |
| `Loader` | class | ContentObserver | 245 | 63 |
| `LocalBroadcastManager` | class | — | 304 | 49 |
| `MimeTypeFilter` | class | — | 78 | 24 |
| `ModernAsyncTask` | class | Handler | 253 | 50 |
| `PermissionChecker` | class | — | 61 | 14 |
| `SharedPreferencesCompat` | class | — | 49 | 7 |
| `WakefulBroadcastReceiver` | class | BroadcastReceiver | 56 | 8 |

<details>
<summary><b>Function list for <code>android.support.v4.content</code></b> (click to expand)</summary>

- **`AsyncTaskLoader`** — 28 function(s): `loadInBackground()`, `LoadTask()`, `doInBackground()`, `return()`, `if()`, `onPostExecute()`, `onCancelled()`, `run()`, `waitForLoader()`, `AsyncTaskLoader()`, `this()`, `super()`, `setUpdateThrottle()`, `onForceLoad()`, `cancelLoad()`, `executePendingTask()`, `onCancelLoad()`, `cancelLoadInBackground()`, `onCanceled()`, `dispatchOnCancelled()`, `rollbackContentChanged()`, `deliverCancellation()`, `dispatchOnLoadComplete()`, `commitContentChanged()`, `deliverResult()`, `onLoadInBackground()`, `isLoadInBackgroundCanceled()`, `dump()`
- **`ContentResolverCompat`** — 3 function(s): `ContentResolverCompat()`, `query()`, `if()`
- **`ContextCompat`** — 26 function(s): `startActivities()`, `if()`, `startActivity()`, `getDataDir()`, `File()`, `getObbDirs()`, `getExternalFilesDirs()`, `getExternalCacheDirs()`, `buildPath()`, `for()`, `getDrawable()`, `synchronized()`, `getColorStateList()`, `getColor()`, `checkSelfPermission()`, `IllegalArgumentException()`, `getNoBackupFilesDir()`, `createFilesDir()`, `getCodeCacheDir()`, `createDeviceProtectedStorageContext()`, `isDeviceProtectedStorage()`, `startForegroundService()`, `getSystemService()`, `return()`, `getSystemServiceName()`, `LegacyServiceMapHolder()`
- **`CursorLoader`** — 25 function(s): `loadInBackground()`, `synchronized()`, `if()`, `OperationCanceledException()`, `cancelLoadInBackground()`, `deliverResult()`, `CursorLoader()`, `super()`, `onStartLoading()`, `forceLoad()`, `onStopLoading()`, `cancelLoad()`, `onCanceled()`, `onReset()`, `getUri()`, `setUri()`, `getProjection()`, `setProjection()`, `getSelection()`, `setSelection()`, `getSelectionArgs()`, `setSelectionArgs()`, `getSortOrder()`, `setSortOrder()`, `dump()`
- **`FileProvider`** — 24 function(s): `getFileForUri()`, `getUriForFile()`, `onCreate()`, `attachInfo()`, `if()`, `SecurityException()`, `query()`, `for()`, `getType()`, `insert()`, `UnsupportedOperationException()`, `update()`, `delete()`, `openFile()`, `getPathStrategy()`, `synchronized()`, `IllegalArgumentException()`, `parsePathStrategy()`, `while()`, `SimplePathStrategy()`, `addRoot()`, `modeToMode()`, `buildPath()`, `copyOf()`
- **`IntentCompat`** — 3 function(s): `IntentCompat()`, `makeMainSelectorActivity()`, `if()`
- **`Loader`** — 40 function(s): `onLoadCanceled()`, `onLoadComplete()`, `ForceLoadContentObserver()`, `super()`, `deliverSelfNotifications()`, `onChange()`, `Loader()`, `deliverResult()`, `if()`, `deliverCancellation()`, `getContext()`, `getId()`, `registerListener()`, `IllegalStateException()`, `unregisterListener()`, `IllegalArgumentException()`, `registerOnLoadCanceledListener()`, `unregisterOnLoadCanceledListener()`, `isStarted()`, `isAbandoned()`, `isReset()`, `startLoading()`, `onStartLoading()`, `cancelLoad()`, `onCancelLoad()`, `forceLoad()`, `onForceLoad()`, `stopLoading()`, `onStopLoading()`, `abandon()`, `onAbandon()`, `reset()`, `onReset()`, `takeContentChanged()`, `commitContentChanged()`, `rollbackContentChanged()`, `onContentChanged()`, `dataToString()`, `toString()`, `dump()`
- **`LocalBroadcastManager`** — 16 function(s): `ReceiverRecord()`, `toString()`, `if()`, `BroadcastRecord()`, `getInstance()`, `synchronized()`, `LocalBroadcastManager()`, `handleMessage()`, `registerReceiver()`, `for()`, `unregisterReceiver()`, `sendBroadcast()`, `while()`, `sendBroadcastSync()`, `executePendingBroadcasts()`, `UnsupportedOperationException()`
- **`MimeTypeFilter`** — 8 function(s): `MimeTypeFilter()`, `mimeTypeAgainstFilter()`, `if()`, `IllegalArgumentException()`, `matches()`, `for()`, `matchesMany()`, `return()`
- **`ModernAsyncTask`** — 30 function(s): `newThread()`, `Thread()`, `call()`, `done()`, `RuntimeException()`, `doInBackground()`, `getHandler()`, `synchronized()`, `if()`, `setDefaultExecutor()`, `postResultIfNotInvoked()`, `postResult()`, `getStatus()`, `onPreExecute()`, `onPostExecute()`, `onProgressUpdate()`, `onCancelled()`, `isCancelled()`, `cancel()`, `get()`, `execute()`, `executeOnExecutor()`, `IllegalStateException()`, `publishProgress()`, `finish()`, `InternalHandler()`, `super()`, `handleMessage()`, `WorkerRunnable()`, `AsyncTaskResult()`
- **`PermissionChecker`** — 6 function(s): `PermissionChecker()`, `checkPermission()`, `if()`, `checkSelfPermission()`, `checkCallingPermission()`, `checkCallingOrSelfPermission()`
- **`SharedPreferencesCompat`** — 6 function(s): `Helper()`, `apply()`, `EditorCompat()`, `getInstance()`, `if()`, `SharedPreferencesCompat()`
- **`WakefulBroadcastReceiver`** — 4 function(s): `startWakefulService()`, `synchronized()`, `if()`, `completeWakefulIntent()`

</details>

### Package `android.support.v4.content.pm`  (5 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ActivityInfoCompat` | class | — | 13 | 1 |
| `PackageInfoCompat` | class | — | 18 | 3 |
| `PermissionInfoCompat` | class | — | 38 | 5 |
| `ShortcutInfoCompat` | class | — | 159 | 33 |
| `ShortcutManagerCompat` | class | — | 72 | 16 |

<details>
<summary><b>Function list for <code>android.support.v4.content.pm</code></b> (click to expand)</summary>

- **`ActivityInfoCompat`** — 1 function(s): `ActivityInfoCompat()`
- **`PackageInfoCompat`** — 3 function(s): `getLongVersionCode()`, `if()`, `PackageInfoCompat()`
- **`PermissionInfoCompat`** — 4 function(s): `PermissionInfoCompat()`, `getProtection()`, `if()`, `getProtectionFlags()`
- **`ShortcutInfoCompat`** — 22 function(s): `toShortcutInfo()`, `if()`, `addToIntent()`, `getId()`, `getActivity()`, `getShortLabel()`, `getLongLabel()`, `getDisabledMessage()`, `getIntent()`, `getIntents()`, `return()`, `Builder()`, `setShortLabel()`, `setLongLabel()`, `setDisabledMessage()`, `setIntent()`, `setIntents()`, `setIcon()`, `setActivity()`, `setAlwaysBadged()`, `build()`, `IllegalArgumentException()`
- **`ShortcutManagerCompat`** — 8 function(s): `ShortcutManagerCompat()`, `isRequestPinShortcutSupported()`, `if()`, `return()`, `for()`, `requestPinShortcut()`, `onReceive()`, `createShortcutResultIntent()`

</details>

### Package `android.support.v4.content.res`  (8 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ColorStateListInflaterCompat` | class | — | 119 | 22 |
| `ComplexColorCompat` | class | — | 118 | 30 |
| `ConfigurationHelper` | class | — | 18 | 3 |
| `FontResourcesParserCompat` | class | FamilyResourceEntry | 257 | 51 |
| `GradientColorInflaterCompat` | class | — | 158 | 32 |
| `GrowingArrayUtils` | class | — | 113 | 19 |
| `ResourcesCompat` | class | — | 238 | 46 |
| `TypedArrayUtils` | class | — | 156 | 35 |

<details>
<summary><b>Function list for <code>android.support.v4.content.res</code></b> (click to expand)</summary>

- **`ColorStateListInflaterCompat`** — 11 function(s): `ColorStateListInflaterCompat()`, `createFromXml()`, `if()`, `XmlPullParserException()`, `createFromXmlInner()`, `inflate()`, `while()`, `ColorStateList()`, `obtainAttributes()`, `modulateColorAlpha()`, `return()`
- **`ComplexColorCompat`** — 13 function(s): `ComplexColorCompat()`, `from()`, `getShader()`, `getColor()`, `setColor()`, `isGradient()`, `isStateful()`, `onStateChanged()`, `if()`, `willDraw()`, `inflate()`, `createFromXml()`, `XmlPullParserException()`
- **`ConfigurationHelper`** — 3 function(s): `ConfigurationHelper()`, `getDensityDpi()`, `if()`
- **`FontResourcesParserCompat`** — 26 function(s): `ProviderResourceEntry()`, `getRequest()`, `getFetchStrategy()`, `getTimeout()`, `FontFileResourceEntry()`, `getFileName()`, `getWeight()`, `isItalic()`, `getVariationSettings()`, `getTtcIndex()`, `getResourceId()`, `FontFamilyFilesResourceEntry()`, `getEntries()`, `parse()`, `if()`, `XmlPullParserException()`, `readFamilies()`, `readFamily()`, `skip()`, `while()`, `getType()`, `readCerts()`, `for()`, `toByteArrayList()`, `readFont()`, `FontResourcesParserCompat()`
- **`GradientColorInflaterCompat`** — 12 function(s): `GradientColorInflaterCompat()`, `createFromXml()`, `if()`, `XmlPullParserException()`, `createFromXmlInner()`, `RadialGradient()`, `inflateChildElements()`, `while()`, `ColorStops()`, `checkColors()`, `parseTileMode()`, `for()`
- **`GrowingArrayUtils`** — 5 function(s): `append()`, `if()`, `insert()`, `growSize()`, `GrowingArrayUtils()`
- **`ResourcesCompat`** — 13 function(s): `getDrawable()`, `if()`, `getDrawableForDensity()`, `getColor()`, `getColorStateList()`, `getFont()`, `loadFont()`, `onFontRetrievalFailed()`, `onFontRetrieved()`, `callbackSuccessAsync()`, `run()`, `callbackFailAsync()`, `ResourcesCompat()`
- **`TypedArrayUtils`** — 20 function(s): `hasAttribute()`, `getNamedFloat()`, `if()`, `getNamedBoolean()`, `getNamedInt()`, `getNamedColor()`, `getNamedComplexColor()`, `getNamedResourceId()`, `getNamedString()`, `peekNamedValue()`, `obtainAttributes()`, `getBoolean()`, `getDrawable()`, `getInt()`, `getResourceId()`, `getString()`, `getText()`, `getTextArray()`, `getAttr()`, `TypedArrayUtils()`

</details>

### Package `android.support.v4.database`  (2 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CursorWindowCompat` | class | — | 21 | 7 |
| `DatabaseUtilsCompat` | class | — | 33 | 6 |

<details>
<summary><b>Function list for <code>android.support.v4.database</code></b> (click to expand)</summary>

- **`CursorWindowCompat`** — 4 function(s): `CursorWindowCompat()`, `create()`, `if()`, `CursorWindow()`
- **`DatabaseUtilsCompat`** — 4 function(s): `DatabaseUtilsCompat()`, `concatenateWhere()`, `if()`, `appendSelectionArgs()`

</details>

### Package `android.support.v4.database.sqlite`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `SQLiteCursorCompat` | class | — | 17 | 3 |

<details>
<summary><b>Function list for <code>android.support.v4.database.sqlite</code></b> (click to expand)</summary>

- **`SQLiteCursorCompat`** — 3 function(s): `SQLiteCursorCompat()`, `setFillWindowForwardOnly()`, `if()`

</details>

### Package `android.support.v4.graphics`  (13 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BitmapCompat` | class | — | 31 | 7 |
| `ColorUtils` | class | — | 328 | 70 |
| `PaintCompat` | class | — | 67 | 12 |
| `PathParser` | class | — | 601 | 79 |
| `PathSegment` | class | — | 61 | 10 |
| `PathUtils` | class | — | 38 | 6 |
| `TypefaceCompat` | class | — | 82 | 12 |
| `TypefaceCompatApi21Impl` | class | TypefaceCompatBaseImpl | 67 | 8 |
| `TypefaceCompatApi24Impl` | class | TypefaceCompatBaseImpl | 187 | 17 |
| `TypefaceCompatApi26Impl` | class | TypefaceCompatApi21Impl | 258 | 49 |
| `TypefaceCompatApi28Impl` | class | TypefaceCompatApi26Impl | 34 | 4 |
| `TypefaceCompatBaseImpl` | class | — | 130 | 24 |
| `TypefaceCompatUtil` | class | — | 145 | 21 |

<details>
<summary><b>Function list for <code>android.support.v4.graphics</code></b> (click to expand)</summary>

- **`BitmapCompat`** — 5 function(s): `hasMipMap()`, `if()`, `setHasMipMap()`, `getAllocationByteCount()`, `BitmapCompat()`
- **`ColorUtils`** — 32 function(s): `ColorUtils()`, `compositeColors()`, `if()`, `IllegalArgumentException()`, `for()`, `compositeAlpha()`, `compositeComponent()`, `return()`, `calculateLuminance()`, `colorToXYZ()`, `calculateContrast()`, `calculateMinimumAlpha()`, `RGBToHSL()`, `colorToHSL()`, `HSLToColor()`, `switch()`, `setAlphaComponent()`, `colorToLAB()`, `RGBToLAB()`, `RGBToXYZ()`, `XYZToLAB()`, `LABToXYZ()`, `XYZToColor()`, `LABToColor()`, `distanceEuclidean()`, `constrain()`, `pivotXyzComponent()`, `blendARGB()`, `blendHSL()`, `blendLAB()`, `circularInterpolate()`, `getTempDouble3Array()`
- **`PaintCompat`** — 5 function(s): `hasGlyph()`, `if()`, `while()`, `obtainEmptyRects()`, `PaintCompat()`
- **`PathParser`** — 26 function(s): `copyOfRange()`, `if()`, `IllegalArgumentException()`, `ArrayIndexOutOfBoundsException()`, `createPathFromPathData()`, `RuntimeException()`, `createNodesFromPathData()`, `while()`, `addNode()`, `return()`, `deepCopyNodes()`, `for()`, `canMorph()`, `updateNodes()`, `nextStart()`, `ExtractFloatResult()`, `getFloats()`, `extract()`, `switch()`, `PathDataNode()`, `nodesToPath()`, `addCommand()`, `interpolatePathDataNode()`, `drawArc()`, `arcToBezier()`, `PathParser()`
- **`PathSegment`** — 9 function(s): `PathSegment()`, `getStart()`, `getStartFraction()`, `getEnd()`, `getEndFraction()`, `equals()`, `if()`, `hashCode()`, `toString()`
- **`PathUtils`** — 4 function(s): `flatten()`, `for()`, `if()`, `PathUtils()`
- **`TypefaceCompat`** — 7 function(s): `if()`, `TypefaceCompat()`, `findFromCache()`, `createResourceUid()`, `createFromResourcesFamilyXml()`, `createFromResourcesFontFile()`, `createFromFontInfo()`
- **`TypefaceCompatApi21Impl`** — 4 function(s): `getFile()`, `if()`, `File()`, `createFromFontInfo()`
- **`TypefaceCompatApi24Impl`** — 10 function(s): `isUsable()`, `if()`, `newFamily()`, `RuntimeException()`, `addFontWeightStyle()`, `createFromFamiliesWithDefault()`, `return()`, `createFromFontInfo()`, `for()`, `createFromFontFamilyFilesResourceEntry()`
- **`TypefaceCompatApi26Impl`** — 23 function(s): `TypefaceCompatApi26Impl()`, `isFontFamilyPrivateAPIAvailable()`, `if()`, `newFamily()`, `RuntimeException()`, `addFontFromAssetManager()`, `addFontFromBuffer()`, `createFromFamiliesWithDefault()`, `return()`, `freeze()`, `abortCreation()`, `createFromFontFamilyFilesResourceEntry()`, `for()`, `createFromFontInfo()`, `while()`, `createFromResourcesFontFile()`, `obtainFontFamily()`, `obtainFontFamilyCtor()`, `obtainAddFontFromAssetManagerMethod()`, `obtainAddFontFromBufferMethod()`, `obtainFreezeMethod()`, `obtainAbortCreationMethod()`, `obtainCreateFromFamiliesWithDefaultMethod()`
- **`TypefaceCompatApi28Impl`** — 4 function(s): `createFromFamiliesWithDefault()`, `return()`, `RuntimeException()`, `obtainCreateFromFamiliesWithDefaultMethod()`
- **`TypefaceCompatBaseImpl`** — 12 function(s): `getWeight()`, `isItalic()`, `findBestFont()`, `for()`, `if()`, `findBestInfo()`, `return()`, `createFromInputStream()`, `createFromFontInfo()`, `findBestEntry()`, `createFromFontFamilyFilesResourceEntry()`, `createFromResourcesFontFile()`
- **`TypefaceCompatUtil`** — 9 function(s): `TypefaceCompatUtil()`, `getTempFile()`, `for()`, `if()`, `mmap()`, `copyToDirectBuffer()`, `copyToFile()`, `while()`, `closeQuietly()`

</details>

### Package `android.support.v4.graphics.drawable`  (10 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `DrawableCompat` | class | — | 238 | 59 |
| `IconCompat` | class | CustomVersionedParcelable | 726 | 167 |
| `IconCompatParcelizer` | class | androidx.core.graphics.drawable.IconCompatParcelizer | 15 | 2 |
| `RoundedBitmapDrawable` | class | Drawable | 260 | 70 |
| `RoundedBitmapDrawable21` | class | RoundedBitmapDrawable | 40 | 9 |
| `RoundedBitmapDrawableFactory` | class | RoundedBitmapDrawable | 69 | 16 |
| `TintAwareDrawable` | class | — | 14 | 3 |
| `WrappedDrawable` | class | — | 11 | 2 |
| `WrappedDrawableApi14` | class | Drawable implements Drawable.Callback, WrappedDrawable, TintAwareDrawable | 339 | 81 |
| `WrappedDrawableApi21` | class | WrappedDrawableApi14 | 140 | 32 |

<details>
<summary><b>Function list for <code>android.support.v4.graphics.drawable</code></b> (click to expand)</summary>

- **`DrawableCompat`** — 24 function(s): `jumpToCurrentState()`, `setAutoMirrored()`, `if()`, `isAutoMirrored()`, `setHotspot()`, `setHotspotBounds()`, `setTint()`, `setTintList()`, `setTintMode()`, `getAlpha()`, `applyTheme()`, `canApplyTheme()`, `getColorFilter()`, `clearColorFilter()`, `for()`, `inflate()`, `wrap()`, `WrappedDrawableApi21()`, `WrappedDrawableApi14()`, `unwrap()`, `return()`, `setLayoutDirection()`, `getLayoutDirection()`, `DrawableCompat()`
- **`IconCompat`** — 32 function(s): `createWithResource()`, `if()`, `IllegalArgumentException()`, `createWithBitmap()`, `createWithAdaptiveBitmap()`, `createWithData()`, `createWithContentUri()`, `IconCompat()`, `getType()`, `getResPackage()`, `IllegalStateException()`, `return()`, `getResId()`, `getUri()`, `setTint()`, `setTintList()`, `setTintMode()`, `toIcon()`, `checkResource()`, `loadDrawable()`, `loadDrawableInner()`, `BitmapDrawable()`, `getResources()`, `addToShortcutIntent()`, `toBundle()`, `toString()`, `onPreParceling()`, `onPostParceling()`, `typeToString()`, `createFromBundle()`, `createFromIcon()`, `createLegacyIconFromAdaptiveIcon()`
- **`IconCompatParcelizer`** — 2 function(s): `read()`, `write()`
- **`RoundedBitmapDrawable`** — 34 function(s): `getPaint()`, `getBitmap()`, `computeBitmapSize()`, `setTargetDensity()`, `if()`, `invalidateSelf()`, `getGravity()`, `setGravity()`, `setMipMap()`, `UnsupportedOperationException()`, `hasMipMap()`, `setAntiAlias()`, `hasAntiAlias()`, `setFilterBitmap()`, `setDither()`, `gravityCompatApply()`, `updateDstRect()`, `draw()`, `setAlpha()`, `getAlpha()`, `setColorFilter()`, `getColorFilter()`, `setCircular()`, `updateCircularCornerRadius()`, `setCornerRadius()`, `isCircular()`, `onBoundsChange()`, `getCornerRadius()`, `getIntrinsicWidth()`, `getIntrinsicHeight()`, `getOpacity()`, `return()`, `RoundedBitmapDrawable()`, `isGreaterThanZero()`
- **`RoundedBitmapDrawable21`** — 9 function(s): `RoundedBitmapDrawable21()`, `super()`, `getOutline()`, `updateDstRect()`, `setMipMap()`, `if()`, `invalidateSelf()`, `hasMipMap()`, `gravityCompatApply()`
- **`RoundedBitmapDrawableFactory`** — 10 function(s): `DefaultRoundedBitmapDrawable()`, `super()`, `setMipMap()`, `if()`, `invalidateSelf()`, `hasMipMap()`, `gravityCompatApply()`, `create()`, `RoundedBitmapDrawable21()`, `RoundedBitmapDrawableFactory()`
- **`TintAwareDrawable`** — 3 function(s): `setTint()`, `setTintList()`, `setTintMode()`
- **`WrappedDrawable`** — 2 function(s): `getWrappedDrawable()`, `setWrappedDrawable()`
- **`WrappedDrawableApi14`** — 52 function(s): `WrappedDrawableApi14()`, `updateLocalState()`, `setWrappedDrawable()`, `if()`, `jumpToCurrentState()`, `draw()`, `onBoundsChange()`, `setChangingConfigurations()`, `getChangingConfigurations()`, `setDither()`, `setFilterBitmap()`, `setAlpha()`, `setColorFilter()`, `isStateful()`, `return()`, `setState()`, `getState()`, `getCurrent()`, `setVisible()`, `getOpacity()`, `getTransparentRegion()`, `getIntrinsicWidth()`, `getIntrinsicHeight()`, `getMinimumWidth()`, `getMinimumHeight()`, `getPadding()`, `setAutoMirrored()`, `isAutoMirrored()`, `getConstantState()`, `mutate()`, `mutateConstantState()`, `DrawableWrapperStateBase()`, `invalidateDrawable()`, `invalidateSelf()`, `scheduleDrawable()`, `scheduleSelf()`, `unscheduleDrawable()`, `unscheduleSelf()`, `onLevelChange()`, `setTint()`, `setTintList()`, `updateTint()`, `setTintMode()`, `clearColorFilter()`, `getWrappedDrawable()`, `setLevel()`, `setBounds()`, `isCompatTintEnabled()`, `newDrawable()`, `DrawableWrapperState()`, `canConstantState()`, `super()`
- **`WrappedDrawableApi21`** — 19 function(s): `WrappedDrawableApi21()`, `super()`, `findAndCacheIsProjectedDrawableMethod()`, `setHotspot()`, `setHotspotBounds()`, `getOutline()`, `getDirtyBounds()`, `setTintList()`, `if()`, `setTint()`, `setTintMode()`, `setState()`, `invalidateSelf()`, `isCompatTintEnabled()`, `return()`, `isProjected()`, `mutateConstantState()`, `DrawableWrapperStateLollipop()`, `newDrawable()`

</details>

### Package `android.support.v4.hardware.display`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `DisplayManagerCompat` | class | — | 62 | 15 |

<details>
<summary><b>Function list for <code>android.support.v4.hardware.display</code></b> (click to expand)</summary>

- **`DisplayManagerCompat`** — 7 function(s): `DisplayManagerCompat()`, `getInstance()`, `synchronized()`, `if()`, `getDisplay()`, `return()`, `getDisplays()`

</details>

### Package `android.support.v4.hardware.fingerprint`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `FingerprintManagerCompat` | class | — | 170 | 40 |

<details>
<summary><b>Function list for <code>android.support.v4.hardware.fingerprint</code></b> (click to expand)</summary>

- **`FingerprintManagerCompat`** — 21 function(s): `from()`, `FingerprintManagerCompat()`, `hasEnrolledFingerprints()`, `isHardwareDetected()`, `authenticate()`, `if()`, `getFingerprintManagerOrNull()`, `return()`, `wrapCryptoObject()`, `unwrapCryptoObject()`, `CryptoObject()`, `wrapCallback()`, `onAuthenticationError()`, `onAuthenticationHelp()`, `onAuthenticationSucceeded()`, `onAuthenticationFailed()`, `getSignature()`, `getCipher()`, `getMac()`, `AuthenticationResult()`, `getCryptoObject()`

</details>

### Package `android.support.v4.internal.view`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `SupportMenu` | class | Menu | 17 | 1 |
| `SupportMenuItem` | class | MenuItem | 84 | 23 |
| `SupportSubMenu` | class | SupportMenu, SubMenu | 8 | 0 |

<details>
<summary><b>Function list for <code>android.support.v4.internal.view</code></b> (click to expand)</summary>

- **`SupportMenu`** — 1 function(s): `setGroupDividerEnabled()`
- **`SupportMenuItem`** — 22 function(s): `collapseActionView()`, `expandActionView()`, `getActionView()`, `getAlphabeticModifiers()`, `getContentDescription()`, `getIconTintList()`, `getIconTintMode()`, `getNumericModifiers()`, `getSupportActionProvider()`, `getTooltipText()`, `isActionViewExpanded()`, `setActionView()`, `setAlphabeticShortcut()`, `setContentDescription()`, `setIconTintList()`, `setIconTintMode()`, `setNumericShortcut()`, `setShortcut()`, `setShowAsAction()`, `setShowAsActionFlags()`, `setSupportActionProvider()`, `setTooltipText()`

</details>

### Package `android.support.v4.math`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `MathUtils` | class | — | 38 | 10 |

<details>
<summary><b>Function list for <code>android.support.v4.math</code></b> (click to expand)</summary>

- **`MathUtils`** — 3 function(s): `MathUtils()`, `clamp()`, `if()`

</details>

### Package `android.support.v4.net`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ConnectivityManagerCompat` | class | — | 66 | 9 |
| `DatagramSocketWrapper` | class | Socket | 99 | 31 |
| `TrafficStatsCompat` | class | — | 70 | 12 |

<details>
<summary><b>Function list for <code>android.support.v4.net</code></b> (click to expand)</summary>

- **`ConnectivityManagerCompat`** — 6 function(s): `isActiveNetworkMetered()`, `if()`, `switch()`, `getNetworkInfoFromBroadcast()`, `getRestrictBackgroundStatus()`, `ConnectivityManagerCompat()`
- **`DatagramSocketWrapper`** — 16 function(s): `DatagramSocketWrapper()`, `super()`, `DatagramSocketImplWrapper()`, `accept()`, `UnsupportedOperationException()`, `available()`, `bind()`, `close()`, `connect()`, `create()`, `getInputStream()`, `getOutputStream()`, `listen()`, `sendUrgentData()`, `getOption()`, `setOption()`
- **`TrafficStatsCompat`** — 10 function(s): `clearThreadStatsTag()`, `getThreadStatsTag()`, `incrementOperationCount()`, `setThreadStatsTag()`, `tagSocket()`, `untagSocket()`, `tagDatagramSocket()`, `if()`, `untagDatagramSocket()`, `TrafficStatsCompat()`

</details>

### Package `android.support.v4.os`  (17 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BuildCompat` | class | — | 39 | 7 |
| `CancellationSignal` | class | — | 113 | 28 |
| `ConfigurationCompat` | class | — | 15 | 2 |
| `EnvironmentCompat` | class | — | 34 | 4 |
| `HandlerCompat` | class | — | 21 | 3 |
| `IResultReceiver` | class | IInterface | 97 | 19 |
| `LocaleHelper` | class | — | 52 | 19 |
| `LocaleListCompat` | class | LocaleListInterface | 258 | 53 |
| `LocaleListHelper` | class | — | 393 | 105 |
| `LocaleListInterface` | class | — | 29 | 11 |
| `OperationCanceledException` | class | RuntimeException | 13 | 4 |
| `ParcelCompat` | class | — | 18 | 3 |
| `ParcelableCompat` | class | Parcelable.ClassLoaderCreator<T> | 41 | 7 |
| `ParcelableCompatCreatorCallbacks` | class | — | 12 | 2 |
| `ResultReceiver` | class | Parcelable | 109 | 19 |
| `TraceCompat` | class | — | 23 | 5 |
| `UserManagerCompat` | class | — | 19 | 4 |

<details>
<summary><b>Function list for <code>android.support.v4.os</code></b> (click to expand)</summary>

- **`BuildCompat`** — 7 function(s): `BuildCompat()`, `isAtLeastN()`, `isAtLeastNMR1()`, `isAtLeastO()`, `isAtLeastOMR1()`, `isAtLeastP()`, `isAtLeastQ()`
- **`CancellationSignal`** — 13 function(s): `onCancel()`, `isCanceled()`, `synchronized()`, `throwIfCanceled()`, `if()`, `OperationCanceledException()`, `cancel()`, `notifyAll()`, `setOnCancelListener()`, `waitForCancelFinishedLocked()`, `getCancellationSignalObject()`, `while()`, `wait()`
- **`ConfigurationCompat`** — 2 function(s): `ConfigurationCompat()`, `getLocales()`
- **`EnvironmentCompat`** — 3 function(s): `getStorageState()`, `if()`, `EnvironmentCompat()`
- **`HandlerCompat`** — 3 function(s): `postDelayed()`, `if()`, `HandlerCompat()`
- **`IResultReceiver`** — 10 function(s): `send()`, `Stub()`, `attachInterface()`, `asInterface()`, `if()`, `return()`, `Proxy()`, `asBinder()`, `onTransact()`, `getInterfaceDescriptor()`
- **`LocaleHelper`** — 6 function(s): `forLanguageTag()`, `if()`, `Locale()`, `IllegalArgumentException()`, `toLanguageTag()`, `LocaleHelper()`
- **`LocaleListCompat`** — 24 function(s): `if()`, `LocaleListCompatBaseImpl()`, `setLocaleList()`, `getLocaleList()`, `get()`, `isEmpty()`, `size()`, `indexOf()`, `equals()`, `hashCode()`, `toString()`, `toLanguageTags()`, `getFirstMatch()`, `LocaleListCompatApi24Impl()`, `LocaleListCompat()`, `wrap()`, `unwrap()`, `create()`, `getEmptyLocaleList()`, `forLanguageTags()`, `for()`, `getAdjustedDefault()`, `getDefault()`, `setLocaleListArray()`
- **`LocaleListHelper`** — 32 function(s): `get()`, `if()`, `isEmpty()`, `size()`, `indexOf()`, `while()`, `equals()`, `hashCode()`, `toString()`, `toLanguageTags()`, `LocaleListHelper()`, `for()`, `NullPointerException()`, `IllegalArgumentException()`, `getEmptyLocaleList()`, `forLanguageTags()`, `getLikelyScript()`, `isPseudoLocale()`, `matchScore()`, `return()`, `findFirstMatchIndex()`, `computeFirstMatchIndex()`, `computeFirstMatch()`, `getFirstMatch()`, `getFirstMatchIndex()`, `getFirstMatchWithEnglishSupported()`, `getFirstMatchIndexWithEnglishSupported()`, `isPseudoLocalesOnly()`, `getDefault()`, `synchronized()`, `getAdjustedDefault()`, `setDefault()`
- **`LocaleListInterface`** — 11 function(s): `equals()`, `get()`, `getFirstMatch()`, `getLocaleList()`, `hashCode()`, `indexOf()`, `isEmpty()`, `setLocaleList()`, `size()`, `toLanguageTags()`, `toString()`
- **`OperationCanceledException`** — 3 function(s): `OperationCanceledException()`, `this()`, `super()`
- **`ParcelCompat`** — 3 function(s): `readBoolean()`, `writeBoolean()`, `ParcelCompat()`
- **`ParcelableCompat`** — 5 function(s): `newCreator()`, `ParcelableCompatCreatorHoneycombMR2()`, `createFromParcel()`, `newArray()`, `ParcelableCompat()`
- **`ParcelableCompatCreatorCallbacks`** — 2 function(s): `createFromParcel()`, `newArray()`
- **`ResultReceiver`** — 12 function(s): `createFromParcel()`, `ResultReceiver()`, `newArray()`, `MyRunnable()`, `run()`, `MyResultReceiver()`, `send()`, `if()`, `onReceiveResult()`, `describeContents()`, `writeToParcel()`, `synchronized()`
- **`TraceCompat`** — 4 function(s): `beginSection()`, `if()`, `endSection()`, `TraceCompat()`
- **`UserManagerCompat`** — 4 function(s): `UserManagerCompat()`, `isUserUnlocked()`, `if()`, `return()`

</details>

### Package `android.support.v4.print`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `PrintHelper` | class | PrintDocumentAdapter | 530 | 88 |

<details>
<summary><b>Function list for <code>android.support.v4.print</code></b> (click to expand)</summary>

- **`PrintHelper`** — 32 function(s): `onFinish()`, `systemSupportsPrint()`, `PrintHelper()`, `setScaleMode()`, `getScaleMode()`, `setColorMode()`, `getColorMode()`, `setOrientation()`, `getOrientation()`, `if()`, `printBitmap()`, `PrintBitmapAdapter()`, `onLayout()`, `onWrite()`, `PrintUriAdapter()`, `synchronized()`, `onPreExecute()`, `onCancel()`, `cancel()`, `doInBackground()`, `onPostExecute()`, `while()`, `onCancelled()`, `cancelLoad()`, `isPortrait()`, `copyAttributes()`, `getMatrix()`, `writeBitmap()`, `loadConstrainedBitmap()`, `IllegalArgumentException()`, `loadBitmap()`, `convertBitmapForColorMode()`

</details>

### Package `android.support.v4.provider`  (8 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `DocumentFile` | class | — | 89 | 31 |
| `DocumentsContractApi19` | class | — | 142 | 36 |
| `FontRequest` | class | — | 78 | 11 |
| `FontsContractCompat` | class | BaseColumns | 501 | 90 |
| `RawDocumentFile` | class | DocumentFile | 161 | 37 |
| `SelfDestructiveThread` | class | — | 163 | 27 |
| `SingleDocumentFile` | class | DocumentFile | 103 | 22 |
| `TreeDocumentFile` | class | DocumentFile | 167 | 29 |

<details>
<summary><b>Function list for <code>android.support.v4.provider</code></b> (click to expand)</summary>

- **`DocumentFile`** — 28 function(s): `canRead()`, `canWrite()`, `createDirectory()`, `createFile()`, `delete()`, `exists()`, `getName()`, `getType()`, `getUri()`, `isDirectory()`, `isFile()`, `isVirtual()`, `lastModified()`, `length()`, `listFiles()`, `renameTo()`, `DocumentFile()`, `fromFile()`, `RawDocumentFile()`, `fromSingleUri()`, `if()`, `SingleDocumentFile()`, `fromTreeUri()`, `TreeDocumentFile()`, `isDocumentUri()`, `getParentFile()`, `findFile()`, `for()`
- **`DocumentsContractApi19`** — 19 function(s): `isVirtual()`, `getName()`, `queryForString()`, `getRawType()`, `getType()`, `if()`, `getFlags()`, `queryForLong()`, `isDirectory()`, `isFile()`, `lastModified()`, `length()`, `canRead()`, `canWrite()`, `return()`, `exists()`, `closeQuietly()`, `queryForInt()`, `DocumentsContractApi19()`
- **`FontRequest`** — 9 function(s): `FontRequest()`, `getProviderAuthority()`, `getProviderPackage()`, `getQuery()`, `getCertificates()`, `getCertificatesArrayResId()`, `getIdentifier()`, `toString()`, `for()`
- **`FontsContractCompat`** — 34 function(s): `compare()`, `if()`, `for()`, `FontsContractCompat()`, `getFontInternal()`, `TypefaceResult()`, `resetCache()`, `getFontSync()`, `call()`, `return()`, `onReply()`, `synchronized()`, `FontInfo()`, `getUri()`, `getTtcIndex()`, `getWeight()`, `isItalic()`, `getResultCode()`, `FontFamilyResult()`, `getStatusCode()`, `getFonts()`, `onTypefaceRetrieved()`, `onTypefaceRequestFailed()`, `requestFont()`, `run()`, `buildTypeface()`, `prepareFontData()`, `fetchFonts()`, `getProvider()`, `getCertificates()`, `equalsByteArrayList()`, `convertToByteArrayList()`, `getFontFromProvider()`, `while()`
- **`RawDocumentFile`** — 23 function(s): `RawDocumentFile()`, `super()`, `createFile()`, `if()`, `createDirectory()`, `getUri()`, `getName()`, `getType()`, `getTypeForName()`, `isDirectory()`, `isFile()`, `isVirtual()`, `lastModified()`, `length()`, `canRead()`, `canWrite()`, `delete()`, `deleteContents()`, `exists()`, `listFiles()`, `for()`, `return()`, `renameTo()`
- **`SelfDestructiveThread`** — 14 function(s): `handleMessage()`, `if()`, `onReply()`, `SelfDestructiveThread()`, `isRunning()`, `synchronized()`, `getGeneration()`, `post()`, `postAndReply()`, `run()`, `postAndWait()`, `InterruptedException()`, `onInvokeRunnable()`, `onDestruction()`
- **`SingleDocumentFile`** — 19 function(s): `SingleDocumentFile()`, `super()`, `createFile()`, `UnsupportedOperationException()`, `createDirectory()`, `getUri()`, `getName()`, `getType()`, `isDirectory()`, `isFile()`, `isVirtual()`, `lastModified()`, `length()`, `canRead()`, `canWrite()`, `delete()`, `exists()`, `listFiles()`, `renameTo()`
- **`TreeDocumentFile`** — 22 function(s): `TreeDocumentFile()`, `super()`, `createFile()`, `if()`, `createDirectory()`, `getUri()`, `getName()`, `getType()`, `isDirectory()`, `isFile()`, `isVirtual()`, `lastModified()`, `length()`, `canRead()`, `canWrite()`, `delete()`, `exists()`, `listFiles()`, `while()`, `for()`, `closeQuietly()`, `renameTo()`

</details>

### Package `android.support.v4.text`  (7 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BidiFormatter` | class | — | 517 | 128 |
| `HtmlCompat` | class | — | 45 | 7 |
| `ICUCompat` | class | — | 91 | 15 |
| `PrecomputedTextCompat` | class | Spannable | 425 | 90 |
| `TextDirectionHeuristicCompat` | class | — | 9 | 2 |
| `TextDirectionHeuristicsCompat` | class | TextDirectionHeuristicCompat | 177 | 39 |
| `TextUtilsCompat` | class | — | 63 | 13 |

<details>
<summary><b>Function list for <code>android.support.v4.text</code></b> (click to expand)</summary>

- **`BidiFormatter`** — 30 function(s): `Builder()`, `initialize()`, `stereoReset()`, `if()`, `setTextDirectionHeuristic()`, `getDefaultInstanceFromContext()`, `build()`, `BidiFormatter()`, `getInstance()`, `isRtlContext()`, `getStereoReset()`, `return()`, `markAfter()`, `markBefore()`, `isRtl()`, `unicodeWrap()`, `isRtlLocale()`, `getExitDir()`, `DirectionalityEstimator()`, `getEntryDir()`, `for()`, `while()`, `switch()`, `getCachedDirectionality()`, `dirTypeForward()`, `skipTagForward()`, `skipEntityForward()`, `dirTypeBackward()`, `skipTagBackward()`, `skipEntityBackward()`
- **`HtmlCompat`** — 4 function(s): `fromHtml()`, `if()`, `toHtml()`, `HtmlCompat()`
- **`ICUCompat`** — 7 function(s): `if()`, `IllegalStateException()`, `maximizeAndGetScript()`, `return()`, `getScript()`, `addLikelySubtags()`, `ICUCompat()`
- **`PrecomputedTextCompat`** — 44 function(s): `Builder()`, `if()`, `setBreakStrategy()`, `setHyphenationFrequency()`, `setTextDirection()`, `build()`, `Params()`, `getTextPaint()`, `getTextDirection()`, `getBreakStrategy()`, `getHyphenationFrequency()`, `equals()`, `hashCode()`, `toString()`, `create()`, `PrecomputedTextCompat()`, `while()`, `for()`, `StaticLayout()`, `getPrecomputedText()`, `return()`, `getParams()`, `getParagraphCount()`, `getParagraphStart()`, `getParagraphEnd()`, `findParaIndex()`, `IndexOutOfBoundsException()`, `PrecomputedTextCallback()`, `call()`, `PrecomputedTextFutureTask()`, `super()`, `getTextFuture()`, `synchronized()`, `setSpan()`, `IllegalArgumentException()`, `removeSpan()`, `getSpans()`, `getSpanStart()`, `getSpanEnd()`, `getSpanFlags()`, `nextSpanTransition()`, `length()`, `charAt()`, `subSequence()`
- **`TextDirectionHeuristicCompat`** — 1 function(s): `isRtl()`
- **`TextDirectionHeuristicsCompat`** — 18 function(s): `checkRtl()`, `isRtlText()`, `if()`, `return()`, `isRtlTextOrFormat()`, `switch()`, `defaultIsRtl()`, `TextDirectionHeuristicImpl()`, `isRtl()`, `IllegalArgumentException()`, `doCheck()`, `TextDirectionHeuristicInternal()`, `super()`, `for()`, `FirstStrong()`, `AnyStrong()`, `TextDirectionHeuristicLocale()`, `TextDirectionHeuristicsCompat()`
- **`TextUtilsCompat`** — 7 function(s): `htmlEncode()`, `if()`, `for()`, `getLayoutDirectionFromLocale()`, `getLayoutDirectionFromFirstChar()`, `return()`, `TextUtilsCompat()`

</details>

### Package `android.support.v4.text.util`  (2 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `FindAddress` | class | — | 237 | 51 |
| `LinkifyCompat` | class | — | 332 | 80 |

<details>
<summary><b>Function list for <code>android.support.v4.text.util</code></b> (click to expand)</summary>

- **`FindAddress`** — 14 function(s): `ZipRange()`, `matches()`, `return()`, `checkHouseNumber()`, `for()`, `if()`, `matchHouseNumber()`, `matchState()`, `isValidZipCode()`, `while()`, `isValidLocationName()`, `attemptMatch()`, `findAddress()`, `FindAddress()`
- **`LinkifyCompat`** — 15 function(s): `compare()`, `if()`, `addLinks()`, `for()`, `gatherLinks()`, `gatherMapLinks()`, `pruneOverlaps()`, `while()`, `applyLink()`, `addLinkMovementMethod()`, `shouldAddLinksFallbackToFramework()`, `makeUrl()`, `findAddress()`, `LinkifyCompat()`, `LinkSpec()`

</details>

### Package `android.support.v4.util`  (20 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ArrayMap` | class | SimpleArrayMap<K, V> implements Map<K, V> | 109 | 29 |
| `ArraySet` | class | Collection<E>, Set<E> | 545 | 137 |
| `AtomicFile` | class | — | 121 | 24 |
| `CircularArray` | class | — | 194 | 54 |
| `CircularIntArray` | class | — | 148 | 44 |
| `Consumer` | class | — | 7 | 1 |
| `ContainerHelpers` | class | — | 69 | 16 |
| `DebugUtils` | class | — | 23 | 4 |
| `LogWriter` | class | Writer | 45 | 11 |
| `LongSparseArray` | class | Cloneable | 271 | 74 |
| `LruCache` | class | — | 275 | 59 |
| `MapCollections` | class | Iterator<T> | 577 | 150 |
| `ObjectsCompat` | class | — | 33 | 7 |
| `Pair` | class | — | 36 | 6 |
| `PatternsCompat` | class | — | 63 | 1 |
| `Pools` | class | Pool<T> | 95 | 21 |
| `Preconditions` | class | — | 202 | 90 |
| `SimpleArrayMap` | class | — | 510 | 130 |
| `SparseArrayCompat` | class | Cloneable | 278 | 77 |
| `TimeUtils` | class | — | 164 | 30 |

<details>
<summary><b>Function list for <code>android.support.v4.util</code></b> (click to expand)</summary>

- **`ArrayMap`** — 23 function(s): `ArrayMap()`, `super()`, `getCollection()`, `if()`, `colGetSize()`, `colGetEntry()`, `colIndexOfKey()`, `colIndexOfValue()`, `colGetMap()`, `colPut()`, `colSetValue()`, `colRemoveAt()`, `colClear()`, `containsAll()`, `putAll()`, `ensureCapacity()`, `for()`, `put()`, `removeAll()`, `retainAll()`, `entrySet()`, `keySet()`, `values()`
- **`ArraySet`** — 42 function(s): `indexOf()`, `if()`, `while()`, `for()`, `indexOfNull()`, `allocArrays()`, `synchronized()`, `freeArrays()`, `ArraySet()`, `this()`, `addAll()`, `clear()`, `ensureCapacity()`, `contains()`, `valueAt()`, `return()`, `isEmpty()`, `add()`, `append()`, `IllegalStateException()`, `remove()`, `removeAt()`, `removeAll()`, `size()`, `toArray()`, `equals()`, `hashCode()`, `toString()`, `getCollection()`, `colGetSize()`, `colGetEntry()`, `colIndexOfKey()`, `colIndexOfValue()`, `colGetMap()`, `UnsupportedOperationException()`, `colPut()`, `colSetValue()`, `colRemoveAt()`, `colClear()`, `iterator()`, `containsAll()`, `retainAll()`
- **`AtomicFile`** — 13 function(s): `AtomicFile()`, `getBaseFile()`, `delete()`, `startWrite()`, `if()`, `IOException()`, `finishWrite()`, `sync()`, `failWrite()`, `openRead()`, `FileInputStream()`, `readFully()`, `while()`
- **`CircularArray`** — 22 function(s): `doubleCapacity()`, `if()`, `RuntimeException()`, `CircularArray()`, `this()`, `IllegalArgumentException()`, `addFirst()`, `addLast()`, `popFirst()`, `ArrayIndexOutOfBoundsException()`, `popLast()`, `clear()`, `removeFromStart()`, `for()`, `removeFromEnd()`, `while()`, `getFirst()`, `getLast()`, `get()`, `size()`, `return()`, `isEmpty()`
- **`CircularIntArray`** — 20 function(s): `doubleCapacity()`, `if()`, `RuntimeException()`, `CircularIntArray()`, `this()`, `IllegalArgumentException()`, `addFirst()`, `addLast()`, `popFirst()`, `ArrayIndexOutOfBoundsException()`, `popLast()`, `clear()`, `removeFromStart()`, `removeFromEnd()`, `getFirst()`, `getLast()`, `get()`, `size()`, `return()`, `isEmpty()`
- **`Consumer`** — 1 function(s): `accept()`
- **`ContainerHelpers`** — 10 function(s): `idealIntArraySize()`, `idealByteArraySize()`, `idealLongArraySize()`, `for()`, `if()`, `return()`, `equal()`, `binarySearch()`, `while()`, `ContainerHelpers()`
- **`DebugUtils`** — 3 function(s): `buildShortClassTag()`, `if()`, `DebugUtils()`
- **`LogWriter`** — 7 function(s): `LogWriter()`, `close()`, `flushBuilder()`, `flush()`, `write()`, `for()`, `if()`
- **`LongSparseArray`** — 26 function(s): `LongSparseArray()`, `this()`, `if()`, `m3clone()`, `AssertionError()`, `get()`, `return()`, `delete()`, `remove()`, `removeAt()`, `gc()`, `for()`, `put()`, `putAll()`, `size()`, `isEmpty()`, `keyAt()`, `valueAt()`, `setValueAt()`, `indexOfKey()`, `indexOfValue()`, `containsKey()`, `containsValue()`, `clear()`, `append()`, `toString()`
- **`LruCache`** — 27 function(s): `LruCache()`, `if()`, `IllegalArgumentException()`, `resize()`, `synchronized()`, `trimToSize()`, `get()`, `NullPointerException()`, `entryRemoved()`, `put()`, `UnsupportedOperationException()`, `remove()`, `create()`, `safeSizeOf()`, `IllegalStateException()`, `sizeOf()`, `evictAll()`, `size()`, `maxSize()`, `hitCount()`, `missCount()`, `createCount()`, `putCount()`, `evictionCount()`, `snapshot()`, `LinkedHashMap()`, `toString()`
- **`MapCollections`** — 49 function(s): `colClear()`, `colGetEntry()`, `colGetMap()`, `colGetSize()`, `colIndexOfKey()`, `colIndexOfValue()`, `colPut()`, `colRemoveAt()`, `colSetValue()`, `ArrayIterator()`, `hasNext()`, `next()`, `if()`, `NoSuchElementException()`, `remove()`, `IllegalStateException()`, `MapIterator()`, `getKey()`, `return()`, `getValue()`, `setValue()`, `equals()`, `hashCode()`, `toString()`, `EntrySet()`, `add()`, `UnsupportedOperationException()`, `addAll()`, `for()`, `clear()`, `contains()`, `containsAll()`, `while()`, `isEmpty()`, `iterator()`, `removeAll()`, `retainAll()`, `size()`, `toArray()`, `KeySet()`, `ValuesCollection()`, `containsAllHelper()`, `removeAllHelper()`, `retainAllHelper()`, `toArrayHelper()`, `equalsSetHelper()`, `getEntrySet()`, `getKeySet()`, `getValues()`
- **`ObjectsCompat`** — 5 function(s): `ObjectsCompat()`, `equals()`, `if()`, `hashCode()`, `hash()`
- **`Pair`** — 6 function(s): `Pair()`, `equals()`, `if()`, `hashCode()`, `toString()`, `create()`
- **`PatternsCompat`** — 1 function(s): `PatternsCompat()`
- **`Pools`** — 12 function(s): `acquire()`, `release()`, `Pools()`, `SimplePool()`, `if()`, `IllegalArgumentException()`, `IllegalStateException()`, `isInPool()`, `for()`, `SynchronizedPool()`, `super()`, `synchronized()`
- **`Preconditions`** — 20 function(s): `checkArgument()`, `if()`, `IllegalArgumentException()`, `checkStringNotEmpty()`, `checkNotNull()`, `NullPointerException()`, `checkState()`, `IllegalStateException()`, `checkFlagsArgument()`, `checkArgumentNonnegative()`, `checkArgumentPositive()`, `checkArgumentFinite()`, `checkArgumentInRange()`, `checkArrayElementsNotNull()`, `for()`, `checkCollectionElementsNotNull()`, `while()`, `checkCollectionNotEmpty()`, `checkArrayElementsInRange()`, `Preconditions()`
- **`SimpleArrayMap`** — 32 function(s): `binarySearchHashes()`, `ConcurrentModificationException()`, `indexOf()`, `if()`, `while()`, `for()`, `indexOfNull()`, `allocArrays()`, `synchronized()`, `freeArrays()`, `SimpleArrayMap()`, `this()`, `putAll()`, `clear()`, `ensureCapacity()`, `containsKey()`, `indexOfKey()`, `indexOfValue()`, `containsValue()`, `get()`, `return()`, `keyAt()`, `valueAt()`, `setValueAt()`, `isEmpty()`, `put()`, `remove()`, `removeAt()`, `size()`, `equals()`, `hashCode()`, `toString()`
- **`SparseArrayCompat`** — 27 function(s): `SparseArrayCompat()`, `this()`, `if()`, `m4clone()`, `AssertionError()`, `get()`, `return()`, `delete()`, `remove()`, `removeAt()`, `removeAtRange()`, `for()`, `gc()`, `put()`, `putAll()`, `size()`, `isEmpty()`, `keyAt()`, `valueAt()`, `setValueAt()`, `indexOfKey()`, `indexOfValue()`, `containsKey()`, `containsValue()`, `clear()`, `append()`, `toString()`
- **`TimeUtils`** — 9 function(s): `accumField()`, `if()`, `printField()`, `formatDurationLocked()`, `while()`, `for()`, `formatDuration()`, `synchronized()`, `TimeUtils()`

</details>

### Package `android.support.v4.view`  (41 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AbsSavedState` | class | Parcelable | 69 | 16 |
| `AccessibilityDelegateCompat` | class | View.AccessibilityDelegate | 124 | 25 |
| `ActionProvider` | class | — | 88 | 20 |
| `AsyncLayoutInflater` | class | LayoutInflater | 160 | 27 |
| `DisplayCutoutCompat` | class | — | 93 | 29 |
| `GestureDetectorCompat` | class | GestureDetectorCompatImpl | 425 | 77 |
| `GravityCompat` | class | — | 48 | 10 |
| `InputDeviceCompat` | class | — | 30 | 1 |
| `KeyEventDispatcher` | class | — | 125 | 28 |
| `LayoutInflaterCompat` | class | LayoutInflater.Factory2 | 100 | 22 |
| `LayoutInflaterFactory` | class | — | 12 | 1 |
| `MarginLayoutParamsCompat` | class | — | 73 | 18 |
| `MenuCompat` | class | — | 26 | 4 |
| `MenuItemCompat` | class | — | 223 | 57 |
| `MotionEventCompat` | class | — | 229 | 14 |
| `NestedScrollingChild` | class | — | 23 | 9 |
| `NestedScrollingChild2` | class | NestedScrollingChild | 15 | 5 |
| `NestedScrollingChildHelper` | class | — | 201 | 52 |
| `NestedScrollingParent` | class | — | 23 | 8 |
| `NestedScrollingParent2` | class | NestedScrollingParent | 17 | 5 |
| `NestedScrollingParentHelper` | class | — | 35 | 8 |
| `OnApplyWindowInsetsListener` | class | — | 9 | 1 |
| `PagerAdapter` | class | — | 105 | 31 |
| `PagerTabStrip` | class | PagerTitleStrip | 212 | 38 |
| `PagerTitleStrip` | class | ViewGroup | 422 | 73 |
| `PointerIconCompat` | class | — | 65 | 14 |
| `ScaleGestureDetectorCompat` | class | — | 34 | 9 |
| `ScrollingView` | class | — | 17 | 6 |
| `TintableBackgroundView` | class | — | 16 | 4 |
| `VelocityTrackerCompat` | class | — | 21 | 3 |
| `ViewCompat` | class | View.OnUnhandledKeyEventListener | 1,592 | 394 |
| `ViewConfigurationCompat` | class | — | 86 | 18 |
| `ViewGroupCompat` | class | — | 67 | 16 |
| `ViewPager` | class | ViewGroup | 2,426 | 539 |
| `ViewParentCompat` | class | — | 182 | 49 |
| `ViewPropertyAnimatorCompat` | class | ViewPropertyAnimatorListener | 438 | 107 |
| `ViewPropertyAnimatorListener` | class | — | 13 | 3 |
| `ViewPropertyAnimatorListenerAdapter` | class | ViewPropertyAnimatorListener | 19 | 3 |
| `ViewPropertyAnimatorUpdateListener` | class | — | 9 | 1 |
| `WindowCompat` | class | — | 27 | 6 |
| `WindowInsetsCompat` | class | — | 198 | 71 |

<details>
<summary><b>Function list for <code>android.support.v4.view</code></b> (click to expand)</summary>

- **`AbsSavedState`** — 10 function(s): `createFromParcel()`, `if()`, `IllegalStateException()`, `newArray()`, `AbsSavedState()`, `IllegalArgumentException()`, `this()`, `getSuperState()`, `describeContents()`, `writeToParcel()`
- **`AccessibilityDelegateCompat`** — 14 function(s): `AccessibilityDelegateAdapter()`, `dispatchPopulateAccessibilityEvent()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `onPopulateAccessibilityEvent()`, `onRequestSendAccessibilityEvent()`, `sendAccessibilityEvent()`, `sendAccessibilityEventUnchecked()`, `getAccessibilityNodeProvider()`, `if()`, `return()`, `performAccessibilityAction()`, `getBridge()`, `AccessibilityNodeProviderCompat()`
- **`ActionProvider`** — 16 function(s): `onSubUiVisibilityChanged()`, `onActionProviderVisibilityChanged()`, `onCreateActionView()`, `ActionProvider()`, `getContext()`, `overridesItemVisibility()`, `isVisible()`, `refreshVisibility()`, `if()`, `onPerformDefaultAction()`, `hasSubMenu()`, `onPrepareSubMenu()`, `subUiVisibilityChanged()`, `setSubUiVisibilityListener()`, `setVisibilityListener()`, `reset()`
- **`AsyncLayoutInflater`** — 21 function(s): `handleMessage()`, `if()`, `onInflateFinished()`, `AsyncLayoutInflater()`, `inflate()`, `NullPointerException()`, `InflateRequest()`, `BasicInflater()`, `super()`, `cloneInContext()`, `onCreateView()`, `for()`, `InflateThread()`, `getInstance()`, `runInner()`, `run()`, `while()`, `obtainRequest()`, `releaseRequest()`, `enqueue()`, `RuntimeException()`
- **`DisplayCutoutCompat`** — 13 function(s): `DisplayCutoutCompat()`, `this()`, `getSafeInsetTop()`, `if()`, `return()`, `getSafeInsetBottom()`, `getSafeInsetLeft()`, `getSafeInsetRight()`, `getBoundingRects()`, `equals()`, `hashCode()`, `toString()`, `wrap()`
- **`GestureDetectorCompat`** — 22 function(s): `isLongpressEnabled()`, `onTouchEvent()`, `setIsLongpressEnabled()`, `setOnDoubleTapListener()`, `GestureHandler()`, `super()`, `handleMessage()`, `if()`, `RuntimeException()`, `GestureDetectorCompatImplBase()`, `init()`, `IllegalArgumentException()`, `for()`, `cancel()`, `cancelTaps()`, `while()`, `isConsideredDoubleTap()`, `return()`, `dispatchLongPress()`, `GestureDetectorCompatImplJellybeanMr2()`, `GestureDetectorCompat()`, `this()`
- **`GravityCompat`** — 6 function(s): `apply()`, `if()`, `applyDisplay()`, `getAbsoluteGravity()`, `return()`, `GravityCompat()`
- **`InputDeviceCompat`** — 1 function(s): `InputDeviceCompat()`
- **`KeyEventDispatcher`** — 10 function(s): `superDispatchKeyEvent()`, `KeyEventDispatcher()`, `dispatchBeforeHierarchy()`, `dispatchKeyEvent()`, `if()`, `activitySuperDispatchKeyEventPre28()`, `dialogSuperDispatchKeyEventPre28()`, `return()`, `actionBarOnMenuKeyEventPre28()`, `getDialogKeyListenerPre28()`
- **`LayoutInflaterCompat`** — 11 function(s): `Factory2Wrapper()`, `onCreateView()`, `toString()`, `getClass()`, `forceSetFactory2()`, `if()`, `LayoutInflaterCompat()`, `setFactory()`, `setFactory2()`, `getFactory()`, `return()`
- **`LayoutInflaterFactory`** — 1 function(s): `onCreateView()`
- **`MarginLayoutParamsCompat`** — 10 function(s): `getMarginStart()`, `if()`, `getMarginEnd()`, `setMarginStart()`, `setMarginEnd()`, `isMarginRelative()`, `getLayoutDirection()`, `setLayoutDirection()`, `resolveLayoutDirection()`, `MarginLayoutParamsCompat()`
- **`MenuCompat`** — 4 function(s): `setShowAsAction()`, `setGroupDividerEnabled()`, `if()`, `MenuCompat()`
- **`MenuItemCompat`** — 27 function(s): `onMenuItemActionCollapse()`, `onMenuItemActionExpand()`, `setShowAsAction()`, `setActionView()`, `getActionView()`, `setActionProvider()`, `if()`, `return()`, `getActionProvider()`, `expandActionView()`, `collapseActionView()`, `isActionViewExpanded()`, `setOnActionExpandListener()`, `setContentDescription()`, `getContentDescription()`, `setTooltipText()`, `getTooltipText()`, `setShortcut()`, `setNumericShortcut()`, `getNumericModifiers()`, `setAlphabeticShortcut()`, `getAlphabeticModifiers()`, `setIconTintList()`, `getIconTintList()`, `setIconTintMode()`, `getIconTintMode()`, `MenuItemCompat()`
- **`MotionEventCompat`** — 13 function(s): `getActionMasked()`, `getActionIndex()`, `findPointerIndex()`, `getPointerId()`, `getX()`, `getY()`, `getPointerCount()`, `getSource()`, `isFromSource()`, `return()`, `getAxisValue()`, `getButtonState()`, `MotionEventCompat()`
- **`NestedScrollingChild`** — 9 function(s): `dispatchNestedFling()`, `dispatchNestedPreFling()`, `dispatchNestedPreScroll()`, `dispatchNestedScroll()`, `hasNestedScrollingParent()`, `isNestedScrollingEnabled()`, `setNestedScrollingEnabled()`, `startNestedScroll()`, `stopNestedScroll()`
- **`NestedScrollingChild2`** — 5 function(s): `dispatchNestedPreScroll()`, `dispatchNestedScroll()`, `hasNestedScrollingParent()`, `startNestedScroll()`, `stopNestedScroll()`
- **`NestedScrollingChildHelper`** — 17 function(s): `NestedScrollingChildHelper()`, `setNestedScrollingEnabled()`, `if()`, `isNestedScrollingEnabled()`, `hasNestedScrollingParent()`, `getNestedScrollingParentForType()`, `startNestedScroll()`, `for()`, `setNestedScrollingParentForType()`, `stopNestedScroll()`, `dispatchNestedScroll()`, `dispatchNestedPreScroll()`, `return()`, `dispatchNestedFling()`, `dispatchNestedPreFling()`, `onDetachedFromWindow()`, `onStopNestedScroll()`
- **`NestedScrollingParent`** — 8 function(s): `getNestedScrollAxes()`, `onNestedFling()`, `onNestedPreFling()`, `onNestedPreScroll()`, `onNestedScroll()`, `onNestedScrollAccepted()`, `onStartNestedScroll()`, `onStopNestedScroll()`
- **`NestedScrollingParent2`** — 5 function(s): `onNestedPreScroll()`, `onNestedScroll()`, `onNestedScrollAccepted()`, `onStartNestedScroll()`, `onStopNestedScroll()`
- **`NestedScrollingParentHelper`** — 4 function(s): `NestedScrollingParentHelper()`, `onNestedScrollAccepted()`, `getNestedScrollAxes()`, `onStopNestedScroll()`
- **`OnApplyWindowInsetsListener`** — 1 function(s): `onApplyWindowInsets()`
- **`PagerAdapter`** — 19 function(s): `getCount()`, `isViewFromObject()`, `startUpdate()`, `instantiateItem()`, `destroyItem()`, `setPrimaryItem()`, `finishUpdate()`, `UnsupportedOperationException()`, `saveState()`, `restoreState()`, `getItemPosition()`, `notifyDataSetChanged()`, `synchronized()`, `if()`, `registerDataSetObserver()`, `unregisterDataSetObserver()`, `setViewPagerObserver()`, `getPageTitle()`, `getPageWidth()`
- **`PagerTabStrip`** — 21 function(s): `PagerTabStrip()`, `this()`, `super()`, `setPadding()`, `setTextSpacing()`, `setWillNotDraw()`, `onClick()`, `if()`, `setTabIndicatorColor()`, `invalidate()`, `setTabIndicatorColorResource()`, `getTabIndicatorColor()`, `setBackgroundDrawable()`, `setBackgroundColor()`, `setBackgroundResource()`, `setDrawFullUnderline()`, `getDrawFullUnderline()`, `getMinHeight()`, `onTouchEvent()`, `onDraw()`, `updateTextPositions()`
- **`PagerTitleStrip`** — 31 function(s): `SingleLineAllCapsTransform()`, `getTransformation()`, `if()`, `setSingleLineAllCaps()`, `PagerTitleStrip()`, `this()`, `super()`, `addView()`, `setTextSize()`, `setNonPrimaryAlpha()`, `setTextSpacing()`, `requestLayout()`, `getTextSpacing()`, `setTextColor()`, `setGravity()`, `onAttachedToWindow()`, `IllegalStateException()`, `updateAdapter()`, `onDetachedFromWindow()`, `updateText()`, `updateTextPositions()`, `onMeasure()`, `setMeasuredDimension()`, `onLayout()`, `getMinHeight()`, `PageListener()`, `onPageScrolled()`, `onPageSelected()`, `onPageScrollStateChanged()`, `onAdapterChanged()`, `onChanged()`
- **`PointerIconCompat`** — 6 function(s): `PointerIconCompat()`, `getPointerIcon()`, `getSystemIcon()`, `if()`, `create()`, `load()`
- **`ScaleGestureDetectorCompat`** — 4 function(s): `ScaleGestureDetectorCompat()`, `setQuickScaleEnabled()`, `if()`, `isQuickScaleEnabled()`
- **`ScrollingView`** — 6 function(s): `computeHorizontalScrollExtent()`, `computeHorizontalScrollOffset()`, `computeHorizontalScrollRange()`, `computeVerticalScrollExtent()`, `computeVerticalScrollOffset()`, `computeVerticalScrollRange()`
- **`TintableBackgroundView`** — 4 function(s): `getSupportBackgroundTintList()`, `getSupportBackgroundTintMode()`, `setSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`
- **`VelocityTrackerCompat`** — 3 function(s): `getXVelocity()`, `getYVelocity()`, `VelocityTrackerCompat()`
- **`ViewCompat`** — 164 function(s): `onUnhandledKeyEvent()`, `getEmptyTempRect()`, `if()`, `canScrollHorizontally()`, `canScrollVertically()`, `getOverScrollMode()`, `setOverScrollMode()`, `onPopulateAccessibilityEvent()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `setAccessibilityDelegate()`, `setAutofillHints()`, `getImportantForAutofill()`, `setImportantForAutofill()`, `isImportantForAutofill()`, `hasAccessibilityDelegate()`, `hasTransientState()`, `setHasTransientState()`, `postInvalidateOnAnimation()`, `postOnAnimation()`, `postOnAnimationDelayed()`, `getImportantForAccessibility()`, `setImportantForAccessibility()`, `isImportantForAccessibility()`, `performAccessibilityAction()`, `getAccessibilityNodeProvider()`, `AccessibilityNodeProviderCompat()`, `getAlpha()`, `setLayerType()`, `getLayerType()`, `getLabelFor()`, `setLabelFor()`, `setLayerPaint()`, `getLayoutDirection()`, `setLayoutDirection()`, `getParentForAccessibility()`, `requireViewById()`, `return()`, `IllegalArgumentException()`, `isOpaque()`, `resolveSizeAndState()`, `getMeasuredWidthAndState()`, `getMeasuredHeightAndState()`, `getMeasuredState()`, `combineMeasuredStates()`, `getAccessibilityLiveRegion()`, `setAccessibilityLiveRegion()`, `getPaddingStart()`, `getPaddingEnd()`, `setPaddingRelative()`, `bindTempDetach()`, `dispatchStartTemporaryDetach()`, `dispatchFinishTemporaryDetach()`, `getTranslationX()`, `getTranslationY()`, `getMatrix()`, `getMinimumWidth()`, `getMinimumHeight()`, `animate()`, `setTranslationX()`, `setTranslationY()`, `setAlpha()`, `setX()`, `setY()`, `setRotation()`, `setRotationX()`, `setRotationY()`, `setScaleX()`, `setScaleY()`, `getPivotX()`, `setPivotX()`, `getPivotY()`, `setPivotY()`, `getRotation()`, `getRotationX()`, `getRotationY()`, `getScaleX()`, `getScaleY()`, `getX()`, `getY()`, `setElevation()`, `getElevation()`, `setTranslationZ()`, `getTranslationZ()`, `setTransitionName()`, `getTransitionName()`, `getWindowSystemUiVisibility()`, `requestApplyInsets()`, `setChildrenDrawingOrderEnabled()`, `getFitsSystemWindows()`, `setFitsSystemWindows()`, `jumpDrawablesToCurrentState()`, `setOnApplyWindowInsetsListener()`, `onApplyWindowInsets()`, `dispatchApplyWindowInsets()`, `setSaveFromParentEnabled()`, `setActivated()`, `hasOverlappingRendering()`, `isPaddingRelative()`, `setBackground()`, `getBackgroundTintList()`, `setBackgroundTintList()`, `getBackgroundTintMode()`, `setBackgroundTintMode()`, `setNestedScrollingEnabled()`, `isNestedScrollingEnabled()`, `startNestedScroll()`, `stopNestedScroll()`, `hasNestedScrollingParent()`, `dispatchNestedScroll()`, `dispatchNestedPreScroll()`, `dispatchNestedFling()`, `dispatchNestedPreFling()`, `isInLayout()`, `isLaidOut()`, `isLayoutDirectionResolved()`, `getZ()`, `setZ()`, `offsetTopAndBottom()`, `compatOffsetTopAndBottom()`, `tickleInvalidationFlag()`, `offsetLeftAndRight()`, `compatOffsetLeftAndRight()`, `setClipBounds()`, `getClipBounds()`, `isAttachedToWindow()`, `hasOnClickListeners()`, `setScrollIndicators()`, `getScrollIndicators()`, `setPointerIcon()`, `getDisplay()`, `setTooltipText()`, `startDragAndDrop()`, `cancelDragAndDrop()`, `updateDragShadow()`, `getNextClusterForwardId()`, `setNextClusterForwardId()`, `isKeyboardNavigationCluster()`, `setKeyboardNavigationCluster()`, `isFocusedByDefault()`, `setFocusedByDefault()`, `keyboardNavigationClusterSearch()`, `addKeyboardNavigationClusters()`, `restoreDefaultFocus()`, `hasExplicitFocusable()`, `generateViewId()`, `addOnUnhandledKeyEventListener()`, `removeOnUnhandledKeyEventListener()`, `ViewCompat()`, `OnUnhandledKeyEventListenerWrapper()`, `dispatchUnhandledKeyEventBeforeHierarchy()`, `dispatchUnhandledKeyEventBeforeCallback()`, `UnhandledKeyEventManager()`, `getCapturedKeys()`, `at()`, `dispatch()`, `recalcViewsWithUnhandled()`, `dispatchInOrder()`, `for()`, `preDispatch()`, `registerListeningView()`, `synchronized()`, `while()`, `unregisterListeningView()`
- **`ViewConfigurationCompat`** — 10 function(s): `if()`, `getScaledPagingTouchSlop()`, `hasPermanentMenuKey()`, `getScaledHorizontalScrollFactor()`, `getLegacyScrollFactor()`, `getScaledVerticalScrollFactor()`, `return()`, `getScaledHoverSlop()`, `shouldShowMenuShortcutsWhenKeyboardPresent()`, `ViewConfigurationCompat()`
- **`ViewGroupCompat`** — 10 function(s): `ViewGroupCompat()`, `onRequestSendAccessibilityEvent()`, `setMotionEventSplittingEnabled()`, `getLayoutMode()`, `if()`, `setLayoutMode()`, `setTransitionGroup()`, `isTransitionGroup()`, `return()`, `getNestedScrollAxes()`
- **`ViewPager`** — 132 function(s): `compare()`, `getInterpolation()`, `return()`, `onAdapterChanged()`, `onPageScrollStateChanged()`, `onPageScrolled()`, `onPageSelected()`, `transformPage()`, `ItemInfo()`, `ViewPager()`, `super()`, `run()`, `initViewPager()`, `setWillNotDraw()`, `setDescendantFocusability()`, `setFocusable()`, `if()`, `onApplyWindowInsets()`, `for()`, `onDetachedFromWindow()`, `removeCallbacks()`, `setScrollState()`, `enableLayers()`, `dispatchOnScrollStateChanged()`, `setAdapter()`, `removeNonDecorViews()`, `scrollTo()`, `setCurrentItemInternal()`, `populate()`, `requestLayout()`, `while()`, `removeViewAt()`, `getAdapter()`, `addOnAdapterChangeListener()`, `removeOnAdapterChangeListener()`, `getClientWidth()`, `setCurrentItem()`, `getCurrentItem()`, `setScrollingCacheEnabled()`, `dispatchOnPageSelected()`, `scrollToItem()`, `smoothScrollTo()`, `completeScroll()`, `pageScrolled()`, `setOnPageChangeListener()`, `addOnPageChangeListener()`, `removeOnPageChangeListener()`, `clearOnPageChangeListeners()`, `setPageTransformer()`, `setChildrenDrawingOrderEnabled()`, `getChildDrawingOrder()`, `setInternalPageChangeListener()`, `getOffscreenPageLimit()`, `setOffscreenPageLimit()`, `setPageMargin()`, `recomputeScrollPosition()`, `getPageMargin()`, `setPageMarginDrawable()`, `refreshDrawableState()`, `invalidate()`, `verifyDrawable()`, `drawableStateChanged()`, `distanceInfluenceForSnapDuration()`, `addNewItem()`, `dataSetChanged()`, `sortChildDrawingOrder()`, `IllegalStateException()`, `calculatePageOffsets()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `toString()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `addView()`, `addViewInLayout()`, `isDecorView()`, `removeView()`, `removeViewInLayout()`, `infoForChild()`, `infoForAnyChild()`, `infoForPosition()`, `onAttachedToWindow()`, `onMeasure()`, `setMeasuredDimension()`, `onSizeChanged()`, `onLayout()`, `computeScroll()`, `dispatchOnPageScrolled()`, `isGutterDrag()`, `getChildAt()`, `onInterceptTouchEvent()`, `resetTouch()`, `requestParentDisallowInterceptTouchEvent()`, `onSecondaryPointerUp()`, `onTouchEvent()`, `endDrag()`, `performDrag()`, `infoForCurrentScrollPosition()`, `determineTargetPage()`, `draw()`, `onDraw()`, `beginFakeDrag()`, `endFakeDrag()`, `fakeDragBy()`, `isFakeDragging()`, `canScrollHorizontally()`, `canScroll()`, `dispatchKeyEvent()`, `executeKeyEvent()`, `arrowScroll()`, `playSoundEffect()`, `getChildRectInPagerCoordinates()`, `pageLeft()`, `pageRight()`, `addFocusables()`, `addTouchables()`, `onRequestFocusInDescendants()`, `dispatchPopulateAccessibilityEvent()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `checkLayoutParams()`, `MyAccessibilityDelegate()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `performAccessibilityAction()`, `PagerObserver()`, `onChanged()`, `onInvalidated()`, `ViewPositionComparator()`
- **`ViewParentCompat`** — 12 function(s): `ViewParentCompat()`, `requestSendAccessibilityEvent()`, `onStartNestedScroll()`, `onNestedScrollAccepted()`, `onStopNestedScroll()`, `onNestedScroll()`, `onNestedPreScroll()`, `if()`, `return()`, `onNestedFling()`, `onNestedPreFling()`, `notifySubtreeAccessibilityStateChanged()`
- **`ViewPropertyAnimatorCompat`** — 46 function(s): `ViewPropertyAnimatorCompat()`, `ViewPropertyAnimatorListenerApi14()`, `onAnimationStart()`, `if()`, `onAnimationEnd()`, `onAnimationCancel()`, `setDuration()`, `alpha()`, `alphaBy()`, `translationX()`, `translationY()`, `withEndAction()`, `setListenerInternal()`, `getDuration()`, `setInterpolator()`, `getInterpolator()`, `return()`, `setStartDelay()`, `getStartDelay()`, `rotation()`, `rotationBy()`, `rotationX()`, `rotationXBy()`, `rotationY()`, `rotationYBy()`, `scaleX()`, `scaleXBy()`, `scaleY()`, `scaleYBy()`, `cancel()`, `x()`, `xBy()`, `y()`, `yBy()`, `translationXBy()`, `translationYBy()`, `translationZBy()`, `translationZ()`, `z()`, `zBy()`, `start()`, `withLayer()`, `withStartAction()`, `setListener()`, `setUpdateListener()`, `onAnimationUpdate()`
- **`ViewPropertyAnimatorListener`** — 3 function(s): `onAnimationCancel()`, `onAnimationEnd()`, `onAnimationStart()`
- **`ViewPropertyAnimatorListenerAdapter`** — 3 function(s): `onAnimationStart()`, `onAnimationEnd()`, `onAnimationCancel()`
- **`ViewPropertyAnimatorUpdateListener`** — 1 function(s): `onAnimationUpdate()`
- **`WindowCompat`** — 5 function(s): `WindowCompat()`, `requireViewById()`, `if()`, `return()`, `IllegalArgumentException()`
- **`WindowInsetsCompat`** — 25 function(s): `WindowInsetsCompat()`, `if()`, `getSystemWindowInsetLeft()`, `return()`, `getSystemWindowInsetTop()`, `getSystemWindowInsetRight()`, `getSystemWindowInsetBottom()`, `hasSystemWindowInsets()`, `hasInsets()`, `isConsumed()`, `isRound()`, `consumeSystemWindowInsets()`, `replaceSystemWindowInsets()`, `getStableInsetTop()`, `getStableInsetLeft()`, `getStableInsetRight()`, `getStableInsetBottom()`, `hasStableInsets()`, `consumeStableInsets()`, `getDisplayCutout()`, `consumeDisplayCutout()`, `equals()`, `hashCode()`, `wrap()`, `unwrap()`

</details>

### Package `android.support.v4.view.accessibility`  (6 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AccessibilityEventCompat` | class | — | 109 | 19 |
| `AccessibilityManagerCompat` | class | AccessibilityStateChangeListener | 134 | 26 |
| `AccessibilityNodeInfoCompat` | class | — | 1,258 | 348 |
| `AccessibilityNodeProviderCompat` | class | AccessibilityNodeProvider | 103 | 19 |
| `AccessibilityRecordCompat` | class | — | 314 | 72 |
| `AccessibilityWindowInfoCompat` | class | — | 207 | 62 |

<details>
<summary><b>Function list for <code>android.support.v4.view.accessibility</code></b> (click to expand)</summary>

- **`AccessibilityEventCompat`** — 13 function(s): `AccessibilityEventCompat()`, `getRecordCount()`, `appendRecord()`, `getRecord()`, `AccessibilityRecordCompat()`, `asRecord()`, `setContentChangeTypes()`, `if()`, `getContentChangeTypes()`, `setMovementGranularity()`, `getMovementGranularity()`, `setAction()`, `getAction()`
- **`AccessibilityManagerCompat`** — 15 function(s): `onAccessibilityStateChanged()`, `onTouchExplorationStateChanged()`, `addAccessibilityStateChangeListener()`, `if()`, `removeAccessibilityStateChangeListener()`, `AccessibilityStateChangeListenerWrapper()`, `hashCode()`, `equals()`, `getInstalledAccessibilityServiceList()`, `getEnabledAccessibilityServiceList()`, `isTouchExplorationEnabled()`, `addTouchExplorationStateChangeListener()`, `removeTouchExplorationStateChangeListener()`, `TouchExplorationStateChangeListenerWrapper()`, `AccessibilityManagerCompat()`
- **`AccessibilityNodeInfoCompat`** — 153 function(s): `AccessibilityActionCompat()`, `this()`, `getId()`, `if()`, `return()`, `getLabel()`, `obtain()`, `CollectionInfoCompat()`, `getColumnCount()`, `getRowCount()`, `isHierarchical()`, `getSelectionMode()`, `CollectionItemInfoCompat()`, `getColumnIndex()`, `getColumnSpan()`, `getRowIndex()`, `getRowSpan()`, `isHeading()`, `isSelected()`, `RangeInfoCompat()`, `getCurrent()`, `getMax()`, `getMin()`, `getType()`, `wrapNonNullInstance()`, `AccessibilityNodeInfoCompat()`, `wrap()`, `unwrap()`, `getInfo()`, `setSource()`, `findFocus()`, `focusSearch()`, `getWindowId()`, `getChildCount()`, `getChild()`, `addChild()`, `removeChild()`, `getActions()`, `addAction()`, `removeAction()`, `performAction()`, `setMovementGranularities()`, `getMovementGranularities()`, `findAccessibilityNodeInfosByText()`, `for()`, `getParent()`, `setParent()`, `getBoundsInParent()`, `setBoundsInParent()`, `getBoundsInScreen()`, `setBoundsInScreen()`, `isCheckable()`, `setCheckable()`, `isChecked()`, `setChecked()`, `isFocusable()`, `setFocusable()`, `isFocused()`, `setFocused()`, `isVisibleToUser()`, `setVisibleToUser()`, `isAccessibilityFocused()`, `setAccessibilityFocused()`, `setSelected()`, `isClickable()`, `setClickable()`, `isLongClickable()`, `setLongClickable()`, `isEnabled()`, `setEnabled()`, `isPassword()`, `setPassword()`, `isScrollable()`, `setScrollable()`, `isImportantForAccessibility()`, `setImportantForAccessibility()`, `getPackageName()`, `setPackageName()`, `getClassName()`, `setClassName()`, `getText()`, `setText()`, `getContentDescription()`, `setContentDescription()`, `recycle()`, `setViewIdResourceName()`, `getViewIdResourceName()`, `getLiveRegion()`, `setLiveRegion()`, `getDrawingOrder()`, `setDrawingOrder()`, `getCollectionInfo()`, `setCollectionInfo()`, `setCollectionItemInfo()`, `getCollectionItemInfo()`, `getRangeInfo()`, `setRangeInfo()`, `getActionList()`, `setContentInvalid()`, `isContentInvalid()`, `isContextClickable()`, `setContextClickable()`, `getHintText()`, `setHintText()`, `setError()`, `getError()`, `setLabelFor()`, `getLabelFor()`, `setLabeledBy()`, `getLabeledBy()`, `canOpenPopup()`, `setCanOpenPopup()`, `findAccessibilityNodeInfosByViewId()`, `getExtras()`, `Bundle()`, `getInputType()`, `setInputType()`, `setMaxTextLength()`, `getMaxTextLength()`, `setTextSelection()`, `getTextSelectionStart()`, `getTextSelectionEnd()`, `getTraversalBefore()`, `setTraversalBefore()`, `getTraversalAfter()`, `setTraversalAfter()`, `getWindow()`, `isDismissable()`, `setDismissable()`, `isEditable()`, `setEditable()`, `isMultiLine()`, `setMultiLine()`, `getTooltipText()`, `setTooltipText()`, `setPaneTitle()`, `getPaneTitle()`, `isScreenReaderFocusable()`, `getBooleanProperty()`, `setScreenReaderFocusable()`, `setBooleanProperty()`, `isShowingHintText()`, `setShowingHintText()`, `setHeading()`, `refresh()`, `getRoleDescription()`, `setRoleDescription()`, `hashCode()`, `equals()`, `toString()`, `while()`, `getActionSymbolicName()`, `switch()`
- **`AccessibilityNodeProviderCompat`** — 11 function(s): `AccessibilityNodeProviderApi16()`, `createAccessibilityNodeInfo()`, `if()`, `findAccessibilityNodeInfosByText()`, `for()`, `performAction()`, `AccessibilityNodeProviderApi19()`, `super()`, `findFocus()`, `AccessibilityNodeProviderCompat()`, `getProvider()`
- **`AccessibilityRecordCompat`** — 49 function(s): `AccessibilityRecordCompat()`, `getImpl()`, `obtain()`, `setSource()`, `if()`, `getSource()`, `getWindowId()`, `isChecked()`, `setChecked()`, `isEnabled()`, `setEnabled()`, `isPassword()`, `setPassword()`, `isFullScreen()`, `setFullScreen()`, `isScrollable()`, `setScrollable()`, `getItemCount()`, `setItemCount()`, `getCurrentItemIndex()`, `setCurrentItemIndex()`, `getFromIndex()`, `setFromIndex()`, `getToIndex()`, `setToIndex()`, `getScrollX()`, `setScrollX()`, `getScrollY()`, `setScrollY()`, `getMaxScrollX()`, `setMaxScrollX()`, `getMaxScrollY()`, `setMaxScrollY()`, `getAddedCount()`, `setAddedCount()`, `getRemovedCount()`, `setRemovedCount()`, `getClassName()`, `setClassName()`, `getText()`, `getBeforeText()`, `setBeforeText()`, `getContentDescription()`, `setContentDescription()`, `getParcelableData()`, `setParcelableData()`, `recycle()`, `hashCode()`, `equals()`
- **`AccessibilityWindowInfoCompat`** — 23 function(s): `wrapNonNullInstance()`, `if()`, `AccessibilityWindowInfoCompat()`, `getType()`, `return()`, `getLayer()`, `getRoot()`, `getParent()`, `getId()`, `getBoundsInScreen()`, `isActive()`, `isFocused()`, `isAccessibilityFocused()`, `getChildCount()`, `getChild()`, `getTitle()`, `getAnchor()`, `obtain()`, `recycle()`, `hashCode()`, `equals()`, `toString()`, `typeToString()`

</details>

### Package `android.support.v4.view.animation`  (6 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `FastOutLinearInInterpolator` | class | LookupTableInterpolator | 16 | 2 |
| `FastOutSlowInInterpolator` | class | LookupTableInterpolator | 16 | 2 |
| `LinearOutSlowInInterpolator` | class | LookupTableInterpolator | 16 | 2 |
| `LookupTableInterpolator` | class | Interpolator | 34 | 4 |
| `PathInterpolatorApi14` | class | Interpolator | 84 | 15 |
| `PathInterpolatorCompat` | class | — | 34 | 13 |

<details>
<summary><b>Function list for <code>android.support.v4.view.animation</code></b> (click to expand)</summary>

- **`FastOutLinearInInterpolator`** — 2 function(s): `FastOutLinearInInterpolator()`, `super()`
- **`FastOutSlowInInterpolator`** — 2 function(s): `FastOutSlowInInterpolator()`, `super()`
- **`LinearOutSlowInInterpolator`** — 2 function(s): `LinearOutSlowInInterpolator()`, `super()`
- **`LookupTableInterpolator`** — 3 function(s): `LookupTableInterpolator()`, `getInterpolation()`, `if()`
- **`PathInterpolatorApi14`** — 9 function(s): `PathInterpolatorApi14()`, `for()`, `this()`, `getInterpolation()`, `if()`, `while()`, `return()`, `createQuad()`, `createCubic()`
- **`PathInterpolatorCompat`** — 5 function(s): `PathInterpolatorCompat()`, `create()`, `if()`, `PathInterpolator()`, `PathInterpolatorApi14()`

</details>

### Package `android.support.v4.widget`  (31 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AutoScrollHelper` | class | View.OnTouchListener | 430 | 94 |
| `AutoSizeableTextView` | class | — | 29 | 8 |
| `CircleImageView` | class | ImageView | 127 | 24 |
| `CircularProgressDrawable` | class | Drawable implements Animatable | 615 | 127 |
| `CompoundButtonCompat` | class | — | 85 | 18 |
| `ContentLoadingProgressBar` | class | ProgressBar | 92 | 24 |
| `CursorAdapter` | class | BaseAdapter implements Filterable, CursorFilter.CursorFilterClient | 282 | 65 |
| `CursorFilter` | class | Filter | 53 | 10 |
| `DirectedAcyclicGraph` | class | — | 125 | 33 |
| `DrawerLayout` | class | ViewGroup | 1,838 | 433 |
| `EdgeEffectCompat` | class | — | 69 | 12 |
| `ExploreByTouchHelper` | class | AccessibilityDelegateCompat | 559 | 159 |
| `FocusStrategy` | class | Comparator<T> | 269 | 83 |
| `ImageViewCompat` | class | — | 82 | 21 |
| `ListPopupWindowCompat` | class | — | 24 | 5 |
| `ListViewAutoScrollHelper` | class | AutoScrollHelper | 58 | 12 |
| `ListViewCompat` | class | — | 50 | 10 |
| `NestedScrollView` | class | FrameLayout implements NestedScrollingParent2, NestedScrollingChild2, ScrollingView | 1,518 | 365 |
| `PopupMenuCompat` | class | — | 19 | 4 |
| `PopupWindowCompat` | class | — | 136 | 24 |
| `ResourceCursorAdapter` | class | CursorAdapter | 56 | 10 |
| `ScrollerCompat` | class | — | 106 | 20 |
| `SimpleCursorAdapter` | class | ResourceCursorAdapter | 156 | 37 |
| `SlidingPaneLayout` | class | ViewGroup | 1,262 | 255 |
| `Space` | class | View | 56 | 15 |
| `SwipeRefreshLayout` | class | ViewGroup implements NestedScrollingParent, NestedScrollingChild | 874 | 209 |
| `TextViewCompat` | class | ActionMode.Callback | 531 | 118 |
| `TintableCompoundButton` | class | — | 16 | 4 |
| `TintableImageSourceView` | class | — | 16 | 4 |
| `ViewDragHelper` | class | — | 929 | 227 |
| `ViewGroupUtils` | class | — | 55 | 11 |

<details>
<summary><b>Function list for <code>android.support.v4.widget</code></b> (click to expand)</summary>

- **`AutoScrollHelper`** — 42 function(s): `canTargetScrollHorizontally()`, `canTargetScrollVertically()`, `scrollTargetBy()`, `AutoScrollHelper()`, `setMaximumVelocity()`, `setMinimumVelocity()`, `setEdgeType()`, `setMaximumEdges()`, `setRelativeEdges()`, `setRelativeVelocity()`, `setActivationDelay()`, `setRampUpDuration()`, `setRampDownDuration()`, `setEnabled()`, `if()`, `requestStop()`, `isEnabled()`, `setExclusive()`, `isExclusive()`, `onTouch()`, `startAnimating()`, `shouldAnimate()`, `return()`, `computeTargetVelocity()`, `constrain()`, `getEdgeValue()`, `constrainEdgeValue()`, `cancelTargetTouch()`, `ScrollAnimationRunnable()`, `run()`, `ClampedScroller()`, `start()`, `isFinished()`, `getValueAt()`, `interpolateValue()`, `computeScrollDelta()`, `RuntimeException()`, `setTargetVelocity()`, `getHorizontalDirection()`, `getVerticalDirection()`, `getDeltaX()`, `getDeltaY()`
- **`AutoSizeableTextView`** — 8 function(s): `getAutoSizeMaxTextSize()`, `getAutoSizeMinTextSize()`, `getAutoSizeStepGranularity()`, `getAutoSizeTextAvailableSizes()`, `getAutoSizeTextType()`, `setAutoSizeTextTypeUniformWithConfiguration()`, `setAutoSizeTextTypeUniformWithPresetSizes()`, `setAutoSizeTextTypeWithDefaults()`
- **`CircleImageView`** — 17 function(s): `CircleImageView()`, `super()`, `if()`, `setLayerType()`, `setPadding()`, `elevationSupported()`, `onMeasure()`, `setMeasuredDimension()`, `setAnimationListener()`, `onAnimationStart()`, `onAnimationEnd()`, `setBackgroundColorRes()`, `setBackgroundColor()`, `OvalShadow()`, `updateRadialGradient()`, `onResize()`, `draw()`
- **`CircularProgressDrawable`** — 67 function(s): `CircularProgressDrawable()`, `setStrokeWidth()`, `setupAnimators()`, `setSizeParameters()`, `setStyle()`, `if()`, `invalidateSelf()`, `getStrokeWidth()`, `getCenterRadius()`, `setCenterRadius()`, `setStrokeCap()`, `getStrokeCap()`, `getArrowWidth()`, `getArrowHeight()`, `setArrowDimensions()`, `getArrowEnabled()`, `setArrowEnabled()`, `getArrowScale()`, `setArrowScale()`, `getStartTrim()`, `getEndTrim()`, `setStartEndTrim()`, `getProgressRotation()`, `setProgressRotation()`, `getBackgroundColor()`, `setBackgroundColor()`, `getColorSchemeColors()`, `setColorSchemeColors()`, `draw()`, `setAlpha()`, `getAlpha()`, `setColorFilter()`, `setRotation()`, `getRotation()`, `getOpacity()`, `isRunning()`, `start()`, `stop()`, `evaluateColorChange()`, `return()`, `updateRingColor()`, `applyFinishTranslation()`, `applyTransformation()`, `onAnimationUpdate()`, `onAnimationStart()`, `onAnimationEnd()`, `onAnimationCancel()`, `onAnimationRepeat()`, `Ring()`, `drawTriangle()`, `setColors()`, `setColorIndex()`, `getColors()`, `setColor()`, `getNextColor()`, `getNextColorIndex()`, `goToNextColor()`, `setStartTrim()`, `getStartingStartTrim()`, `getStartingEndTrim()`, `getStartingColor()`, `setEndTrim()`, `setShowArrow()`, `getShowArrow()`, `getStartingRotation()`, `storeOriginals()`, `resetOriginals()`
- **`CompoundButtonCompat`** — 8 function(s): `CompoundButtonCompat()`, `setButtonTintList()`, `if()`, `getButtonTintList()`, `return()`, `setButtonTintMode()`, `getButtonTintMode()`, `getButtonDrawable()`
- **`ContentLoadingProgressBar`** — 12 function(s): `ContentLoadingProgressBar()`, `this()`, `super()`, `run()`, `if()`, `onAttachedToWindow()`, `removeCallbacks()`, `onDetachedFromWindow()`, `hide()`, `postDelayed()`, `setVisibility()`, `show()`
- **`CursorAdapter`** — 31 function(s): `bindView()`, `newView()`, `CursorAdapter()`, `init()`, `if()`, `getCursor()`, `getCount()`, `getItem()`, `getItemId()`, `hasStableIds()`, `getView()`, `IllegalStateException()`, `getDropDownView()`, `newDropDownView()`, `changeCursor()`, `swapCursor()`, `notifyDataSetChanged()`, `notifyDataSetInvalidated()`, `convertToString()`, `runQueryOnBackgroundThread()`, `getFilter()`, `getFilterQueryProvider()`, `setFilterQueryProvider()`, `onContentChanged()`, `ChangeObserver()`, `super()`, `deliverSelfNotifications()`, `onChange()`, `MyDataSetObserver()`, `onChanged()`, `onInvalidated()`
- **`CursorFilter`** — 9 function(s): `changeCursor()`, `convertToString()`, `getCursor()`, `runQueryOnBackgroundThread()`, `CursorFilter()`, `convertResultToString()`, `performFiltering()`, `if()`, `publishResults()`
- **`DirectedAcyclicGraph`** — 16 function(s): `addNode()`, `if()`, `contains()`, `addEdge()`, `IllegalArgumentException()`, `getIncomingEdges()`, `getOutgoingEdges()`, `for()`, `hasOutgoingEdges()`, `clear()`, `poolList()`, `getSortedList()`, `dfs()`, `RuntimeException()`, `size()`, `getEmptyList()`
- **`DrawerLayout`** — 123 function(s): `onDrawerClosed()`, `onDrawerOpened()`, `onDrawerSlide()`, `onDrawerStateChanged()`, `if()`, `DrawerLayout()`, `this()`, `super()`, `setDescendantFocusability()`, `setFocusableInTouchMode()`, `setMotionEventSplittingEnabled()`, `setOnApplyWindowInsetsListener()`, `onApplyWindowInsets()`, `setSystemUiVisibility()`, `setDrawerElevation()`, `for()`, `getDrawerElevation()`, `setChildInsets()`, `setWillNotDraw()`, `requestLayout()`, `setDrawerShadow()`, `resolveShadowDrawables()`, `invalidate()`, `setScrimColor()`, `setDrawerListener()`, `removeDrawerListener()`, `addDrawerListener()`, `setDrawerLockMode()`, `openDrawer()`, `closeDrawer()`, `IllegalArgumentException()`, `getDrawerLockMode()`, `setDrawerTitle()`, `getDrawerTitle()`, `isInBoundsOfChild()`, `dispatchTransformedGenericPointerEvent()`, `getTransformedMotionEvent()`, `updateDrawerState()`, `dispatchOnDrawerClosed()`, `dispatchOnDrawerOpened()`, `updateChildrenImportantForAccessibility()`, `sendAccessibilityEvent()`, `dispatchOnDrawerSlide()`, `setDrawerViewOffset()`, `getDrawerViewOffset()`, `return()`, `getDrawerViewAbsoluteGravity()`, `checkDrawerViewAbsoluteGravity()`, `findOpenDrawer()`, `moveDrawerToOffset()`, `findDrawerWithGravity()`, `gravityToString()`, `onDetachedFromWindow()`, `onAttachedToWindow()`, `onMeasure()`, `while()`, `IllegalStateException()`, `resolveLeftShadow()`, `mirror()`, `resolveRightShadow()`, `onLayout()`, `computeScroll()`, `hasOpaqueBackground()`, `setStatusBarBackground()`, `getStatusBarBackgroundDrawable()`, `setStatusBarBackgroundColor()`, `onRtlPropertiesChanged()`, `onDraw()`, `drawChild()`, `isContentView()`, `isDrawerView()`, `onInterceptTouchEvent()`, `closeDrawers()`, `dispatchGenericMotionEvent()`, `onTouchEvent()`, `requestDisallowInterceptTouchEvent()`, `isDrawerOpen()`, `isDrawerVisible()`, `hasPeekingDrawer()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `checkLayoutParams()`, `addFocusables()`, `hasVisibleDrawer()`, `findVisibleDrawer()`, `cancelChildViewTouch()`, `getChildAt()`, `onKeyDown()`, `onKeyUp()`, `onRestoreInstanceState()`, `onSaveInstanceState()`, `addView()`, `includeChildForAccessibility()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `run()`, `ViewDragCallback()`, `setDragger()`, `removeCallbacks()`, `tryCaptureView()`, `onViewDragStateChanged()`, `onViewPositionChanged()`, `onViewCaptured()`, `closeOtherDrawer()`, `onViewReleased()`, `onEdgeTouched()`, `peekDrawer()`, `onEdgeLock()`, `onEdgeDragStarted()`, `getViewHorizontalDragRange()`, `clampViewPositionHorizontal()`, `clampViewPositionVertical()`, `AccessibilityDelegate()`, `onInitializeAccessibilityNodeInfo()`, `copyNodeInfoNoChildren()`, `addChildrenForAccessibility()`, `onInitializeAccessibilityEvent()`, `dispatchPopulateAccessibilityEvent()`, `onRequestSendAccessibilityEvent()`, `ChildAccessibilityDelegate()`
- **`EdgeEffectCompat`** — 9 function(s): `EdgeEffectCompat()`, `setSize()`, `isFinished()`, `finish()`, `onPull()`, `if()`, `onRelease()`, `onAbsorb()`, `draw()`
- **`ExploreByTouchHelper`** — 54 function(s): `obtainBounds()`, `get()`, `size()`, `getVirtualViewAt()`, `getVisibleVirtualViews()`, `onPerformActionForVirtualView()`, `onPopulateNodeForVirtualView()`, `ExploreByTouchHelper()`, `if()`, `IllegalArgumentException()`, `getAccessibilityNodeProvider()`, `dispatchHoverEvent()`, `updateHoveredVirtualView()`, `dispatchKeyEvent()`, `switch()`, `for()`, `clickKeyboardFocusedVirtualView()`, `onFocusChanged()`, `clearKeyboardFocusForVirtualView()`, `moveFocus()`, `getAccessibilityFocusedVirtualViewId()`, `getKeyboardFocusedVirtualViewId()`, `keyToDirection()`, `getBoundsInParent()`, `guessPreviouslyFocusedRect()`, `requestKeyboardFocusForVirtualView()`, `getAllNodes()`, `sendEventForVirtualView()`, `invalidateRoot()`, `invalidateVirtualView()`, `getFocusedVirtualView()`, `onVirtualViewKeyboardFocusChanged()`, `createEvent()`, `createEventForHost()`, `createEventForChild()`, `onInitializeAccessibilityEvent()`, `onPopulateEventForHost()`, `onPopulateEventForVirtualView()`, `RuntimeException()`, `obtainAccessibilityNodeInfo()`, `createNodeForHost()`, `createNodeForChild()`, `onInitializeAccessibilityNodeInfo()`, `onPopulateNodeForHost()`, `performAction()`, `performActionForHost()`, `performActionForChild()`, `requestAccessibilityFocus()`, `clearAccessibilityFocus()`, `isVisibleToUser()`, `while()`, `MyNodeProvider()`, `createAccessibilityNodeInfo()`, `findFocus()`
- **`FocusStrategy`** — 25 function(s): `obtainBounds()`, `get()`, `size()`, `findNextFocusInRelativeDirection()`, `for()`, `if()`, `return()`, `IllegalArgumentException()`, `getNextFocusable()`, `getPreviousFocusable()`, `SequentialComparator()`, `compare()`, `findNextFocusInAbsoluteDirection()`, `isBetterCandidate()`, `beamBeats()`, `getWeightedDistanceFor()`, `isCandidate()`, `beamsOverlap()`, `isToDirectionOf()`, `majorAxisDistance()`, `majorAxisDistanceRaw()`, `majorAxisDistanceToFarEdge()`, `majorAxisDistanceToFarEdgeRaw()`, `minorAxisDistance()`, `FocusStrategy()`
- **`ImageViewCompat`** — 7 function(s): `getImageTintList()`, `if()`, `return()`, `setImageTintList()`, `getImageTintMode()`, `setImageTintMode()`, `ImageViewCompat()`
- **`ListPopupWindowCompat`** — 3 function(s): `ListPopupWindowCompat()`, `createDragToOpenListener()`, `if()`
- **`ListViewAutoScrollHelper`** — 6 function(s): `ListViewAutoScrollHelper()`, `super()`, `scrollTargetBy()`, `canTargetScrollHorizontally()`, `canTargetScrollVertically()`, `if()`
- **`ListViewCompat`** — 4 function(s): `scrollListBy()`, `if()`, `canScrollList()`, `ListViewCompat()`
- **`NestedScrollView`** — 108 function(s): `onScrollChange()`, `NestedScrollView()`, `this()`, `super()`, `initScrollView()`, `setFillViewport()`, `setNestedScrollingEnabled()`, `startNestedScroll()`, `stopNestedScroll()`, `hasNestedScrollingParent()`, `dispatchNestedScroll()`, `dispatchNestedPreScroll()`, `isNestedScrollingEnabled()`, `dispatchNestedFling()`, `dispatchNestedPreFling()`, `onStartNestedScroll()`, `return()`, `onNestedScrollAccepted()`, `onStopNestedScroll()`, `onNestedScroll()`, `scrollBy()`, `onNestedPreScroll()`, `onNestedFling()`, `if()`, `flingWithNestedDispatch()`, `onNestedPreFling()`, `getNestedScrollAxes()`, `shouldDelayChildPressedState()`, `getTopFadingEdgeStrength()`, `getBottomFadingEdgeStrength()`, `getMaxScrollAmount()`, `setFocusable()`, `setDescendantFocusability()`, `setWillNotDraw()`, `addView()`, `IllegalStateException()`, `setOnScrollChangeListener()`, `canScroll()`, `isFillViewport()`, `requestLayout()`, `isSmoothScrollingEnabled()`, `setSmoothScrollingEnabled()`, `onScrollChanged()`, `onMeasure()`, `dispatchKeyEvent()`, `executeKeyEvent()`, `pageScroll()`, `inChild()`, `initOrResetVelocityTracker()`, `initVelocityTrackerIfNotExists()`, `recycleVelocityTracker()`, `requestDisallowInterceptTouchEvent()`, `onInterceptTouchEvent()`, `onSecondaryPointerUp()`, `onTouchEvent()`, `ensureGlows()`, `endDrag()`, `onGenericMotionEvent()`, `getVerticalScrollFactorCompat()`, `onOverScrolled()`, `overScrollByCompat()`, `getScrollRange()`, `findFocusableViewInBounds()`, `for()`, `scrollAndFocus()`, `fullScroll()`, `doScrollY()`, `arrowScroll()`, `offsetDescendantRectToMyCoords()`, `requestFocus()`, `isOffScreen()`, `isWithinDeltaOfScreen()`, `smoothScrollBy()`, `smoothScrollTo()`, `computeVerticalScrollRange()`, `computeVerticalScrollOffset()`, `computeVerticalScrollExtent()`, `computeHorizontalScrollRange()`, `computeHorizontalScrollOffset()`, `computeHorizontalScrollExtent()`, `measureChild()`, `measureChildWithMargins()`, `computeScroll()`, `scrollToChild()`, `scrollToChildRect()`, `computeScrollDeltaToGetChildRectOnScreen()`, `requestChildFocus()`, `onRequestFocusInDescendants()`, `requestChildRectangleOnScreen()`, `onLayout()`, `scrollTo()`, `onAttachedToWindow()`, `onSizeChanged()`, `isViewDescendantOf()`, `fling()`, `draw()`, `clamp()`, `onRestoreInstanceState()`, `onSaveInstanceState()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `toString()`, `AccessibilityDelegate()`, `performAccessibilityAction()`, `onInitializeAccessibilityNodeInfo()`, `onInitializeAccessibilityEvent()`
- **`PopupMenuCompat`** — 4 function(s): `PopupMenuCompat()`, `getDragToOpenListener()`, `if()`, `return()`
- **`PopupWindowCompat`** — 8 function(s): `PopupWindowCompat()`, `showAsDropDown()`, `if()`, `setOverlapAnchor()`, `getOverlapAnchor()`, `return()`, `setWindowLayoutType()`, `getWindowLayoutType()`
- **`ResourceCursorAdapter`** — 6 function(s): `ResourceCursorAdapter()`, `super()`, `newView()`, `newDropDownView()`, `setViewResource()`, `setDropDownViewResource()`
- **`ScrollerCompat`** — 16 function(s): `create()`, `ScrollerCompat()`, `isFinished()`, `getCurrX()`, `getCurrY()`, `getFinalX()`, `getFinalY()`, `getCurrVelocity()`, `computeScrollOffset()`, `startScroll()`, `fling()`, `springBack()`, `abortAnimation()`, `notifyHorizontalEdgeReached()`, `notifyVerticalEdgeReached()`, `isOverScrolled()`
- **`SimpleCursorAdapter`** — 19 function(s): `convertToString()`, `setViewValue()`, `SimpleCursorAdapter()`, `super()`, `findColumns()`, `bindView()`, `for()`, `if()`, `setViewText()`, `setViewImage()`, `IllegalStateException()`, `getViewBinder()`, `setViewBinder()`, `getStringConversionColumn()`, `setStringConversionColumn()`, `getCursorToStringConverter()`, `setCursorToStringConverter()`, `swapCursor()`, `changeCursorAndColumns()`
- **`SlidingPaneLayout`** — 88 function(s): `onPanelClosed()`, `onPanelOpened()`, `onPanelSlide()`, `SlidingPaneLayout()`, `this()`, `super()`, `setWillNotDraw()`, `setParallaxDistance()`, `requestLayout()`, `getParallaxDistance()`, `setSliderFadeColor()`, `getSliderFadeColor()`, `setCoveredFadeColor()`, `getCoveredFadeColor()`, `setPanelSlideListener()`, `dispatchOnPanelSlide()`, `if()`, `dispatchOnPanelOpened()`, `sendAccessibilityEvent()`, `dispatchOnPanelClosed()`, `updateObscuredViewsVisibility()`, `while()`, `setAllChildrenVisible()`, `for()`, `viewIsOpaque()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `onMeasure()`, `IllegalStateException()`, `setMeasuredDimension()`, `onLayout()`, `parallaxOtherViews()`, `dimChildView()`, `onSizeChanged()`, `requestChildFocus()`, `onInterceptTouchEvent()`, `onTouchEvent()`, `closePane()`, `openPane()`, `smoothSlideOpen()`, `smoothSlideClosed()`, `isOpen()`, `canSlide()`, `isSlideable()`, `onPanelDragged()`, `invalidateChildRegion()`, `drawChild()`, `smoothSlideTo()`, `computeScroll()`, `setShadowDrawable()`, `setShadowDrawableLeft()`, `setShadowDrawableRight()`, `setShadowResource()`, `setShadowResourceLeft()`, `setShadowResourceRight()`, `draw()`, `canScroll()`, `isDimmed()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `checkLayoutParams()`, `return()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `DragHelperCallback()`, `tryCaptureView()`, `onViewDragStateChanged()`, `onViewCaptured()`, `onViewPositionChanged()`, `onViewReleased()`, `getViewHorizontalDragRange()`, `clampViewPositionHorizontal()`, `clampViewPositionVertical()`, `onEdgeDragStarted()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `AccessibilityDelegate()`, `onInitializeAccessibilityNodeInfo()`, `copyNodeInfoNoChildren()`, `onInitializeAccessibilityEvent()`, `onRequestSendAccessibilityEvent()`, `filter()`, `DisableLayerRunnable()`, `run()`, `isLayoutRtlSupport()`
- **`Space`** — 9 function(s): `Space()`, `super()`, `if()`, `setVisibility()`, `this()`, `draw()`, `getDefaultSize2()`, `onMeasure()`, `setMeasuredDimension()`
- **`SwipeRefreshLayout`** — 78 function(s): `canChildScrollUp()`, `onRefresh()`, `reset()`, `setColorViewAlpha()`, `if()`, `setAnimationProgress()`, `setTargetOffsetTopAndBottom()`, `setEnabled()`, `onDetachedFromWindow()`, `setProgressViewOffset()`, `getProgressViewStartOffset()`, `getProgressViewEndOffset()`, `setProgressViewEndTarget()`, `setSlingshotDistance()`, `setSize()`, `SwipeRefreshLayout()`, `this()`, `super()`, `onAnimationStart()`, `onAnimationRepeat()`, `onAnimationEnd()`, `applyTransformation()`, `setWillNotDraw()`, `createProgressView()`, `setChildrenDrawingOrderEnabled()`, `setNestedScrollingEnabled()`, `moveToStart()`, `getChildDrawingOrder()`, `addView()`, `setOnRefreshListener()`, `setRefreshing()`, `startScaleUpAnimation()`, `ensureTarget()`, `animateOffsetToCorrectPosition()`, `startScaleDownAnimation()`, `startProgressAlphaStartAnimation()`, `startProgressAlphaMaxAnimation()`, `startAlphaAnimation()`, `setProgressBackgroundColor()`, `setProgressBackgroundColorSchemeResource()`, `setProgressBackgroundColorSchemeColor()`, `setColorScheme()`, `setColorSchemeResources()`, `for()`, `setColorSchemeColors()`, `isRefreshing()`, `setDistanceToTriggerSync()`, `onLayout()`, `onMeasure()`, `getProgressCircleDiameter()`, `setOnChildScrollUpCallback()`, `onInterceptTouchEvent()`, `startDragging()`, `onSecondaryPointerUp()`, `requestDisallowInterceptTouchEvent()`, `onStartNestedScroll()`, `return()`, `onNestedScrollAccepted()`, `startNestedScroll()`, `onNestedPreScroll()`, `moveSpinner()`, `getNestedScrollAxes()`, `onStopNestedScroll()`, `finishSpinner()`, `stopNestedScroll()`, `onNestedScroll()`, `dispatchNestedScroll()`, `isNestedScrollingEnabled()`, `hasNestedScrollingParent()`, `dispatchNestedPreScroll()`, `onNestedPreFling()`, `dispatchNestedPreFling()`, `onNestedFling()`, `dispatchNestedFling()`, `isAnimationRunning()`, `animateOffsetToStartPosition()`, `onTouchEvent()`, `startScaleDownReturnToStartAnimation()`
- **`TextViewCompat`** — 46 function(s): `TextViewCompat()`, `retrieveField()`, `retrieveIntFromField()`, `setCompoundDrawablesRelative()`, `if()`, `setCompoundDrawablesRelativeWithIntrinsicBounds()`, `getMaxLines()`, `getMinLines()`, `setTextAppearance()`, `getCompoundDrawablesRelative()`, `setAutoSizeTextTypeWithDefaults()`, `setAutoSizeTextTypeUniformWithConfiguration()`, `setAutoSizeTextTypeUniformWithPresetSizes()`, `getAutoSizeTextType()`, `return()`, `getAutoSizeStepGranularity()`, `getAutoSizeMinTextSize()`, `getAutoSizeMaxTextSize()`, `getAutoSizeTextAvailableSizes()`, `setCustomSelectionActionModeCallback()`, `wrapCustomSelectionActionModeCallback()`, `OreoCallback()`, `onCreateActionMode()`, `onPrepareActionMode()`, `recomputeProcessTextMenuItems()`, `onActionItemClicked()`, `onDestroyActionMode()`, `for()`, `getSupportedActivities()`, `isSupportedActivity()`, `createProcessTextIntentForResolveInfo()`, `createProcessTextIntent()`, `isEditable()`, `Intent()`, `setFirstBaselineToTopHeight()`, `setLastBaselineToBottomHeight()`, `getFirstBaselineToTopHeight()`, `getLastBaselineToBottomHeight()`, `setLineHeight()`, `getTextMetricsParams()`, `setTextMetricsParams()`, `setPrecomputedText()`, `IllegalArgumentException()`, `getTextDirectionHeuristic()`, `switch()`, `getTextDirection()`
- **`TintableCompoundButton`** — 4 function(s): `getSupportButtonTintList()`, `getSupportButtonTintMode()`, `setSupportButtonTintList()`, `setSupportButtonTintMode()`
- **`TintableImageSourceView`** — 4 function(s): `getSupportImageTintList()`, `getSupportImageTintMode()`, `setSupportImageTintList()`, `setSupportImageTintMode()`
- **`ViewDragHelper`** — 65 function(s): `getInterpolation()`, `return()`, `run()`, `tryCaptureView()`, `onViewDragStateChanged()`, `onViewPositionChanged()`, `onViewCaptured()`, `onViewReleased()`, `onEdgeTouched()`, `onEdgeLock()`, `onEdgeDragStarted()`, `getOrderedChildIndex()`, `getViewHorizontalDragRange()`, `getViewVerticalDragRange()`, `clampViewPositionHorizontal()`, `clampViewPositionVertical()`, `create()`, `ViewDragHelper()`, `if()`, `IllegalArgumentException()`, `setMinVelocity()`, `getMinVelocity()`, `getViewDragState()`, `setEdgeTrackingEnabled()`, `getEdgeSize()`, `captureChildView()`, `setDragState()`, `getCapturedView()`, `getActivePointerId()`, `getTouchSlop()`, `cancel()`, `clearMotionHistory()`, `abort()`, `smoothSlideViewTo()`, `settleCapturedViewAt()`, `IllegalStateException()`, `forceSettleCapturedViewAt()`, `computeSettleDuration()`, `computeAxisDuration()`, `clampMag()`, `distanceInfluenceForSnapDuration()`, `flingCapturedView()`, `continueSettling()`, `dispatchViewReleased()`, `ensureMotionHistorySizeForId()`, `saveInitialMotion()`, `saveLastMotion()`, `for()`, `isPointerDown()`, `tryCaptureViewForDrag()`, `canScroll()`, `shouldInterceptTouchEvent()`, `while()`, `reportNewEdgeDrags()`, `processTouchEvent()`, `releaseViewForPointerUp()`, `dragTo()`, `checkNewEdgeDrag()`, `checkTouchSlop()`, `isEdgeTouched()`, `isCapturedViewUnder()`, `isViewUnder()`, `findTopChildUnder()`, `getEdgesTouched()`, `isValidPointerForActionMove()`
- **`ViewGroupUtils`** — 5 function(s): `offsetDescendantRect()`, `if()`, `offsetDescendantMatrix()`, `getDescendantRect()`, `ViewGroupUtils()`

</details>

### Package `android.support.v7.app`  (18 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ActionBar` | class | ViewGroup.MarginLayoutParams | 368 | 116 |
| `ActionBarDrawerToggle` | class | DrawerLayout.DrawerListener | 352 | 90 |
| `ActionBarDrawerToggleHoneycomb` | class | — | 95 | 12 |
| `AlertController` | class | Handler | 917 | 166 |
| `AlertDialog` | class | AppCompatDialog implements DialogInterface | 435 | 76 |
| `AppCompatActivity` | class | FragmentActivity implements AppCompatCallback, TaskStackBuilder.SupportParentable, Acti... | 339 | 94 |
| `AppCompatCallback` | class | — | 13 | 3 |
| `AppCompatDelegate` | class | — | 127 | 39 |
| `AppCompatDelegateImpl` | class | AppCompatDelegate implements MenuBuilder.Callback, LayoutInflater.Factory2 | 2,153 | 487 |
| `AppCompatDialog` | class | Dialog implements AppCompatCallback | 150 | 44 |
| `AppCompatDialogFragment` | class | DialogFragment | 31 | 6 |
| `AppCompatViewInflater` | class | View.OnClickListener | 402 | 96 |
| `NavItemSelectedListener` | class | AdapterView.OnItemSelectedListener | 27 | 4 |
| `ResourcesFlusher` | class | — | 171 | 30 |
| `ToolbarActionBar` | class | ActionBar | 557 | 130 |
| `TwilightCalculator` | class | — | 65 | 6 |
| `TwilightManager` | class | — | 133 | 18 |
| `WindowDecorActionBar` | class | ActionBar implements ActionBarOverlayLayout.ActionBarVisibilityCallback | 1,298 | 305 |

<details>
<summary><b>Function list for <code>android.support.v7.app</code></b> (click to expand)</summary>

- **`ActionBar`** — 84 function(s): `onMenuVisibilityChanged()`, `onNavigationItemSelected()`, `getContentDescription()`, `getCustomView()`, `getIcon()`, `getPosition()`, `getTag()`, `getText()`, `select()`, `setContentDescription()`, `setCustomView()`, `setIcon()`, `setTabListener()`, `setTag()`, `setText()`, `onTabReselected()`, `onTabSelected()`, `onTabUnselected()`, `addOnMenuVisibilityListener()`, `addTab()`, `getDisplayOptions()`, `getHeight()`, `getNavigationItemCount()`, `getNavigationMode()`, `getSelectedNavigationIndex()`, `getSelectedTab()`, `getSubtitle()`, `getTabAt()`, `getTabCount()`, `getTitle()`, `hide()`, `isShowing()`, `newTab()`, `removeAllTabs()`, `removeOnMenuVisibilityListener()`, `removeTab()`, `removeTabAt()`, `selectTab()`, `setBackgroundDrawable()`, `setDisplayHomeAsUpEnabled()`, `setDisplayOptions()`, `setDisplayShowCustomEnabled()`, `setDisplayShowHomeEnabled()`, `setDisplayShowTitleEnabled()`, `setDisplayUseLogoEnabled()`, `setListNavigationCallbacks()`, `setLogo()`, `setNavigationMode()`, `setSelectedNavigationItem()`, `setSubtitle()`, `setTitle()`, `show()`, `setStackedBackgroundDrawable()`, `setSplitBackgroundDrawable()`, `setHomeButtonEnabled()`, `getThemedContext()`, `isTitleTruncated()`, `setHomeAsUpIndicator()`, `setHomeActionContentDescription()`, `setHideOnContentScrollEnabled()`, `if()`, `UnsupportedOperationException()`, `isHideOnContentScrollEnabled()`, `getHideOffset()`, `setHideOffset()`, `setElevation()`, `getElevation()`, `setDefaultDisplayHomeAsUpEnabled()`, `setShowHideAnimationEnabled()`, `onConfigurationChanged()`, `dispatchMenuVisibilityChanged()`, `startActionMode()`, `openOptionsMenu()`, `closeOptionsMenu()`, `invalidateOptionsMenu()`, `onMenuKeyEvent()`, `onKeyShortcut()`, `collapseActionView()`, `setWindowTitle()`, `requestFocus()`, `onDestroy()`, `LayoutParams()`, `super()`, `this()`
- **`ActionBarDrawerToggle`** — 31 function(s): `getActionBarThemedContext()`, `getThemeUpIndicator()`, `isNavigationVisible()`, `setActionBarDescription()`, `setActionBarUpIndicator()`, `getDrawerToggleDelegate()`, `ActionBarDrawerToggle()`, `this()`, `if()`, `onClick()`, `syncState()`, `setPosition()`, `onConfigurationChanged()`, `onOptionsItemSelected()`, `toggle()`, `setHomeAsUpIndicator()`, `isDrawerIndicatorEnabled()`, `setDrawerIndicatorEnabled()`, `getDrawerArrowDrawable()`, `setDrawerArrowDrawable()`, `setDrawerSlideAnimationEnabled()`, `isDrawerSlideAnimationEnabled()`, `onDrawerSlide()`, `onDrawerOpened()`, `onDrawerClosed()`, `onDrawerStateChanged()`, `getToolbarNavigationClickListener()`, `setToolbarNavigationClickListener()`, `FrameworkActionBarDelegate()`, `return()`, `ToolbarCompatDelegate()`
- **`ActionBarDrawerToggleHoneycomb`** — 6 function(s): `setActionBarUpIndicator()`, `if()`, `setActionBarDescription()`, `getThemeUpIndicator()`, `SetIndicatorInfo()`, `ActionBarDrawerToggleHoneycomb()`
- **`AlertController`** — 53 function(s): `onClick()`, `if()`, `ButtonHandler()`, `handleMessage()`, `shouldCenterSingleButton()`, `AlertController()`, `canTextInput()`, `while()`, `installContent()`, `setupView()`, `selectContentView()`, `setTitle()`, `setCustomTitle()`, `setMessage()`, `setView()`, `setButtonPanelLayoutHint()`, `setButton()`, `IllegalArgumentException()`, `setIcon()`, `getIconAttributeResId()`, `getListView()`, `getButton()`, `onKeyDown()`, `onKeyUp()`, `resolvePanel()`, `return()`, `setupCustomContent()`, `setupContent()`, `setupButtons()`, `setupTitle()`, `setScrollIndicators()`, `onScrollChange()`, `run()`, `onScrollStateChanged()`, `onScroll()`, `manageScrollIndicators()`, `centerButton()`, `RecycleListView()`, `this()`, `super()`, `setHasDecor()`, `setPadding()`, `onPrepareListView()`, `AlertParams()`, `apply()`, `createListView()`, `getView()`, `bindView()`, `newView()`, `onItemClick()`, `CheckedItemAdapter()`, `hasStableIds()`, `getItemId()`
- **`AlertDialog`** — 40 function(s): `AlertDialog()`, `this()`, `super()`, `setCancelable()`, `setOnCancelListener()`, `resolveDialogTheme()`, `if()`, `getButton()`, `getListView()`, `setTitle()`, `setCustomTitle()`, `setMessage()`, `setView()`, `setButtonPanelLayoutHint()`, `setButton()`, `setIcon()`, `setIconAttribute()`, `getContext()`, `onCreate()`, `onKeyDown()`, `onKeyUp()`, `Builder()`, `setPositiveButton()`, `setPositiveButtonIcon()`, `setNegativeButton()`, `setNegativeButtonIcon()`, `setNeutralButton()`, `setNeutralButtonIcon()`, `setOnDismissListener()`, `setOnKeyListener()`, `setItems()`, `setAdapter()`, `setCursor()`, `setMultiChoiceItems()`, `setSingleChoiceItems()`, `setOnItemSelectedListener()`, `setInverseBackgroundForced()`, `setRecycleOnMeasureEnabled()`, `create()`, `show()`
- **`AppCompatActivity`** — 50 function(s): `onCreate()`, `if()`, `onApplyThemeResource()`, `setTheme()`, `onPostCreate()`, `getDelegate()`, `getSupportActionBar()`, `setSupportActionBar()`, `getMenuInflater()`, `setContentView()`, `addContentView()`, `onConfigurationChanged()`, `onPostResume()`, `onStart()`, `onStop()`, `findViewById()`, `return()`, `onMenuItemSelected()`, `onSupportNavigateUp()`, `onDestroy()`, `onTitleChanged()`, `supportRequestWindowFeature()`, `supportInvalidateOptionsMenu()`, `invalidateOptionsMenu()`, `onSupportActionModeStarted()`, `onSupportActionModeFinished()`, `onWindowStartingSupportActionMode()`, `startSupportActionMode()`, `setSupportProgressBarVisibility()`, `setSupportProgressBarIndeterminateVisibility()`, `setSupportProgressBarIndeterminate()`, `setSupportProgress()`, `onCreateSupportNavigateUpTaskStack()`, `onPrepareSupportNavigateUpTaskStack()`, `finish()`, `supportNavigateUpTo()`, `getSupportParentActivityIntent()`, `supportShouldUpRecreateTask()`, `onContentChanged()`, `onSupportContentChanged()`, `getDrawerToggleDelegate()`, `onMenuOpened()`, `onPanelClosed()`, `onSaveInstanceState()`, `dispatchKeyEvent()`, `getResources()`, `performMenuItemShortcut()`, `onKeyDown()`, `openOptionsMenu()`, `closeOptionsMenu()`
- **`AppCompatCallback`** — 3 function(s): `onSupportActionModeFinished()`, `onSupportActionModeStarted()`, `onWindowStartingSupportActionMode()`
- **`AppCompatDelegate`** — 33 function(s): `addContentView()`, `applyDayNight()`, `createView()`, `findViewById()`, `getDrawerToggleDelegate()`, `getMenuInflater()`, `getSupportActionBar()`, `hasWindowFeature()`, `installViewFactory()`, `invalidateOptionsMenu()`, `isHandleNativeActionModesEnabled()`, `onConfigurationChanged()`, `onCreate()`, `onDestroy()`, `onPostCreate()`, `onPostResume()`, `onSaveInstanceState()`, `onStart()`, `onStop()`, `requestWindowFeature()`, `setContentView()`, `setHandleNativeActionModesEnabled()`, `setLocalNightMode()`, `setSupportActionBar()`, `setTitle()`, `startSupportActionMode()`, `create()`, `AppCompatDelegateImpl()`, `setDefaultNightMode()`, `if()`, `getDefaultNightMode()`, `setCompatVectorFromResourcesEnabled()`, `isCompatVectorFromResourcesEnabled()`
- **`AppCompatDelegateImpl`** — 141 function(s): `run()`, `if()`, `uncaughtException()`, `shouldWrapException()`, `AppCompatDelegateImpl()`, `IllegalStateException()`, `onCreate()`, `onPostCreate()`, `ensureSubDecor()`, `getSupportActionBar()`, `initWindowDecorActionBar()`, `peekSupportActionBar()`, `getWindowCallback()`, `setSupportActionBar()`, `invalidateOptionsMenu()`, `getActionBarThemedContext()`, `getMenuInflater()`, `findViewById()`, `return()`, `onConfigurationChanged()`, `applyDayNight()`, `onStart()`, `onStop()`, `onPostResume()`, `setContentView()`, `addContentView()`, `onSaveInstanceState()`, `onDestroy()`, `applyFixedSizeWindow()`, `onSubDecorInstalled()`, `invalidatePanelMenu()`, `createSubDecor()`, `requestWindowFeature()`, `onApplyWindowInsets()`, `onFitSystemWindows()`, `IllegalArgumentException()`, `while()`, `onAttachedFromWindow()`, `onDetachedFromWindow()`, `throwFeatureRequestIfSubDecorInstalled()`, `hasWindowFeature()`, `setTitle()`, `getTitle()`, `onPanelClosed()`, `closePanel()`, `onMenuOpened()`, `onMenuItemSelected()`, `onMenuModeChange()`, `reopenMenu()`, `startSupportActionMode()`, `startSupportActionModeFromWindow()`, `endOnGoingFadeAnimation()`, `onAnimationStart()`, `onAnimationEnd()`, `shouldAnimateActionModeView()`, `setHandleNativeActionModesEnabled()`, `isHandleNativeActionModesEnabled()`, `onBackPressed()`, `onKeyShortcut()`, `preparePanel()`, `dispatchKeyEvent()`, `onKeyUp()`, `onKeyUpPanel()`, `onKeyDown()`, `onKeyDownPanel()`, `createView()`, `shouldInheritContext()`, `installViewFactory()`, `onCreateView()`, `openPanel()`, `initializePanelDecor()`, `initializePanelMenu()`, `initializePanelContent()`, `checkCloseActionMenu()`, `callOnPanelClosed()`, `findMenuPanel()`, `for()`, `getPanelState()`, `performPanelShortcut()`, `doInvalidatePanelMenu()`, `updateStatusGuard()`, `AndroidRuntimeException()`, `sanitizeWindowFeatureId()`, `getSubDecor()`, `dismissPopups()`, `ensureAutoNightModeManager()`, `setLocalNightMode()`, `mapNightMode()`, `getNightMode()`, `updateForNightMode()`, `getAutoNightModeManager()`, `shouldRecreateOnNightModeChange()`, `ActionModeCallbackWrapperV9()`, `onCreateActionMode()`, `onPrepareActionMode()`, `onActionItemClicked()`, `onDestroyActionMode()`, `PanelMenuPresenterCallback()`, `onCloseMenu()`, `onOpenSubMenu()`, `ActionMenuPresenterCallback()`, `PanelFeatureState()`, `hasPanelItems()`, `clearMenuPresenters()`, `setStyle()`, `setMenu()`, `getListMenuView()`, `onRestoreInstanceState()`, `applyFrozenState()`, `createFromParcel()`, `newArray()`, `SavedState()`, `describeContents()`, `writeToParcel()`, `readFromParcel()`, `ListMenuDecorView()`, `super()`, `onInterceptTouchEvent()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `isOutOfBounds()`, `AppCompatWindowCallback()`, `dispatchKeyShortcutEvent()`, `onCreatePanelMenu()`, `onContentChanged()`, `onPreparePanel()`, `onWindowStartingActionMode()`, `startAsSupportActionMode()`, `onProvideKeyboardShortcuts()`, `AutoNightModeManager()`, `getApplyableNightMode()`, `dispatchTimeChanged()`, `setup()`, `cleanup()`, `onReceive()`, `getDrawerToggleDelegate()`, `ActionBarDrawableToggleImpl()`, `getThemeUpIndicator()`, `isNavigationVisible()`, `setActionBarUpIndicator()`, `setActionBarDescription()`
- **`AppCompatDialog`** — 21 function(s): `AppCompatDialog()`, `this()`, `super()`, `superDispatchKeyEvent()`, `getDelegate()`, `onCreate()`, `getSupportActionBar()`, `setContentView()`, `findViewById()`, `return()`, `setTitle()`, `addContentView()`, `onStop()`, `supportRequestWindowFeature()`, `invalidateOptionsMenu()`, `if()`, `getThemeResId()`, `onSupportActionModeStarted()`, `onSupportActionModeFinished()`, `onWindowStartingSupportActionMode()`, `dispatchKeyEvent()`
- **`AppCompatDialogFragment`** — 4 function(s): `onCreateDialog()`, `AppCompatDialog()`, `setupDialog()`, `if()`
- **`AppCompatViewInflater`** — 41 function(s): `createView()`, `if()`, `switch()`, `verifyNotNull()`, `checkOnClickListener()`, `createTextView()`, `AppCompatTextView()`, `createImageView()`, `AppCompatImageView()`, `createButton()`, `AppCompatButton()`, `createEditText()`, `AppCompatEditText()`, `createSpinner()`, `AppCompatSpinner()`, `createImageButton()`, `AppCompatImageButton()`, `createCheckBox()`, `AppCompatCheckBox()`, `createRadioButton()`, `AppCompatRadioButton()`, `createCheckedTextView()`, `AppCompatCheckedTextView()`, `createAutoCompleteTextView()`, `AppCompatAutoCompleteTextView()`, `createMultiAutoCompleteTextView()`, `AppCompatMultiAutoCompleteTextView()`, `createRatingBar()`, `AppCompatRatingBar()`, `createSeekBar()`, `AppCompatSeekBar()`, `IllegalStateException()`, `createViewFromTag()`, `createViewByPrefix()`, `for()`, `themifyContext()`, `ContextThemeWrapper()`, `DeclaredOnClickListener()`, `onClick()`, `resolveMethod()`, `while()`
- **`NavItemSelectedListener`** — 4 function(s): `NavItemSelectedListener()`, `onItemSelected()`, `if()`, `onNothingSelected()`
- **`ResourcesFlusher`** — 7 function(s): `flush()`, `if()`, `flushNougats()`, `flushMarshmallows()`, `flushLollipops()`, `flushThemedResourcesCache()`, `ResourcesFlusher()`
- **`ToolbarActionBar`** — 81 function(s): `run()`, `onMenuItemClick()`, `ToolbarActionBar()`, `getWrappedWindowCallback()`, `setCustomView()`, `if()`, `setIcon()`, `setLogo()`, `setStackedBackgroundDrawable()`, `setSplitBackgroundDrawable()`, `setHomeButtonEnabled()`, `setElevation()`, `getElevation()`, `getThemedContext()`, `isTitleTruncated()`, `setHomeAsUpIndicator()`, `setHomeActionContentDescription()`, `setDefaultDisplayHomeAsUpEnabled()`, `setShowHideAnimationEnabled()`, `onConfigurationChanged()`, `setListNavigationCallbacks()`, `setSelectedNavigationItem()`, `IllegalStateException()`, `getSelectedNavigationIndex()`, `getNavigationItemCount()`, `setTitle()`, `setWindowTitle()`, `requestFocus()`, `setSubtitle()`, `setDisplayOptions()`, `setDisplayUseLogoEnabled()`, `setDisplayShowHomeEnabled()`, `setDisplayHomeAsUpEnabled()`, `setDisplayShowTitleEnabled()`, `setDisplayShowCustomEnabled()`, `setBackgroundDrawable()`, `getCustomView()`, `getTitle()`, `getSubtitle()`, `getNavigationMode()`, `setNavigationMode()`, `IllegalArgumentException()`, `getDisplayOptions()`, `newTab()`, `UnsupportedOperationException()`, `addTab()`, `removeTab()`, `removeTabAt()`, `removeAllTabs()`, `selectTab()`, `getSelectedTab()`, `getTabAt()`, `getTabCount()`, `getHeight()`, `show()`, `hide()`, `isShowing()`, `openOptionsMenu()`, `closeOptionsMenu()`, `invalidateOptionsMenu()`, `collapseActionView()`, `populateOptionsMenu()`, `onMenuKeyEvent()`, `onKeyShortcut()`, `onDestroy()`, `addOnMenuVisibilityListener()`, `removeOnMenuVisibilityListener()`, `dispatchMenuVisibilityChanged()`, `for()`, `ToolbarCallbackWrapper()`, `super()`, `onPreparePanel()`, `onCreatePanelView()`, `View()`, `getMenu()`, `ActionMenuPresenterCallback()`, `onOpenSubMenu()`, `onCloseMenu()`, `MenuBuilderCallback()`, `onMenuItemSelected()`, `onMenuModeChange()`
- **`TwilightCalculator`** — 3 function(s): `getInstance()`, `if()`, `calculateTwilight()`
- **`TwilightManager`** — 10 function(s): `getInstance()`, `if()`, `setInstance()`, `isNight()`, `updateState()`, `getLastKnownLocation()`, `return()`, `getLastKnownLocationForProvider()`, `isStateValid()`, `TwilightState()`
- **`WindowDecorActionBar`** — 117 function(s): `onAnimationEnd()`, `if()`, `onAnimationUpdate()`, `WindowDecorActionBar()`, `init()`, `IllegalStateException()`, `setHomeButtonEnabled()`, `setHasEmbeddedTabs()`, `setHideOnContentScrollEnabled()`, `setElevation()`, `getDecorToolbar()`, `return()`, `getElevation()`, `onConfigurationChanged()`, `ensureTabsExist()`, `completeDeferredDestroyActionMode()`, `onWindowVisibilityChanged()`, `setShowHideAnimationEnabled()`, `addOnMenuVisibilityListener()`, `removeOnMenuVisibilityListener()`, `dispatchMenuVisibilityChanged()`, `for()`, `setCustomView()`, `setDisplayUseLogoEnabled()`, `setDisplayOptions()`, `setDisplayShowHomeEnabled()`, `setDisplayHomeAsUpEnabled()`, `setDisplayShowTitleEnabled()`, `setDisplayShowCustomEnabled()`, `setTitle()`, `setSubtitle()`, `setSelectedNavigationItem()`, `selectTab()`, `removeAllTabs()`, `cleanupTabs()`, `setWindowTitle()`, `requestFocus()`, `setBackgroundDrawable()`, `setStackedBackgroundDrawable()`, `setSplitBackgroundDrawable()`, `getCustomView()`, `getTitle()`, `getSubtitle()`, `getNavigationMode()`, `getDisplayOptions()`, `startActionMode()`, `animateToMode()`, `configureTab()`, `addTab()`, `newTab()`, `TabImpl()`, `removeTab()`, `removeTabAt()`, `getSelectedTab()`, `getHeight()`, `enableContentAnimations()`, `show()`, `updateVisibility()`, `showForActionMode()`, `showForSystem()`, `hide()`, `hideForActionMode()`, `hideForSystem()`, `isHideOnContentScrollEnabled()`, `getHideOffset()`, `setHideOffset()`, `checkShowingFlags()`, `doShow()`, `doHide()`, `isShowing()`, `shouldAnimateContextView()`, `getThemedContext()`, `isTitleTruncated()`, `setHomeAsUpIndicator()`, `setHomeActionContentDescription()`, `onContentScrollStarted()`, `onContentScrollStopped()`, `collapseActionView()`, `ActionModeImpl()`, `getMenuInflater()`, `SupportMenuInflater()`, `getMenu()`, `finish()`, `invalidate()`, `dispatchOnCreate()`, `setTitleOptionalHint()`, `isTitleOptional()`, `onMenuItemSelected()`, `onCloseMenu()`, `onSubMenuSelected()`, `MenuPopupHelper()`, `onCloseSubMenu()`, `onMenuModeChange()`, `getTag()`, `setTag()`, `getCallback()`, `setTabListener()`, `getIcon()`, `getPosition()`, `setPosition()`, `getText()`, `setIcon()`, `setText()`, `select()`, `setContentDescription()`, `getContentDescription()`, `setListNavigationCallbacks()`, `getSelectedNavigationIndex()`, `getNavigationItemCount()`, `getTabCount()`, `setNavigationMode()`, `getTabAt()`, `hasIcon()`, `setLogo()`, `hasLogo()`, `setDefaultDisplayHomeAsUpEnabled()`, `onKeyShortcut()`

</details>

### Package `android.support.v7.appcompat`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 1,669 | 13 |

<details>
<summary><b>Function list for <code>android.support.v7.appcompat</code></b> (click to expand)</summary>

- **`R`** — 13 function(s): `R()`, `anim()`, `attr()`, `bool()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.v7.cardview`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 80 | 6 |

<details>
<summary><b>Function list for <code>android.support.v7.cardview</code></b> (click to expand)</summary>

- **`R`** — 6 function(s): `R()`, `attr()`, `color()`, `dimen()`, `style()`, `styleable()`

</details>

### Package `android.support.v7.content.res`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AppCompatResources` | class | — | 116 | 20 |

<details>
<summary><b>Function list for <code>android.support.v7.content.res</code></b> (click to expand)</summary>

- **`AppCompatResources`** — 11 function(s): `AppCompatResources()`, `getColorStateList()`, `if()`, `addColorStateListToCache()`, `getDrawable()`, `inflateColorStateList()`, `getCachedColorStateList()`, `synchronized()`, `isColorInt()`, `getTypedValue()`, `ColorStateListCacheEntry()`

</details>

### Package `android.support.v7.graphics.drawable`  (5 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AnimatedStateListDrawableCompat` | class | StateListDrawable | 830 | 137 |
| `DrawableContainer` | class | Drawable implements Drawable.Callback | 1,118 | 253 |
| `DrawableWrapper` | class | Drawable implements Drawable.Callback | 195 | 41 |
| `DrawerArrowDrawable` | class | Drawable | 251 | 59 |
| `StateListDrawable` | class | DrawableContainer | 274 | 63 |

<details>
<summary><b>Function list for <code>android.support.v7.graphics.drawable</code></b> (click to expand)</summary>

- **`AnimatedStateListDrawableCompat`** — 52 function(s): `AnimatedStateListDrawableCompat()`, `this()`, `super()`, `setConstantState()`, `onStateChange()`, `jumpToCurrentState()`, `create()`, `if()`, `XmlPullParserException()`, `createFromXmlInner()`, `inflate()`, `setVisible()`, `updateStateFromTypedArray()`, `updateDensity()`, `inflateChildElements()`, `init()`, `addState()`, `IllegalArgumentException()`, `addTransition()`, `isStateful()`, `selectDrawable()`, `selectTransition()`, `start()`, `stop()`, `Transition()`, `reverse()`, `canReverse()`, `AnimatableTransition()`, `AnimationDrawableTransition()`, `AnimatedVectorDrawableTransition()`, `setDither()`, `while()`, `parseItem()`, `parseTransition()`, `mutate()`, `cloneConstantState()`, `AnimatedStateListState()`, `clearMutated()`, `addStateSet()`, `indexOfKeyframe()`, `getKeyframeIdAt()`, `indexOfTransition()`, `return()`, `isTransitionReversed()`, `transitionHasReversibleFlag()`, `newDrawable()`, `generateTransitionKey()`, `FrameInterpolator()`, `updateFrames()`, `for()`, `getTotalDuration()`, `getInterpolation()`
- **`DrawableContainer`** — 81 function(s): `draw()`, `if()`, `getChangingConfigurations()`, `needsMirroring()`, `getPadding()`, `getOutline()`, `setAlpha()`, `animate()`, `getAlpha()`, `setDither()`, `setColorFilter()`, `setTintList()`, `setTintMode()`, `setEnterFadeDuration()`, `setExitFadeDuration()`, `onBoundsChange()`, `isStateful()`, `setAutoMirrored()`, `isAutoMirrored()`, `jumpToCurrentState()`, `invalidateSelf()`, `setHotspot()`, `setHotspotBounds()`, `getHotspotBounds()`, `onStateChange()`, `onLevelChange()`, `onLayoutDirectionChanged()`, `getIntrinsicWidth()`, `getIntrinsicHeight()`, `getMinimumWidth()`, `getMinimumHeight()`, `invalidateDrawable()`, `getCallback()`, `scheduleDrawable()`, `unscheduleDrawable()`, `setVisible()`, `getOpacity()`, `setCurrentIndex()`, `selectDrawable()`, `getCurrentIndex()`, `initializeDrawableForDisplay()`, `run()`, `unscheduleSelf()`, `scheduleSelf()`, `getCurrent()`, `updateDensity()`, `applyTheme()`, `canApplyTheme()`, `getConstantState()`, `mutate()`, `setConstantState()`, `cloneConstantState()`, `clearMutated()`, `DrawableContainerState()`, `for()`, `addChild()`, `growArray()`, `invalidateCache()`, `getCapacity()`, `createAllFutures()`, `prepareDrawable()`, `getChildCount()`, `getChild()`, `setLayoutDirection()`, `setVariablePadding()`, `getConstantPadding()`, `setConstantSize()`, `isConstantSize()`, `getConstantWidth()`, `computeConstantSize()`, `getConstantHeight()`, `getConstantMinimumWidth()`, `getConstantMinimumHeight()`, `getEnterFadeDuration()`, `getExitFadeDuration()`, `while()`, `canConstantState()`, `BlockInvalidateCallback()`, `wrap()`, `unwrap()`, `resolveDensity()`
- **`DrawableWrapper`** — 39 function(s): `DrawableWrapper()`, `setWrappedDrawable()`, `draw()`, `onBoundsChange()`, `setChangingConfigurations()`, `getChangingConfigurations()`, `setDither()`, `setFilterBitmap()`, `setAlpha()`, `setColorFilter()`, `isStateful()`, `setState()`, `getState()`, `jumpToCurrentState()`, `getCurrent()`, `setVisible()`, `getOpacity()`, `getTransparentRegion()`, `getIntrinsicWidth()`, `getIntrinsicHeight()`, `getMinimumWidth()`, `getMinimumHeight()`, `getPadding()`, `invalidateDrawable()`, `invalidateSelf()`, `scheduleDrawable()`, `scheduleSelf()`, `unscheduleDrawable()`, `unscheduleSelf()`, `onLevelChange()`, `setAutoMirrored()`, `isAutoMirrored()`, `setTint()`, `setTintList()`, `setTintMode()`, `setHotspot()`, `setHotspotBounds()`, `getWrappedDrawable()`, `if()`
- **`DrawerArrowDrawable`** — 31 function(s): `DrawerArrowDrawable()`, `setColor()`, `setBarThickness()`, `setSpinEnabled()`, `setGapSize()`, `setArrowHeadLength()`, `if()`, `invalidateSelf()`, `getArrowHeadLength()`, `setArrowShaftLength()`, `getArrowShaftLength()`, `getBarLength()`, `setBarLength()`, `getColor()`, `getBarThickness()`, `getGapSize()`, `setDirection()`, `isSpinEnabled()`, `getDirection()`, `setVerticalMirror()`, `draw()`, `setAlpha()`, `setColorFilter()`, `getIntrinsicHeight()`, `getIntrinsicWidth()`, `getOpacity()`, `getProgress()`, `setProgress()`, `getPaint()`, `lerp()`, `return()`
- **`StateListDrawable`** — 32 function(s): `this()`, `addState()`, `if()`, `onStateChange()`, `isStateful()`, `selectDrawable()`, `inflate()`, `setVisible()`, `updateStateFromTypedArray()`, `updateDensity()`, `inflateChildElements()`, `while()`, `XmlPullParserException()`, `extractStateSet()`, `for()`, `getStateListState()`, `getStateCount()`, `getStateSet()`, `getStateDrawable()`, `getStateDrawableIndex()`, `mutate()`, `cloneConstantState()`, `StateListState()`, `clearMutated()`, `super()`, `addStateSet()`, `indexOfStateSet()`, `newDrawable()`, `StateListDrawable()`, `growArray()`, `applyTheme()`, `setConstantState()`

</details>

### Package `android.support.v7.recyclerview`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 265 | 11 |

<details>
<summary><b>Function list for <code>android.support.v7.recyclerview</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.v7.recyclerview.extensions`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AsyncDifferConfig` | class | — | 66 | 10 |
| `AsyncListDiffer` | class | Executor | 145 | 26 |
| `ListAdapter` | class | RecyclerView.ViewHolder> extends RecyclerView.Adapter<VH> | 35 | 5 |

<details>
<summary><b>Function list for <code>android.support.v7.recyclerview.extensions</code></b> (click to expand)</summary>

- **`AsyncDifferConfig`** — 9 function(s): `getMainThreadExecutor()`, `getBackgroundThreadExecutor()`, `getDiffCallback()`, `Builder()`, `setMainThreadExecutor()`, `setBackgroundThreadExecutor()`, `build()`, `if()`, `synchronized()`
- **`AsyncListDiffer`** — 15 function(s): `MainThreadExecutor()`, `execute()`, `AsyncListDiffer()`, `this()`, `if()`, `getCurrentList()`, `submitList()`, `run()`, `getOldListSize()`, `getNewListSize()`, `areItemsTheSame()`, `areContentsTheSame()`, `AssertionError()`, `getChangePayload()`, `latchList()`
- **`ListAdapter`** — 4 function(s): `ListAdapter()`, `submitList()`, `getItem()`, `getItemCount()`

</details>

### Package `android.support.v7.text`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AllCapsTransformationMethod` | class | TransformationMethod | 29 | 4 |

<details>
<summary><b>Function list for <code>android.support.v7.text</code></b> (click to expand)</summary>

- **`AllCapsTransformationMethod`** — 4 function(s): `AllCapsTransformationMethod()`, `getTransformation()`, `if()`, `onFocusChanged()`

</details>

### Package `android.support.v7.util`  (9 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AdapterListUpdateCallback` | class | ListUpdateCallback | 33 | 5 |
| `AsyncListUtil` | class | — | 334 | 68 |
| `BatchingListUpdateCallback` | class | ListUpdateCallback | 91 | 17 |
| `DiffUtil` | class | — | 514 | 103 |
| `ListUpdateCallback` | class | — | 13 | 4 |
| `MessageThreadUtil` | class | ThreadUtil<T> | 281 | 57 |
| `SortedList` | class | Comparator<T2>, ListUpdateCallback | 601 | 158 |
| `ThreadUtil` | class | — | 32 | 9 |
| `TileList` | class | — | 85 | 15 |

<details>
<summary><b>Function list for <code>android.support.v7.util</code></b> (click to expand)</summary>

- **`AdapterListUpdateCallback`** — 5 function(s): `AdapterListUpdateCallback()`, `onInserted()`, `onRemoved()`, `onMoved()`, `onChanged()`
- **`AsyncListUtil`** — 32 function(s): `updateItemCount()`, `if()`, `recycleAllTiles()`, `addTile()`, `while()`, `removeTile()`, `for()`, `isRequestedGeneration()`, `refresh()`, `updateRange()`, `requestTiles()`, `getTileStart()`, `loadTile()`, `flushTileCache()`, `recycleTile()`, `acquireTile()`, `isTileLoaded()`, `log()`, `AsyncListUtil()`, `isRefreshPending()`, `onRangeChanged()`, `getItem()`, `IndexOutOfBoundsException()`, `getItemCount()`, `fillData()`, `refreshData()`, `recycleData()`, `getMaxCachedTiles()`, `getItemRangeInto()`, `onDataRefresh()`, `onItemLoaded()`, `extendRangeInto()`
- **`BatchingListUpdateCallback`** — 7 function(s): `BatchingListUpdateCallback()`, `dispatchLastEvent()`, `if()`, `onInserted()`, `onRemoved()`, `onMoved()`, `onChanged()`
- **`DiffUtil`** — 30 function(s): `compare()`, `DiffUtil()`, `calculateDiff()`, `while()`, `if()`, `DiffResult()`, `diffPartial()`, `for()`, `IllegalStateException()`, `areContentsTheSame()`, `areItemsTheSame()`, `getNewListSize()`, `getOldListSize()`, `getChangePayload()`, `Snake()`, `Range()`, `addRootSnake()`, `findMatchingItems()`, `findAddition()`, `findRemoval()`, `findMatchingItem()`, `convertOldPositionToNew()`, `IndexOutOfBoundsException()`, `convertNewPositionToOld()`, `dispatchUpdatesTo()`, `dispatchRemovals()`, `dispatchAdditions()`, `removePostponedUpdate()`, `getSnakes()`, `PostponedUpdate()`
- **`ListUpdateCallback`** — 4 function(s): `onChanged()`, `onInserted()`, `onMoved()`, `onRemoved()`
- **`MessageThreadUtil`** — 24 function(s): `run()`, `while()`, `if()`, `AnonymousClass1()`, `updateItemCount()`, `sendMessage()`, `addTile()`, `removeTile()`, `getMainThreadProxy()`, `AnonymousClass2()`, `refresh()`, `sendMessageAtFrontOfQueue()`, `updateRange()`, `loadTile()`, `recycleTile()`, `maybeExecuteBackgroundRunnable()`, `getBackgroundProxy()`, `SyncQueueItem()`, `recycle()`, `synchronized()`, `obtainMessage()`, `MessageQueue()`, `next()`, `removeMessages()`
- **`SortedList`** — 44 function(s): `SortedList()`, `this()`, `size()`, `add()`, `throwIfInMutationOperation()`, `addAll()`, `if()`, `addAllInternal()`, `replaceAll()`, `replaceAllInternal()`, `merge()`, `beginBatchedUpdates()`, `while()`, `replaceAllRemove()`, `replaceAllInsert()`, `endBatchedUpdates()`, `sortAndDedup()`, `for()`, `findSameItem()`, `IllegalStateException()`, `addToData()`, `remove()`, `removeItemAt()`, `removeItemAtIndex()`, `updateItemAt()`, `recalculatePositionOfItemAt()`, `get()`, `IndexOutOfBoundsException()`, `indexOf()`, `return()`, `findIndexOf()`, `linearEqualitySearch()`, `copyArray()`, `clear()`, `areContentsTheSame()`, `areItemsTheSame()`, `compare()`, `onChanged()`, `getChangePayload()`, `BatchedCallback()`, `onInserted()`, `onRemoved()`, `onMoved()`, `dispatchLastEvent()`
- **`ThreadUtil`** — 9 function(s): `loadTile()`, `recycleTile()`, `refresh()`, `updateRange()`, `addTile()`, `removeTile()`, `updateItemCount()`, `getBackgroundProxy()`, `getMainThreadProxy()`
- **`TileList`** — 11 function(s): `TileList()`, `getItemAt()`, `if()`, `size()`, `clear()`, `getAtIndex()`, `addOrReplace()`, `removeAtPos()`, `Tile()`, `containsPosition()`, `getByPosition()`

</details>

### Package `android.support.v7.view`  (9 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ActionBarPolicy` | class | — | 86 | 19 |
| `ActionMode` | class | — | 72 | 22 |
| `CollapsibleActionView` | class | — | 9 | 2 |
| `ContextThemeWrapper` | class | ContextWrapper | 123 | 36 |
| `StandaloneActionMode` | class | ActionMode implements MenuBuilder.Callback | 145 | 29 |
| `SupportActionModeWrapper` | class | android.view.ActionMode | 167 | 28 |
| `SupportMenuInflater` | class | MenuInflater | 485 | 76 |
| `ViewPropertyAnimatorCompatSet` | class | — | 126 | 27 |
| `WindowCallbackWrapper` | class | Window.Callback | 152 | 28 |

<details>
<summary><b>Function list for <code>android.support.v7.view</code></b> (click to expand)</summary>

- **`ActionBarPolicy`** — 10 function(s): `get()`, `ActionBarPolicy()`, `getMaxActionButtons()`, `if()`, `showsOverflowMenuButton()`, `getEmbeddedMenuWidthLimit()`, `hasEmbeddedTabs()`, `getTabContainerHeight()`, `enableHomeButtonByDefault()`, `getStackedTabMaxWidth()`
- **`ActionMode`** — 20 function(s): `onActionItemClicked()`, `onCreateActionMode()`, `onDestroyActionMode()`, `onPrepareActionMode()`, `finish()`, `getCustomView()`, `getMenu()`, `getMenuInflater()`, `getSubtitle()`, `getTitle()`, `invalidate()`, `setCustomView()`, `setSubtitle()`, `setTitle()`, `setTag()`, `getTag()`, `setTitleOptionalHint()`, `getTitleOptionalHint()`, `isTitleOptional()`, `isUiFocusable()`
- **`CollapsibleActionView`** — 2 function(s): `onActionViewCollapsed()`, `onActionViewExpanded()`
- **`ContextThemeWrapper`** — 16 function(s): `ContextThemeWrapper()`, `super()`, `attachBaseContext()`, `applyOverrideConfiguration()`, `if()`, `IllegalStateException()`, `getResources()`, `getResourcesInternal()`, `setTheme()`, `initializeTheme()`, `getThemeResId()`, `getTheme()`, `getSystemService()`, `getBaseContext()`, `onApplyThemeResource()`, `getAssets()`
- **`StandaloneActionMode`** — 22 function(s): `StandaloneActionMode()`, `setTitle()`, `setSubtitle()`, `setTitleOptionalHint()`, `isTitleOptional()`, `setCustomView()`, `invalidate()`, `finish()`, `if()`, `getMenu()`, `getTitle()`, `getSubtitle()`, `getCustomView()`, `getMenuInflater()`, `SupportMenuInflater()`, `onMenuItemSelected()`, `onCloseMenu()`, `onSubMenuSelected()`, `MenuPopupHelper()`, `onCloseSubMenu()`, `onMenuModeChange()`, `isUiFocusable()`
- **`SupportActionModeWrapper`** — 25 function(s): `SupportActionModeWrapper()`, `getTag()`, `setTag()`, `setTitle()`, `setSubtitle()`, `invalidate()`, `finish()`, `getMenu()`, `getTitle()`, `getSubtitle()`, `getCustomView()`, `setCustomView()`, `getMenuInflater()`, `getTitleOptionalHint()`, `setTitleOptionalHint()`, `isTitleOptional()`, `CallbackWrapper()`, `onCreateActionMode()`, `onPrepareActionMode()`, `onActionItemClicked()`, `onDestroyActionMode()`, `getMenuWrapper()`, `if()`, `getActionModeWrapper()`, `for()`
- **`SupportMenuInflater`** — 24 function(s): `SupportMenuInflater()`, `super()`, `inflate()`, `if()`, `parseMenu()`, `InflateException()`, `while()`, `RuntimeException()`, `getRealOwner()`, `findRealOwner()`, `InflatedOnMenuItemClickListener()`, `onMenuItemClick()`, `return()`, `MenuState()`, `resetGroup()`, `readGroup()`, `readItem()`, `getShortcut()`, `setItem()`, `IllegalStateException()`, `addItem()`, `addSubMenuItem()`, `hasAddedItem()`, `newInstance()`
- **`ViewPropertyAnimatorCompatSet`** — 13 function(s): `onAnimationStart()`, `if()`, `onEnd()`, `onAnimationEnd()`, `play()`, `playSequentially()`, `start()`, `while()`, `onAnimationsEnded()`, `cancel()`, `setDuration()`, `setInterpolator()`, `setListener()`
- **`WindowCallbackWrapper`** — 26 function(s): `WindowCallbackWrapper()`, `if()`, `IllegalArgumentException()`, `dispatchKeyEvent()`, `dispatchKeyShortcutEvent()`, `dispatchTouchEvent()`, `dispatchTrackballEvent()`, `dispatchGenericMotionEvent()`, `dispatchPopulateAccessibilityEvent()`, `onCreatePanelView()`, `onCreatePanelMenu()`, `onPreparePanel()`, `onMenuOpened()`, `onMenuItemSelected()`, `onWindowAttributesChanged()`, `onContentChanged()`, `onWindowFocusChanged()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `onPanelClosed()`, `onSearchRequested()`, `onWindowStartingActionMode()`, `onActionModeStarted()`, `onActionModeFinished()`, `onProvideKeyboardShortcuts()`, `onPointerCaptureChanged()`

</details>

### Package `android.support.v7.view.menu`  (26 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ActionMenuItem` | class | SupportMenuItem | 407 | 81 |
| `ActionMenuItemView` | class | AppCompatTextView implements MenuView.ItemView, View.OnClickListener, ActionMenuView.Ac... | 274 | 65 |
| `BaseMenuPresenter` | class | MenuPresenter | 171 | 37 |
| `BaseMenuWrapper` | class | BaseWrapper<T> | 103 | 21 |
| `BaseWrapper` | class | — | 19 | 4 |
| `CascadingMenuPopup` | class | MenuPopup implements MenuPresenter, View.OnKeyListener, PopupWindow.OnDismissListener | 587 | 107 |
| `ExpandedMenuView` | class | ListView implements MenuBuilder.ItemInvoker, MenuView, AdapterView.OnItemClickListener | 61 | 16 |
| `ListMenuItemView` | class | LinearLayout implements MenuView.ItemView, AbsListView.SelectionBoundsAdjuster | 298 | 74 |
| `ListMenuPresenter` | class | MenuPresenter, AdapterView.OnItemClickListener | 258 | 55 |
| `MenuAdapter` | class | BaseAdapter | 101 | 19 |
| `MenuBuilder` | class | SupportMenu | 989 | 269 |
| `MenuDialogHelper` | class | DialogInterface.OnKeyListener, DialogInterface.OnClickListener, DialogInterface.OnDismi... | 114 | 19 |
| `MenuHelper` | class | — | 11 | 2 |
| `MenuItemImpl` | class | SupportMenuItem | 723 | 152 |
| `MenuItemWrapperICS` | class | BaseMenuWrapper<SupportMenuItem> implements MenuItem | 440 | 115 |
| `MenuItemWrapperJB` | class | MenuItemWrapperICS | 67 | 13 |
| `MenuPopup` | class | ShowableListMenu, MenuPresenter, AdapterView.OnItemClickListener | 128 | 31 |
| `MenuPopupHelper` | class | MenuHelper | 205 | 45 |
| `MenuPresenter` | class | — | 41 | 14 |
| `MenuView` | class | — | 35 | 12 |
| `MenuWrapperFactory` | class | — | 32 | 9 |
| `MenuWrapperICS` | class | BaseMenuWrapper<SupportMenu> implements Menu | 151 | 46 |
| `ShowableListMenu` | class | — | 15 | 4 |
| `StandardMenuPopup` | class | MenuPopup implements PopupWindow.OnDismissListener, AdapterView.OnItemClickListener, Me... | 291 | 52 |
| `SubMenuBuilder` | class | MenuBuilder implements SubMenu | 134 | 29 |
| `SubMenuWrapperICS` | class | MenuWrapperICS implements SubMenu | 75 | 22 |

<details>
<summary><b>Function list for <code>android.support.v7.view.menu</code></b> (click to expand)</summary>

- **`ActionMenuItem`** — 57 function(s): `ActionMenuItem()`, `getAlphabeticShortcut()`, `getAlphabeticModifiers()`, `getGroupId()`, `getIcon()`, `getIntent()`, `getItemId()`, `getMenuInfo()`, `getNumericShortcut()`, `getNumericModifiers()`, `getOrder()`, `getSubMenu()`, `getTitle()`, `getTitleCondensed()`, `hasSubMenu()`, `isCheckable()`, `return()`, `isChecked()`, `isEnabled()`, `isVisible()`, `setAlphabeticShortcut()`, `setCheckable()`, `setExclusiveCheckable()`, `setChecked()`, `setEnabled()`, `setIcon()`, `applyIconTint()`, `setIntent()`, `setNumericShortcut()`, `setOnMenuItemClickListener()`, `setShortcut()`, `setTitle()`, `setTitleCondensed()`, `setVisible()`, `invoke()`, `if()`, `setShowAsAction()`, `setActionView()`, `UnsupportedOperationException()`, `getActionView()`, `setActionProvider()`, `getActionProvider()`, `getSupportActionProvider()`, `setSupportActionProvider()`, `setShowAsActionFlags()`, `expandActionView()`, `collapseActionView()`, `isActionViewExpanded()`, `setOnActionExpandListener()`, `setContentDescription()`, `getContentDescription()`, `setTooltipText()`, `getTooltipText()`, `setIconTintList()`, `getIconTintList()`, `setIconTintMode()`, `getIconTintMode()`
- **`ActionMenuItemView`** — 38 function(s): `getPopup()`, `ActionMenuItemView()`, `this()`, `super()`, `setOnClickListener()`, `setSaveEnabled()`, `onConfigurationChanged()`, `updateTextButtonVisibility()`, `shouldAllowTextWithIcon()`, `setPadding()`, `getItemData()`, `initialize()`, `setIcon()`, `setTitle()`, `setId()`, `setVisibility()`, `setEnabled()`, `if()`, `onTouchEvent()`, `onClick()`, `setItemInvoker()`, `setPopupCallback()`, `prefersCondensedTitle()`, `setCheckable()`, `setChecked()`, `setExpandedFormat()`, `setText()`, `setContentDescription()`, `setCompoundDrawables()`, `hasText()`, `setShortcut()`, `showsIcon()`, `needsDividerBefore()`, `needsDividerAfter()`, `onMeasure()`, `ActionMenuItemForwardingListener()`, `onForwardingStarted()`, `onRestoreInstanceState()`
- **`BaseMenuPresenter`** — 23 function(s): `bindItemView()`, `BaseMenuPresenter()`, `initForMenu()`, `getMenuView()`, `if()`, `updateMenuView()`, `for()`, `addItemView()`, `while()`, `filterLeftoverView()`, `setCallback()`, `getCallback()`, `createItemView()`, `return()`, `getItemView()`, `shouldIncludeItem()`, `onCloseMenu()`, `onSubMenuSelected()`, `flagActionItems()`, `expandItemActionView()`, `collapseItemActionView()`, `getId()`, `setId()`
- **`BaseMenuWrapper`** — 9 function(s): `BaseMenuWrapper()`, `super()`, `getMenuItemWrapper()`, `if()`, `getSubMenuWrapper()`, `internalClear()`, `internalRemoveGroup()`, `while()`, `internalRemoveItem()`
- **`BaseWrapper`** — 4 function(s): `BaseWrapper()`, `if()`, `IllegalArgumentException()`, `getWrappedObject()`
- **`CascadingMenuPopup`** — 41 function(s): `onGlobalLayout()`, `if()`, `for()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `onItemHoverExit()`, `onItemHoverEnter()`, `while()`, `run()`, `CascadingMenuPopup()`, `setForceShowIcon()`, `createPopupWindow()`, `show()`, `showMenu()`, `dismiss()`, `onKey()`, `getInitialMenuPosition()`, `getNextMenuPosition()`, `addMenu()`, `findMenuItemForSubmenu()`, `findParentViewForSubmenu()`, `isShowing()`, `onDismiss()`, `updateMenuView()`, `toMenuAdapter()`, `setCallback()`, `onSubMenuSelected()`, `findIndexOfAddedMenu()`, `onCloseMenu()`, `flagActionItems()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setGravity()`, `setAnchorView()`, `setOnDismissListener()`, `getListView()`, `setHorizontalOffset()`, `setVerticalOffset()`, `setShowTitle()`, `closeMenuOnSubMenuOpened()`, `CascadingMenuInfo()`
- **`ExpandedMenuView`** — 13 function(s): `ExpandedMenuView()`, `this()`, `super()`, `setOnItemClickListener()`, `if()`, `setBackgroundDrawable()`, `setDivider()`, `initialize()`, `onDetachedFromWindow()`, `setChildrenDrawingCacheEnabled()`, `invokeItem()`, `onItemClick()`, `getWindowAnimations()`
- **`ListMenuItemView`** — 28 function(s): `ListMenuItemView()`, `this()`, `super()`, `onFinishInflate()`, `if()`, `initialize()`, `setVisibility()`, `setTitle()`, `setCheckable()`, `setShortcut()`, `setIcon()`, `setEnabled()`, `setSubMenuArrowVisible()`, `setContentDescription()`, `addContentView()`, `addView()`, `setForceShowIcon()`, `getItemData()`, `insertRadioButton()`, `insertCheckBox()`, `setChecked()`, `insertIconView()`, `onMeasure()`, `prefersCondensedTitle()`, `showsIcon()`, `getInflater()`, `setGroupDividerEnabled()`, `adjustListItemSelectionBounds()`
- **`ListMenuPresenter`** — 31 function(s): `ListMenuPresenter()`, `this()`, `initForMenu()`, `if()`, `getMenuView()`, `getAdapter()`, `updateMenuView()`, `setCallback()`, `onSubMenuSelected()`, `MenuDialogHelper()`, `onCloseMenu()`, `getItemIndexOffset()`, `setItemIndexOffset()`, `onItemClick()`, `flagActionItems()`, `expandItemActionView()`, `collapseItemActionView()`, `saveHierarchyState()`, `restoreHierarchyState()`, `setId()`, `getId()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `MenuAdapter()`, `findExpandedIndex()`, `getCount()`, `getItem()`, `getItemId()`, `getView()`, `for()`, `notifyDataSetChanged()`
- **`MenuAdapter`** — 12 function(s): `MenuAdapter()`, `findExpandedIndex()`, `getForceShowIcon()`, `setForceShowIcon()`, `getCount()`, `if()`, `getAdapterMenu()`, `getItem()`, `getItemId()`, `getView()`, `for()`, `notifyDataSetChanged()`
- **`MenuBuilder`** — 89 function(s): `onMenuItemSelected()`, `onMenuModeChange()`, `invokeItem()`, `MenuBuilder()`, `setShortcutsVisibleInner()`, `setDefaultShowAsAction()`, `addMenuPresenter()`, `removeMenuPresenter()`, `while()`, `if()`, `dispatchPresenterUpdate()`, `stopDispatchingItemsChanged()`, `startDispatchingItemsChanged()`, `dispatchSubMenuSelected()`, `dispatchSaveInstanceState()`, `dispatchRestoreInstanceState()`, `savePresenterStates()`, `restorePresenterStates()`, `saveActionViewStates()`, `for()`, `restoreActionViewStates()`, `getActionViewStatesKey()`, `setCallback()`, `addInternal()`, `onItemsChanged()`, `createNewMenuItem()`, `MenuItemImpl()`, `add()`, `addSubMenu()`, `setGroupDividerEnabled()`, `isGroupDividerEnabled()`, `addIntentOptions()`, `removeGroup()`, `removeItem()`, `removeItemAtInt()`, `removeItemAt()`, `clearAll()`, `clear()`, `clearHeader()`, `collapseItemActionView()`, `setExclusiveItemChecked()`, `setGroupCheckable()`, `setGroupVisible()`, `setGroupEnabled()`, `hasVisibleItems()`, `findItem()`, `findItemIndex()`, `findGroupIndex()`, `size()`, `getItem()`, `isShortcutKey()`, `findItemWithShortcutForKey()`, `setQwertyMode()`, `getOrdering()`, `return()`, `IllegalArgumentException()`, `isQwertyMode()`, `setShortcutsVisible()`, `isShortcutsVisible()`, `getResources()`, `getContext()`, `dispatchMenuItemSelected()`, `changeMenuMode()`, `findInsertIndex()`, `performShortcut()`, `close()`, `findItemsWithShortcutForKey()`, `performIdentifierAction()`, `performItemAction()`, `onItemVisibleChanged()`, `onItemActionRequestChanged()`, `getVisibleItems()`, `flagActionItems()`, `getActionItems()`, `getNonActionItems()`, `setHeaderInternal()`, `setHeaderTitleInt()`, `setHeaderIconInt()`, `setHeaderViewInt()`, `getHeaderTitle()`, `getHeaderIcon()`, `getHeaderView()`, `getRootMenu()`, `setCurrentMenuInfo()`, `setOptionalIconsVisible()`, `getOptionalIconsVisible()`, `expandItemActionView()`, `getExpandedItem()`, `setOverrideVisibleItems()`
- **`MenuDialogHelper`** — 10 function(s): `MenuDialogHelper()`, `show()`, `if()`, `onKey()`, `setPresenterCallback()`, `dismiss()`, `onDismiss()`, `onCloseMenu()`, `onOpenSubMenu()`, `onClick()`
- **`MenuHelper`** — 2 function(s): `dismiss()`, `setPresenterCallback()`
- **`MenuItemImpl`** — 82 function(s): `MenuItemImpl()`, `invoke()`, `if()`, `isEnabled()`, `return()`, `setEnabled()`, `getGroupId()`, `getItemId()`, `getOrder()`, `getOrdering()`, `getIntent()`, `setIntent()`, `getCallback()`, `setCallback()`, `getAlphabeticShortcut()`, `setAlphabeticShortcut()`, `getAlphabeticModifiers()`, `getNumericShortcut()`, `getNumericModifiers()`, `setNumericShortcut()`, `setShortcut()`, `getShortcut()`, `getShortcutLabel()`, `appendModifier()`, `shouldShowShortcut()`, `getSubMenu()`, `hasSubMenu()`, `setSubMenu()`, `getTitle()`, `getTitleForItemView()`, `getTitleCondensed()`, `setTitle()`, `setTitleCondensed()`, `getIcon()`, `applyIconTintIfNecessary()`, `setIcon()`, `setIconTintList()`, `getIconTintList()`, `setIconTintMode()`, `getIconTintMode()`, `isCheckable()`, `setCheckable()`, `setExclusiveCheckable()`, `isExclusiveCheckable()`, `isChecked()`, `setChecked()`, `setCheckedInt()`, `isVisible()`, `setVisibleInt()`, `setVisible()`, `setOnMenuItemClickListener()`, `toString()`, `setMenuInfo()`, `getMenuInfo()`, `actionFormatChanged()`, `shouldShowIcon()`, `isActionButton()`, `requestsActionButton()`, `requiresActionButton()`, `setIsActionButton()`, `showsTextAsAction()`, `setShowAsAction()`, `IllegalArgumentException()`, `setActionView()`, `getActionView()`, `setActionProvider()`, `UnsupportedOperationException()`, `getActionProvider()`, `getSupportActionProvider()`, `setSupportActionProvider()`, `onActionProviderVisibilityChanged()`, `setShowAsActionFlags()`, `expandActionView()`, `collapseActionView()`, `hasCollapsibleActionView()`, `setActionViewExpanded()`, `isActionViewExpanded()`, `setOnActionExpandListener()`, `setContentDescription()`, `getContentDescription()`, `setTooltipText()`, `getTooltipText()`
- **`MenuItemWrapperICS`** — 69 function(s): `MenuItemWrapperICS()`, `super()`, `getItemId()`, `return()`, `getGroupId()`, `getOrder()`, `setTitle()`, `getTitle()`, `setTitleCondensed()`, `getTitleCondensed()`, `setIcon()`, `getIcon()`, `setIntent()`, `getIntent()`, `setShortcut()`, `setNumericShortcut()`, `getNumericShortcut()`, `getNumericModifiers()`, `setAlphabeticShortcut()`, `getAlphabeticShortcut()`, `getAlphabeticModifiers()`, `setCheckable()`, `isCheckable()`, `setChecked()`, `isChecked()`, `setVisible()`, `isVisible()`, `setEnabled()`, `isEnabled()`, `hasSubMenu()`, `getSubMenu()`, `getSubMenuWrapper()`, `setOnMenuItemClickListener()`, `getMenuInfo()`, `setShowAsAction()`, `setShowAsActionFlags()`, `setActionView()`, `if()`, `getActionView()`, `setActionProvider()`, `getActionProvider()`, `expandActionView()`, `collapseActionView()`, `isActionViewExpanded()`, `setOnActionExpandListener()`, `setContentDescription()`, `getContentDescription()`, `setTooltipText()`, `getTooltipText()`, `setIconTintList()`, `getIconTintList()`, `setIconTintMode()`, `getIconTintMode()`, `setExclusiveCheckable()`, `createActionProviderWrapper()`, `ActionProviderWrapper()`, `OnMenuItemClickListenerWrapper()`, `onMenuItemClick()`, `OnActionExpandListenerWrapper()`, `onMenuItemActionExpand()`, `onMenuItemActionCollapse()`, `onCreateActionView()`, `onPerformDefaultAction()`, `onPrepareSubMenu()`, `CollapsibleActionViewWrapper()`, `addView()`, `onActionViewExpanded()`, `onActionViewCollapsed()`, `getWrappedView()`
- **`MenuItemWrapperJB`** — 11 function(s): `MenuItemWrapperJB()`, `super()`, `createActionProviderWrapper()`, `ActionProviderWrapperJB()`, `onCreateActionView()`, `overridesItemVisibility()`, `isVisible()`, `refreshVisibility()`, `setVisibilityListener()`, `onActionProviderVisibilityChanged()`, `if()`
- **`MenuPopup`** — 24 function(s): `addMenu()`, `setAnchorView()`, `setForceShowIcon()`, `setGravity()`, `setHorizontalOffset()`, `setOnDismissListener()`, `setShowTitle()`, `setVerticalOffset()`, `setEpicenterBounds()`, `getEpicenterBounds()`, `initForMenu()`, `getMenuView()`, `UnsupportedOperationException()`, `expandItemActionView()`, `collapseItemActionView()`, `getId()`, `onItemClick()`, `measureIndividualMenuWidth()`, `for()`, `if()`, `toMenuAdapter()`, `return()`, `shouldPreserveIconSpacing()`, `closeMenuOnSubMenuOpened()`
- **`MenuPopupHelper`** — 19 function(s): `MenuPopupHelper()`, `this()`, `onDismiss()`, `setOnDismissListener()`, `setAnchorView()`, `setForceShowIcon()`, `if()`, `setGravity()`, `getGravity()`, `show()`, `IllegalStateException()`, `getPopup()`, `tryShow()`, `showPopup()`, `createPopup()`, `dismiss()`, `isShowing()`, `setPresenterCallback()`, `getListView()`
- **`MenuPresenter`** — 13 function(s): `onCloseMenu()`, `onOpenSubMenu()`, `collapseItemActionView()`, `expandItemActionView()`, `flagActionItems()`, `getId()`, `getMenuView()`, `initForMenu()`, `onRestoreInstanceState()`, `onSaveInstanceState()`, `onSubMenuSelected()`, `setCallback()`, `updateMenuView()`
- **`MenuView`** — 11 function(s): `getItemData()`, `initialize()`, `prefersCondensedTitle()`, `setCheckable()`, `setChecked()`, `setEnabled()`, `setIcon()`, `setShortcut()`, `setTitle()`, `showsIcon()`, `getWindowAnimations()`
- **`MenuWrapperFactory`** — 9 function(s): `MenuWrapperFactory()`, `wrapSupportMenu()`, `MenuWrapperICS()`, `wrapSupportMenuItem()`, `if()`, `MenuItemWrapperJB()`, `MenuItemWrapperICS()`, `wrapSupportSubMenu()`, `SubMenuWrapperICS()`
- **`MenuWrapperICS`** — 28 function(s): `MenuWrapperICS()`, `super()`, `add()`, `getMenuItemWrapper()`, `addSubMenu()`, `getSubMenuWrapper()`, `addIntentOptions()`, `if()`, `for()`, `removeItem()`, `internalRemoveItem()`, `removeGroup()`, `internalRemoveGroup()`, `clear()`, `internalClear()`, `setGroupCheckable()`, `setGroupVisible()`, `setGroupEnabled()`, `hasVisibleItems()`, `return()`, `findItem()`, `size()`, `getItem()`, `close()`, `performShortcut()`, `isShortcutKey()`, `performIdentifierAction()`, `setQwertyMode()`
- **`ShowableListMenu`** — 4 function(s): `dismiss()`, `getListView()`, `isShowing()`, `show()`
- **`StandardMenuPopup`** — 28 function(s): `onGlobalLayout()`, `if()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `StandardMenuPopup()`, `setForceShowIcon()`, `setGravity()`, `tryShow()`, `show()`, `IllegalStateException()`, `dismiss()`, `addMenu()`, `isShowing()`, `onDismiss()`, `updateMenuView()`, `setCallback()`, `onSubMenuSelected()`, `onCloseMenu()`, `flagActionItems()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `setAnchorView()`, `onKey()`, `setOnDismissListener()`, `getListView()`, `setHorizontalOffset()`, `setVerticalOffset()`, `setShowTitle()`
- **`SubMenuBuilder`** — 22 function(s): `SubMenuBuilder()`, `super()`, `setQwertyMode()`, `isQwertyMode()`, `setShortcutsVisible()`, `isShortcutsVisible()`, `getParentMenu()`, `getItem()`, `setCallback()`, `getRootMenu()`, `dispatchMenuItemSelected()`, `setIcon()`, `setHeaderIcon()`, `return()`, `setHeaderTitle()`, `setHeaderView()`, `expandItemActionView()`, `collapseItemActionView()`, `getActionViewStatesKey()`, `if()`, `setGroupDividerEnabled()`, `isGroupDividerEnabled()`
- **`SubMenuWrapperICS`** — 11 function(s): `SubMenuWrapperICS()`, `super()`, `getWrappedObject()`, `return()`, `setHeaderTitle()`, `setHeaderIcon()`, `setHeaderView()`, `clearHeader()`, `setIcon()`, `getItem()`, `getMenuItemWrapper()`

</details>

### Package `android.support.v7.viewpager`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `R` | class | — | 209 | 11 |

<details>
<summary><b>Function list for <code>android.support.v7.viewpager</code></b> (click to expand)</summary>

- **`R`** — 11 function(s): `R()`, `attr()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `android.support.v7.widget`  (101 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AbsActionBarView` | class | ViewGroup | 268 | 59 |
| `ActionBarBackgroundDrawable` | class | Drawable | 56 | 12 |
| `ActionBarContainer` | class | FrameLayout | 316 | 78 |
| `ActionBarContextView` | class | AbsActionBarView | 400 | 79 |
| `ActionBarOverlayLayout` | class | ViewGroup implements DecorContentParent, NestedScrollingParent | 658 | 178 |
| `ActionMenuPresenter` | class | BaseMenuPresenter implements ActionProvider.SubUiVisibilityListener | 806 | 157 |
| `ActionMenuView` | class | LinearLayoutCompat implements MenuBuilder.ItemInvoker, MenuView | 761 | 132 |
| `ActivityChooserModel` | class | DataSetObservable | 616 | 133 |
| `ActivityChooserView` | class | ViewGroup implements ActivityChooserModel.ActivityChooserModelClient | 587 | 131 |
| `AdapterHelper` | class | OpReorderer.Callback | 635 | 165 |
| `AlertDialogLayout` | class | LinearLayoutCompat | 234 | 42 |
| `AppCompatAutoCompleteTextView` | class | AutoCompleteTextView implements TintableBackgroundView | 134 | 29 |
| `AppCompatBackgroundHelper` | class | — | 164 | 38 |
| `AppCompatButton` | class | Button implements TintableBackgroundView, AutoSizeableTextView | 259 | 59 |
| `AppCompatCheckBox` | class | CheckBox implements TintableCompoundButton | 86 | 19 |
| `AppCompatCheckedTextView` | class | CheckedTextView | 69 | 15 |
| `AppCompatCompoundButtonHelper` | class | — | 115 | 23 |
| `AppCompatDrawableManager` | class | LruCache<Integer, PorterDuffColorFilter> | 593 | 132 |
| `AppCompatEditText` | class | EditText implements TintableBackgroundView | 132 | 27 |
| `AppCompatHintHelper` | class | — | 31 | 6 |
| `AppCompatImageButton` | class | ImageButton implements TintableBackgroundView, TintableImageSourceView | 172 | 37 |
| `AppCompatImageHelper` | class | — | 173 | 38 |
| `AppCompatImageView` | class | ImageView implements TintableBackgroundView, TintableImageSourceView | 174 | 38 |
| `AppCompatMultiAutoCompleteTextView` | class | MultiAutoCompleteTextView implements TintableBackgroundView | 127 | 28 |
| `AppCompatPopupWindow` | class | PopupWindow | 71 | 18 |
| `AppCompatProgressBarHelper` | class | — | 109 | 18 |
| `AppCompatRadioButton` | class | RadioButton implements TintableCompoundButton | 89 | 19 |
| `AppCompatRatingBar` | class | RatingBar | 38 | 9 |
| `AppCompatSeekBar` | class | SeekBar | 45 | 9 |
| `AppCompatSeekBarHelper` | class | AppCompatProgressBarHelper | 151 | 34 |
| `AppCompatSpinner` | class | Spinner implements TintableBackgroundView | 656 | 149 |
| `AppCompatTextHelper` | class | — | 341 | 85 |
| `AppCompatTextView` | class | TextView implements TintableBackgroundView, AutoSizeableTextView | 328 | 74 |
| `AppCompatTextViewAutoSizeHelper` | class | — | 471 | 109 |
| `ButtonBarLayout` | class | LinearLayout | 118 | 33 |
| `CardView` | class | FrameLayout | 255 | 47 |
| `CardViewApi17Impl` | class | CardViewBaseImpl | 20 | 2 |
| `CardViewApi21Impl` | class | CardViewImpl | 101 | 30 |
| `CardViewBaseImpl` | class | CardViewImpl | 133 | 37 |
| `CardViewDelegate` | class | — | 22 | 7 |
| `CardViewImpl` | class | — | 38 | 15 |
| `ChildHelper` | class | — | 372 | 102 |
| `ContentFrameLayout` | class | FrameLayout | 191 | 48 |
| `DecorContentParent` | class | — | 52 | 20 |
| `DecorToolbar` | class | — | 133 | 57 |
| `DefaultItemAnimator` | class | SimpleItemAnimator | 581 | 132 |
| `DialogTitle` | class | TextView | 52 | 14 |
| `DividerItemDecoration` | class | RecyclerView.ItemDecoration | 119 | 22 |
| `DrawableUtils` | class | — | 170 | 36 |
| `DropDownListView` | class | ListView | 496 | 119 |
| `FastScroller` | class | RecyclerView.ItemDecoration implements RecyclerView.OnItemTouchListener | 497 | 104 |
| `FitWindowsFrameLayout` | class | FrameLayout implements FitWindowsViewGroup | 35 | 7 |
| `FitWindowsLinearLayout` | class | LinearLayout implements FitWindowsViewGroup | 35 | 7 |
| `FitWindowsViewGroup` | class | — | 15 | 2 |
| `ForwardingListener` | class | View.OnTouchListener, View.OnAttachStateChangeListener | 222 | 44 |
| `GapWorker` | class | Runnable | 315 | 66 |
| `GridLayoutManager` | class | LinearLayoutManager | 1,001 | 212 |
| `LayoutState` | class | — | 41 | 3 |
| `LinearLayoutCompat` | class | ViewGroup | 1,625 | 268 |
| `LinearLayoutManager` | class | RecyclerView.LayoutManager implements ItemTouchHelper.ViewDropHandler, RecyclerView.Smo... | 1,582 | 421 |
| `LinearSmoothScroller` | class | RecyclerView.SmoothScroller | 168 | 38 |
| `LinearSnapHelper` | class | SnapHelper | 185 | 38 |
| `ListPopupWindow` | class | ShowableListMenu | 819 | 165 |
| `MenuItemHoverListener` | class | — | 12 | 2 |
| `MenuPopupWindow` | class | ListPopupWindow implements MenuItemHoverListener | 216 | 33 |
| `OpReorderer` | class | — | 196 | 48 |
| `OrientationHelper` | class | — | 247 | 63 |
| `PagerSnapHelper` | class | SnapHelper | 186 | 39 |
| `PopupMenu` | class | — | 140 | 30 |
| `RecyclerView` | class | ViewGroup implements ScrollingView, NestedScrollingChild2 | 7,159 | 1900 |
| `RecyclerViewAccessibilityDelegate` | class | AccessibilityDelegateCompat | 86 | 17 |
| `ResourcesWrapper` | class | Resources | 252 | 47 |
| `RoundRectDrawable` | class | Drawable | 185 | 41 |
| `RoundRectDrawableWithShadow` | class | Drawable | 330 | 69 |
| `RtlSpacingHelper` | class | — | 100 | 21 |
| `ScrollbarHelper` | class | — | 58 | 12 |
| `ScrollingTabContainerView` | class | HorizontalScrollView implements AdapterView.OnItemSelectedListener | 551 | 136 |
| `SearchView` | class | LinearLayoutCompat implements CollapsibleActionView | 1,388 | 323 |
| `ShareActionProvider` | class | ActionProvider | 162 | 30 |
| `SimpleItemAnimator` | class | RecyclerView.ItemAnimator | 142 | 50 |
| `SnapHelper` | class | RecyclerView.OnFlingListener | 146 | 37 |
| `StaggeredGridLayoutManager` | class | RecyclerView.LayoutManager implements RecyclerView.SmoothScroller.ScrollVectorProvider | 2,598 | 684 |
| `SuggestionsAdapter` | class | ResourceCursorAdapter implements View.OnClickListener | 538 | 104 |
| `SwitchCompat` | class | CompoundButton | 959 | 214 |
| `ThemeUtils` | class | — | 89 | 11 |
| `ThemedSpinnerAdapter` | class | SpinnerAdapter | 51 | 8 |
| `TintContextWrapper` | class | ContextWrapper | 91 | 18 |
| `TintInfo` | class | — | 21 | 1 |
| `TintResources` | class | ResourcesWrapper | 28 | 4 |
| `TintTypedArray` | class | — | 189 | 45 |
| `Toolbar` | class | ViewGroup | 1,734 | 417 |
| `ToolbarWidgetWrapper` | class | DecorToolbar | 642 | 155 |
| `TooltipCompat` | class | — | 19 | 3 |
| `TooltipCompatHandler` | class | View.OnLongClickListener, View.OnHoverListener, View.OnAttachStateChangeListener | 188 | 42 |
| `TooltipPopup` | class | — | 153 | 22 |
| `VectorEnabledTintResources` | class | Resources | 46 | 9 |
| `ViewBoundsCheck` | class | — | 157 | 29 |
| `ViewInfoStore` | class | — | 232 | 46 |
| `ViewStubCompat` | class | View | 137 | 34 |
| `ViewUtils` | class | — | 65 | 9 |
| `WithHint` | class | — | 7 | 1 |

<details>
<summary><b>Function list for <code>android.support.v7.widget</code></b> (click to expand)</summary>

- **`AbsActionBarView`** — 34 function(s): `this()`, `AbsActionBarView()`, `super()`, `if()`, `onConfigurationChanged()`, `setContentHeight()`, `onTouchEvent()`, `onHoverEvent()`, `requestLayout()`, `getContentHeight()`, `getAnimatedVisibility()`, `getVisibility()`, `setupAnimatorToVisibility()`, `setAlpha()`, `animateToVisibility()`, `setVisibility()`, `showOverflowMenu()`, `postShowOverflowMenu()`, `post()`, `run()`, `hideOverflowMenu()`, `isOverflowMenuShowing()`, `isOverflowMenuShowPending()`, `isOverflowReserved()`, `canShowOverflowMenu()`, `dismissPopupMenus()`, `measureChildView()`, `next()`, `positionChild()`, `VisibilityAnimListener()`, `withFinalVisibility()`, `onAnimationStart()`, `onAnimationEnd()`, `onAnimationCancel()`
- **`ActionBarBackgroundDrawable`** — 7 function(s): `ActionBarBackgroundDrawable()`, `draw()`, `if()`, `setAlpha()`, `setColorFilter()`, `getOpacity()`, `getOutline()`
- **`ActionBarContainer`** — 31 function(s): `ActionBarContainer()`, `this()`, `super()`, `if()`, `setWillNotDraw()`, `onFinishInflate()`, `setPrimaryBackground()`, `unscheduleDrawable()`, `invalidate()`, `setStackedBackground()`, `setSplitBackground()`, `setVisibility()`, `verifyDrawable()`, `return()`, `drawableStateChanged()`, `jumpDrawablesToCurrentState()`, `setTransitioning()`, `setDescendantFocusability()`, `onInterceptTouchEvent()`, `onTouchEvent()`, `onHoverEvent()`, `setTabContainer()`, `removeView()`, `addView()`, `getTabContainer()`, `startActionModeForChild()`, `isCollapsed()`, `getMeasuredHeightWithMargins()`, `onMeasure()`, `setMeasuredDimension()`, `onLayout()`
- **`ActionBarContextView`** — 34 function(s): `ActionBarContextView()`, `this()`, `super()`, `onDetachedFromWindow()`, `if()`, `setContentHeight()`, `setCustomView()`, `removeView()`, `addView()`, `requestLayout()`, `setTitle()`, `initTitle()`, `setSubtitle()`, `getTitle()`, `getSubtitle()`, `initForMode()`, `onClick()`, `closeMode()`, `killMode()`, `removeAllViews()`, `showOverflowMenu()`, `hideOverflowMenu()`, `isOverflowMenuShowing()`, `generateDefaultLayoutParams()`, `generateLayoutParams()`, `onMeasure()`, `IllegalStateException()`, `for()`, `setMeasuredDimension()`, `onLayout()`, `shouldDelayChildPressedState()`, `onInitializeAccessibilityEvent()`, `setTitleOptional()`, `isTitleOptional()`
- **`ActionBarOverlayLayout`** — 80 function(s): `enableContentAnimations()`, `hideForSystem()`, `onContentScrollStarted()`, `onContentScrollStopped()`, `onWindowVisibilityChanged()`, `showForSystem()`, `ActionBarOverlayLayout()`, `this()`, `super()`, `onAnimationEnd()`, `onAnimationCancel()`, `run()`, `init()`, `if()`, `setWillNotDraw()`, `onDetachedFromWindow()`, `haltActionBarHideOffsetAnimations()`, `setActionBarVisibilityCallback()`, `onWindowSystemUiVisibilityChanged()`, `setOverlayMode()`, `isInOverlayMode()`, `setHasNonEmbeddedTabs()`, `setShowingForActionMode()`, `onConfigurationChanged()`, `pullChildren()`, `applyInsets()`, `fitSystemWindows()`, `requestLayout()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `checkLayoutParams()`, `onMeasure()`, `measureChildWithMargins()`, `setMeasuredDimension()`, `onLayout()`, `for()`, `draw()`, `shouldDelayChildPressedState()`, `onStartNestedScroll()`, `onNestedScrollAccepted()`, `onNestedScroll()`, `setActionBarHideOffset()`, `onStopNestedScroll()`, `postRemoveActionBarHideOffset()`, `postAddActionBarHideOffset()`, `onNestedFling()`, `addActionBarHideOffset()`, `removeActionBarHideOffset()`, `onNestedPreScroll()`, `onNestedPreFling()`, `getNestedScrollAxes()`, `getDecorToolbar()`, `return()`, `IllegalStateException()`, `setHideOnContentScrollEnabled()`, `isHideOnContentScrollEnabled()`, `getActionBarHideOffset()`, `removeCallbacks()`, `postDelayed()`, `shouldHideActionBarOnFling()`, `setWindowCallback()`, `setWindowTitle()`, `getTitle()`, `initFeature()`, `setUiOptions()`, `hasIcon()`, `hasLogo()`, `setIcon()`, `setLogo()`, `canShowOverflowMenu()`, `isOverflowMenuShowing()`, `isOverflowMenuShowPending()`, `showOverflowMenu()`, `hideOverflowMenu()`, `setMenuPrepared()`, `setMenu()`, `saveToolbarHierarchyState()`, `restoreToolbarHierarchyState()`, `dismissPopups()`
- **`ActionMenuPresenter`** — 64 function(s): `ActionMenuPresenter()`, `super()`, `initForMenu()`, `if()`, `onConfigurationChanged()`, `setWidthLimit()`, `setReserveOverflow()`, `setItemLimit()`, `setExpandedActionViewsExclusive()`, `setOverflowIcon()`, `getOverflowIcon()`, `getMenuView()`, `getItemView()`, `bindItemView()`, `shouldIncludeItem()`, `updateMenuView()`, `for()`, `filterLeftoverView()`, `onSubMenuSelected()`, `while()`, `findViewForItem()`, `showOverflowMenu()`, `hideOverflowMenu()`, `dismissPopupMenus()`, `hideSubMenus()`, `isOverflowMenuShowing()`, `isOverflowMenuShowPending()`, `isOverflowReserved()`, `flagActionItems()`, `onCloseMenu()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `onSubUiVisibilityChanged()`, `setMenuView()`, `createFromParcel()`, `SavedState()`, `newArray()`, `describeContents()`, `writeToParcel()`, `OverflowMenuButton()`, `setClickable()`, `setFocusable()`, `setVisibility()`, `setEnabled()`, `setOnTouchListener()`, `getPopup()`, `onForwardingStarted()`, `onForwardingStopped()`, `performClick()`, `playSoundEffect()`, `needsDividerBefore()`, `needsDividerAfter()`, `setFrame()`, `OverflowPopup()`, `setGravity()`, `setPresenterCallback()`, `onDismiss()`, `ActionButtonSubmenu()`, `setAnchorView()`, `PopupPresenterCallback()`, `onOpenSubMenu()`, `OpenOverflowRunnable()`, `run()`, `ActionMenuPopupCallback()`
- **`ActionMenuView`** — 50 function(s): `needsDividerAfter()`, `needsDividerBefore()`, `onMenuItemClick()`, `ActionMenuView()`, `this()`, `super()`, `setBaselineAligned()`, `setPopupTheme()`, `if()`, `getPopupTheme()`, `setPresenter()`, `onConfigurationChanged()`, `setOnMenuItemClickListener()`, `onMeasure()`, `onMeasureExactFormat()`, `for()`, `setMeasuredDimension()`, `while()`, `measureChildForCells()`, `onLayout()`, `onDetachedFromWindow()`, `dismissPopupMenus()`, `setOverflowIcon()`, `getMenu()`, `getOverflowIcon()`, `isOverflowReserved()`, `setOverflowReserved()`, `generateDefaultLayoutParams()`, `generateLayoutParams()`, `LayoutParams()`, `checkLayoutParams()`, `generateOverflowButtonLayoutParams()`, `invokeItem()`, `getWindowAnimations()`, `initialize()`, `setMenuCallbacks()`, `peekMenu()`, `showOverflowMenu()`, `hideOverflowMenu()`, `isOverflowMenuShowing()`, `isOverflowMenuShowPending()`, `hasSupportDividerBeforeChildAt()`, `dispatchPopulateAccessibilityEvent()`, `setExpandedActionViewsExclusive()`, `MenuBuilderCallback()`, `onMenuItemSelected()`, `onMenuModeChange()`, `ActionMenuPresenterCallback()`, `onCloseMenu()`, `onOpenSubMenu()`
- **`ActivityChooserModel`** — 44 function(s): `setActivityChooserModel()`, `sort()`, `onChooseActivity()`, `get()`, `synchronized()`, `if()`, `ActivityChooserModel()`, `setIntent()`, `ensureConsistentState()`, `getIntent()`, `getActivityCount()`, `getActivity()`, `getActivityIndex()`, `for()`, `chooseActivity()`, `addHistoricalRecord()`, `setOnChooseActivityListener()`, `getDefaultActivity()`, `setDefaultActivity()`, `persistHistoricalDataIfNeeded()`, `IllegalStateException()`, `PersistHistoryAsyncTask()`, `setActivitySorter()`, `notifyChanged()`, `setHistoryMaxSize()`, `pruneExcessiveHistoricalRecordsIfNeeded()`, `getHistoryMaxSize()`, `getHistorySize()`, `sortActivitiesIfNeeded()`, `loadActivitiesIfNeeded()`, `readHistoricalDataIfNeeded()`, `readHistoricalDataImpl()`, `HistoricalRecord()`, `this()`, `hashCode()`, `return()`, `equals()`, `toString()`, `ActivityResolveInfo()`, `compareTo()`, `DefaultSorter()`, `XmlPullParserException()`, `while()`, `doInBackground()`
- **`ActivityChooserView`** — 61 function(s): `ActivityChooserView()`, `this()`, `super()`, `onChanged()`, `onInvalidated()`, `onGlobalLayout()`, `if()`, `onInitializeAccessibilityNodeInfo()`, `getPopup()`, `onForwardingStarted()`, `onForwardingStopped()`, `setActivityChooserModel()`, `dismissPopup()`, `showPopup()`, `setExpandActivityOverflowButtonDrawable()`, `setExpandActivityOverflowButtonContentDescription()`, `setProvider()`, `showPopupUnchecked()`, `IllegalStateException()`, `getViewTreeObserver()`, `getListPopupWindow()`, `isShowingPopup()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `onMeasure()`, `measureChild()`, `setMeasuredDimension()`, `onLayout()`, `getDataModel()`, `setOnDismissListener()`, `setInitialActivityCount()`, `setDefaultActionButtonContentDescription()`, `updateAppearance()`, `Callbacks()`, `onItemClick()`, `IllegalArgumentException()`, `onClick()`, `onLongClick()`, `onDismiss()`, `notifyOnDismissListener()`, `ActivityChooserViewAdapter()`, `setDataModel()`, `notifyDataSetChanged()`, `getItemViewType()`, `return()`, `getViewTypeCount()`, `getCount()`, `getItem()`, `getItemId()`, `getView()`, `measureContentWidth()`, `for()`, `setMaxActivityCount()`, `getDefaultActivity()`, `setShowFooterView()`, `getActivityCount()`, `getHistorySize()`, `setShowDefaultActivity()`, `getShowDefaultActivity()`, `InnerLayout()`, `setBackgroundDrawable()`
- **`AdapterHelper`** — 46 function(s): `findViewHolder()`, `markViewHoldersUpdated()`, `offsetPositionsForAdd()`, `offsetPositionsForMove()`, `offsetPositionsForRemovingInvisible()`, `offsetPositionsForRemovingLaidOutOrNewView()`, `onDispatchFirstPass()`, `onDispatchSecondPass()`, `AdapterHelper()`, `this()`, `addUpdateOp()`, `reset()`, `recycleUpdateOpsAndClearList()`, `preProcess()`, `for()`, `if()`, `applyAdd()`, `applyRemove()`, `applyUpdate()`, `applyMove()`, `consumePostponedUpdates()`, `postponeAndUpdateViewHolders()`, `while()`, `dispatchAndUpdateViewHolders()`, `recycleUpdateOp()`, `IllegalArgumentException()`, `dispatchFirstPassAndUpdateViewHolders()`, `updatePositionWithPostponed()`, `canFindInPreLayout()`, `hasPendingUpdates()`, `hasAnyUpdateTypes()`, `return()`, `findPositionOffset()`, `onItemRangeChanged()`, `onItemRangeInserted()`, `onItemRangeRemoved()`, `onItemRangeMoved()`, `consumeUpdatesInOnePass()`, `applyPendingUpdatesToPosition()`, `hasUpdates()`, `UpdateOp()`, `cmdToString()`, `toString()`, `equals()`, `hashCode()`, `obtainUpdateOp()`
- **`AlertDialogLayout`** — 13 function(s): `AlertDialogLayout()`, `super()`, `onMeasure()`, `if()`, `tryOnMeasure()`, `for()`, `while()`, `setMeasuredDimension()`, `forceUniformWidth()`, `measureChildWithMargins()`, `resolveMinimumHeight()`, `onLayout()`, `setChildFrame()`
- **`AppCompatAutoCompleteTextView`** — 16 function(s): `AppCompatAutoCompleteTextView()`, `this()`, `super()`, `if()`, `setDropDownBackgroundDrawable()`, `setDropDownBackgroundResource()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `drawableStateChanged()`, `setTextAppearance()`, `onCreateInputConnection()`, `setCustomSelectionActionModeCallback()`
- **`AppCompatBackgroundHelper`** — 13 function(s): `AppCompatBackgroundHelper()`, `loadFromAttributes()`, `if()`, `setInternalBackgroundTint()`, `onSetBackgroundResource()`, `applySupportBackgroundTint()`, `onSetBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `shouldApplyFrameworkTintUsingColorFilter()`, `applyFrameworkTintUsingColorFilter()`
- **`AppCompatButton`** — 27 function(s): `AppCompatButton()`, `this()`, `super()`, `setBackgroundResource()`, `if()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `drawableStateChanged()`, `setTextAppearance()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `onLayout()`, `setTextSize()`, `onTextChanged()`, `setAutoSizeTextTypeWithDefaults()`, `setAutoSizeTextTypeUniformWithConfiguration()`, `setAutoSizeTextTypeUniformWithPresetSizes()`, `getAutoSizeTextType()`, `getAutoSizeStepGranularity()`, `getAutoSizeMinTextSize()`, `getAutoSizeMaxTextSize()`, `getAutoSizeTextAvailableSizes()`, `setSupportAllCaps()`, `setCustomSelectionActionModeCallback()`
- **`AppCompatCheckBox`** — 10 function(s): `AppCompatCheckBox()`, `this()`, `super()`, `setButtonDrawable()`, `if()`, `getCompoundPaddingLeft()`, `setSupportButtonTintList()`, `getSupportButtonTintList()`, `setSupportButtonTintMode()`, `getSupportButtonTintMode()`
- **`AppCompatCheckedTextView`** — 9 function(s): `AppCompatCheckedTextView()`, `this()`, `super()`, `setCheckMarkDrawable()`, `setTextAppearance()`, `if()`, `drawableStateChanged()`, `onCreateInputConnection()`, `setCustomSelectionActionModeCallback()`
- **`AppCompatCompoundButtonHelper`** — 11 function(s): `setButtonDrawable()`, `AppCompatCompoundButtonHelper()`, `loadFromAttributes()`, `if()`, `setSupportButtonTintList()`, `applyButtonTint()`, `getSupportButtonTintList()`, `setSupportButtonTintMode()`, `getSupportButtonTintMode()`, `onSetButtonDrawable()`, `getCompoundPaddingLeft()`
- **`AppCompatDrawableManager`** — 44 function(s): `createFromXmlInner()`, `get()`, `synchronized()`, `if()`, `installDefaultInflateDelegates()`, `getDrawable()`, `checkVectorDrawableSetup()`, `onConfigurationChanged()`, `createCacheKey()`, `return()`, `createDrawableIfNeeded()`, `addDrawableToCache()`, `tintDrawable()`, `setPorterDuffColorFilter()`, `loadDrawableFromDelegates()`, `XmlPullParserException()`, `getCachedDrawable()`, `onDrawableLoadedFromResources()`, `tintDrawableUsingColorFilter()`, `addDelegate()`, `removeDelegate()`, `arrayContains()`, `for()`, `getTintMode()`, `getTintList()`, `addTintListToCache()`, `getTintListFromCache()`, `createDefaultButtonColorStateList()`, `createButtonColorStateList()`, `createBorderlessButtonColorStateList()`, `createColoredButtonColorStateList()`, `ColorStateList()`, `createSwitchThumbColorStateList()`, `ColorFilterLruCache()`, `super()`, `put()`, `generateCacheKey()`, `createTintFilter()`, `getPorterDuffColorFilter()`, `IllegalStateException()`, `isVectorDrawable()`, `VdcInflateDelegate()`, `AvdcInflateDelegate()`, `AsldcInflateDelegate()`
- **`AppCompatEditText`** — 15 function(s): `AppCompatEditText()`, `this()`, `super()`, `getText()`, `if()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `drawableStateChanged()`, `setTextAppearance()`, `onCreateInputConnection()`, `setCustomSelectionActionModeCallback()`
- **`AppCompatHintHelper`** — 4 function(s): `onCreateInputConnection()`, `if()`, `while()`, `AppCompatHintHelper()`
- **`AppCompatImageButton`** — 20 function(s): `AppCompatImageButton()`, `this()`, `super()`, `setImageResource()`, `setImageDrawable()`, `if()`, `setImageBitmap()`, `setImageURI()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `setSupportImageTintList()`, `getSupportImageTintList()`, `setSupportImageTintMode()`, `getSupportImageTintMode()`, `drawableStateChanged()`, `hasOverlappingRendering()`
- **`AppCompatImageHelper`** — 13 function(s): `AppCompatImageHelper()`, `loadFromAttributes()`, `if()`, `setImageResource()`, `applySupportImageTint()`, `hasOverlappingRendering()`, `setSupportImageTintList()`, `getSupportImageTintList()`, `setSupportImageTintMode()`, `getSupportImageTintMode()`, `setInternalImageTint()`, `shouldApplyFrameworkTintUsingColorFilter()`, `applyFrameworkTintUsingColorFilter()`
- **`AppCompatImageView`** — 20 function(s): `AppCompatImageView()`, `this()`, `super()`, `setImageResource()`, `if()`, `setImageDrawable()`, `setImageBitmap()`, `setImageURI()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `setSupportImageTintList()`, `getSupportImageTintList()`, `setSupportImageTintMode()`, `getSupportImageTintMode()`, `drawableStateChanged()`, `hasOverlappingRendering()`
- **`AppCompatMultiAutoCompleteTextView`** — 15 function(s): `AppCompatMultiAutoCompleteTextView()`, `this()`, `super()`, `if()`, `setDropDownBackgroundDrawable()`, `setDropDownBackgroundResource()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `drawableStateChanged()`, `setTextAppearance()`, `onCreateInputConnection()`
- **`AppCompatPopupWindow`** — 8 function(s): `AppCompatPopupWindow()`, `super()`, `init()`, `if()`, `setSupportOverlapAnchor()`, `setBackgroundDrawable()`, `showAsDropDown()`, `update()`
- **`AppCompatProgressBarHelper`** — 9 function(s): `AppCompatProgressBarHelper()`, `loadFromAttributes()`, `if()`, `tileify()`, `for()`, `tileifyIndeterminate()`, `getDrawableShape()`, `RoundRectShape()`, `getSampleTime()`
- **`AppCompatRadioButton`** — 10 function(s): `AppCompatRadioButton()`, `this()`, `super()`, `setButtonDrawable()`, `if()`, `getCompoundPaddingLeft()`, `setSupportButtonTintList()`, `getSupportButtonTintList()`, `setSupportButtonTintMode()`, `getSupportButtonTintMode()`
- **`AppCompatRatingBar`** — 6 function(s): `AppCompatRatingBar()`, `this()`, `super()`, `onMeasure()`, `if()`, `setMeasuredDimension()`
- **`AppCompatSeekBar`** — 6 function(s): `AppCompatSeekBar()`, `this()`, `super()`, `onDraw()`, `drawableStateChanged()`, `jumpDrawablesToCurrentState()`
- **`AppCompatSeekBarHelper`** — 15 function(s): `AppCompatSeekBarHelper()`, `super()`, `loadFromAttributes()`, `if()`, `setTickMark()`, `applyTickMarkTint()`, `getTickMark()`, `setTickMarkTintList()`, `getTickMarkTintList()`, `setTickMarkTintMode()`, `getTickMarkTintMode()`, `jumpDrawablesToCurrentState()`, `drawableStateChanged()`, `drawTickMarks()`, `for()`
- **`AppCompatSpinner`** — 65 function(s): `AppCompatSpinner()`, `this()`, `if()`, `super()`, `getPopup()`, `onForwardingStarted()`, `setAdapter()`, `getPopupContext()`, `setPopupBackgroundDrawable()`, `setPopupBackgroundResource()`, `getPopupBackground()`, `setDropDownVerticalOffset()`, `getDropDownVerticalOffset()`, `setDropDownHorizontalOffset()`, `getDropDownHorizontalOffset()`, `setDropDownWidth()`, `getDropDownWidth()`, `onDetachedFromWindow()`, `onTouchEvent()`, `onMeasure()`, `setMeasuredDimension()`, `performClick()`, `setPrompt()`, `getPrompt()`, `setBackgroundResource()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `drawableStateChanged()`, `compatMeasureContentWidth()`, `for()`, `DropDownAdapter()`, `getCount()`, `getItem()`, `getItemId()`, `getView()`, `getDropDownView()`, `hasStableIds()`, `registerDataSetObserver()`, `unregisterDataSetObserver()`, `areAllItemsEnabled()`, `isEnabled()`, `getItemViewType()`, `getViewTypeCount()`, `isEmpty()`, `DropdownPopup()`, `setAnchorView()`, `setModal()`, `setPromptPosition()`, `setOnItemClickListener()`, `onItemClick()`, `getHintText()`, `setPromptText()`, `computeContentWidth()`, `setContentWidth()`, `setHorizontalOffset()`, `show()`, `setInputMethodMode()`, `setSelection()`, `onGlobalLayout()`, `setOnDismissListener()`, `onDismiss()`, `isVisibleToUser()`
- **`AppCompatTextHelper`** — 25 function(s): `AppCompatTextHelper()`, `loadFromAttributes()`, `if()`, `updateTypefaceAndStyle()`, `setAllCaps()`, `onFontRetrieved()`, `onFontRetrievalFailed()`, `onAsyncTypefaceReceived()`, `onSetTextAppearance()`, `applyCompoundDrawablesTints()`, `applyCompoundDrawableTint()`, `createTintInfo()`, `onLayout()`, `autoSizeText()`, `setTextSize()`, `setTextSizeInternal()`, `isAutoSizeEnabled()`, `setAutoSizeTextTypeWithDefaults()`, `setAutoSizeTextTypeUniformWithConfiguration()`, `setAutoSizeTextTypeUniformWithPresetSizes()`, `getAutoSizeTextType()`, `getAutoSizeStepGranularity()`, `getAutoSizeMinTextSize()`, `getAutoSizeMaxTextSize()`, `getAutoSizeTextAvailableSizes()`
- **`AppCompatTextView`** — 38 function(s): `AppCompatTextView()`, `this()`, `super()`, `setBackgroundResource()`, `if()`, `setBackgroundDrawable()`, `setSupportBackgroundTintList()`, `getSupportBackgroundTintList()`, `setSupportBackgroundTintMode()`, `getSupportBackgroundTintMode()`, `setTextAppearance()`, `drawableStateChanged()`, `onLayout()`, `setTextSize()`, `onTextChanged()`, `setAutoSizeTextTypeWithDefaults()`, `setAutoSizeTextTypeUniformWithConfiguration()`, `setAutoSizeTextTypeUniformWithPresetSizes()`, `getAutoSizeTextType()`, `getAutoSizeStepGranularity()`, `getAutoSizeMinTextSize()`, `getAutoSizeMaxTextSize()`, `getAutoSizeTextAvailableSizes()`, `onCreateInputConnection()`, `setFirstBaselineToTopHeight()`, `setLastBaselineToBottomHeight()`, `getFirstBaselineToTopHeight()`, `getLastBaselineToBottomHeight()`, `setLineHeight()`, `setCustomSelectionActionModeCallback()`, `getTextMetricsParamsCompat()`, `setTextMetricsParamsCompat()`, `setPrecomputedText()`, `consumeTextFutureAndSetBlocking()`, `getText()`, `setTextFuture()`, `requestLayout()`, `onMeasure()`
- **`AppCompatTextViewAutoSizeHelper`** — 35 function(s): `AppCompatTextViewAutoSizeHelper()`, `loadFromAttributes()`, `if()`, `setupAutoSizeUniformPresetSizes()`, `validateAndSetAutoSizeTextTypeUniformConfiguration()`, `setupAutoSizeText()`, `setAutoSizeTextTypeWithDefaults()`, `clearAutoSizeConfiguration()`, `autoSizeText()`, `IllegalArgumentException()`, `setAutoSizeTextTypeUniformWithConfiguration()`, `setAutoSizeTextTypeUniformWithPresetSizes()`, `for()`, `getAutoSizeTextType()`, `getAutoSizeStepGranularity()`, `getAutoSizeMinTextSize()`, `getAutoSizeMaxTextSize()`, `getAutoSizeTextAvailableSizes()`, `setupAutoSizeUniformPresetSizesConfiguration()`, `cleanupAutoSizePresetSizes()`, `while()`, `synchronized()`, `setTextSizeInternal()`, `setRawTextSize()`, `findLargestTextSizeWhichFits()`, `IllegalStateException()`, `suggestedSizeFitsInSpace()`, `return()`, `createStaticLayoutForMeasuring()`, `createStaticLayoutForMeasuringPre23()`, `StaticLayout()`, `invokeAndReturnWithDefault()`, `getTextViewMethod()`, `isAutoSizeEnabled()`, `supportsAutoSizeText()`
- **`ButtonBarLayout`** — 16 function(s): `ButtonBarLayout()`, `super()`, `setAllowStacking()`, `if()`, `setStacked()`, `requestLayout()`, `onMeasure()`, `setMinimumHeight()`, `getNextVisibleChildIndex()`, `for()`, `getMinimumHeight()`, `setOrientation()`, `setGravity()`, `bringChildToFront()`, `isStacked()`, `getOrientation()`
- **`CardView`** — 31 function(s): `if()`, `CardView()`, `this()`, `super()`, `setCardBackground()`, `getUseCompatPadding()`, `getPreventCornerOverlap()`, `setShadowPadding()`, `setMinWidthHeightInternal()`, `getCardBackground()`, `getCardView()`, `setPadding()`, `setPaddingRelative()`, `setUseCompatPadding()`, `setContentPadding()`, `onMeasure()`, `setMinimumWidth()`, `setMinimumHeight()`, `setCardBackgroundColor()`, `getCardBackgroundColor()`, `getContentPaddingLeft()`, `getContentPaddingRight()`, `getContentPaddingTop()`, `getContentPaddingBottom()`, `setRadius()`, `getRadius()`, `setCardElevation()`, `getCardElevation()`, `setMaxCardElevation()`, `getMaxCardElevation()`, `setPreventCornerOverlap()`
- **`CardViewApi17Impl`** — 2 function(s): `initStatic()`, `drawRoundRect()`
- **`CardViewApi21Impl`** — 18 function(s): `initialize()`, `setMaxElevation()`, `setRadius()`, `getCardBackground()`, `initStatic()`, `updatePadding()`, `getMaxElevation()`, `getMinWidth()`, `getRadius()`, `getMinHeight()`, `setElevation()`, `getElevation()`, `if()`, `onCompatPaddingChanged()`, `onPreventCornerOverlapChanged()`, `setBackgroundColor()`, `getBackgroundColor()`, `return()`
- **`CardViewBaseImpl`** — 21 function(s): `initStatic()`, `drawRoundRect()`, `if()`, `initialize()`, `updatePadding()`, `createBackground()`, `RoundRectDrawableWithShadow()`, `getShadowBackground()`, `onCompatPaddingChanged()`, `onPreventCornerOverlapChanged()`, `setBackgroundColor()`, `getBackgroundColor()`, `setRadius()`, `getRadius()`, `setElevation()`, `getElevation()`, `setMaxElevation()`, `getMaxElevation()`, `getMinWidth()`, `getMinHeight()`, `return()`
- **`CardViewDelegate`** — 7 function(s): `getCardBackground()`, `getCardView()`, `getPreventCornerOverlap()`, `getUseCompatPadding()`, `setCardBackground()`, `setMinWidthHeightInternal()`, `setShadowPadding()`
- **`CardViewImpl`** — 15 function(s): `getBackgroundColor()`, `getElevation()`, `getMaxElevation()`, `getMinHeight()`, `getMinWidth()`, `getRadius()`, `initStatic()`, `initialize()`, `onCompatPaddingChanged()`, `onPreventCornerOverlapChanged()`, `setBackgroundColor()`, `setElevation()`, `setMaxElevation()`, `setRadius()`, `updatePadding()`
- **`ChildHelper`** — 40 function(s): `addView()`, `attachViewToParent()`, `detachViewFromParent()`, `getChildAt()`, `getChildCount()`, `getChildViewHolder()`, `indexOfChild()`, `onEnteredHiddenState()`, `onLeftHiddenState()`, `removeAllViews()`, `removeViewAt()`, `ChildHelper()`, `hideViewInternal()`, `unhideViewInternal()`, `if()`, `getOffset()`, `while()`, `removeView()`, `removeAllViewsUnfiltered()`, `for()`, `findHiddenNonRemovedView()`, `getUnfilteredChildCount()`, `getUnfilteredChildAt()`, `isHidden()`, `hide()`, `IllegalArgumentException()`, `unhide()`, `RuntimeException()`, `toString()`, `removeViewIfHidden()`, `Bucket()`, `set()`, `ensureNext()`, `clear()`, `get()`, `return()`, `reset()`, `insert()`, `remove()`, `countOnesBefore()`
- **`ContentFrameLayout`** — 19 function(s): `onAttachedFromWindow()`, `onDetachedFromWindow()`, `ContentFrameLayout()`, `this()`, `super()`, `dispatchFitSystemWindows()`, `fitSystemWindows()`, `setAttachListener()`, `setDecorPadding()`, `if()`, `requestLayout()`, `onMeasure()`, `getMinWidthMajor()`, `getMinWidthMinor()`, `getFixedWidthMajor()`, `getFixedWidthMinor()`, `getFixedHeightMajor()`, `getFixedHeightMinor()`, `onAttachedToWindow()`
- **`DecorContentParent`** — 19 function(s): `canShowOverflowMenu()`, `dismissPopups()`, `getTitle()`, `hasIcon()`, `hasLogo()`, `hideOverflowMenu()`, `initFeature()`, `isOverflowMenuShowPending()`, `isOverflowMenuShowing()`, `restoreToolbarHierarchyState()`, `saveToolbarHierarchyState()`, `setIcon()`, `setLogo()`, `setMenu()`, `setMenuPrepared()`, `setUiOptions()`, `setWindowCallback()`, `setWindowTitle()`, `showOverflowMenu()`
- **`DecorToolbar`** — 53 function(s): `animateToVisibility()`, `canShowOverflowMenu()`, `collapseActionView()`, `dismissPopupMenus()`, `getContext()`, `getCustomView()`, `getDisplayOptions()`, `getDropdownItemCount()`, `getDropdownSelectedPosition()`, `getHeight()`, `getMenu()`, `getNavigationMode()`, `getSubtitle()`, `getTitle()`, `getViewGroup()`, `getVisibility()`, `hasEmbeddedTabs()`, `hasExpandedActionView()`, `hasIcon()`, `hasLogo()`, `hideOverflowMenu()`, `initIndeterminateProgress()`, `initProgress()`, `isOverflowMenuShowPending()`, `isOverflowMenuShowing()`, `isTitleTruncated()`, `restoreHierarchyState()`, `saveHierarchyState()`, `setBackgroundDrawable()`, `setCollapsible()`, `setCustomView()`, `setDefaultNavigationContentDescription()`, `setDefaultNavigationIcon()`, `setDisplayOptions()`, `setDropdownParams()`, `setDropdownSelectedPosition()`, `setEmbeddedTabView()`, `setHomeButtonEnabled()`, `setIcon()`, `setLogo()`, `setMenu()`, `setMenuCallbacks()`, `setMenuPrepared()`, `setNavigationContentDescription()`, `setNavigationIcon()`, `setNavigationMode()`, `setSubtitle()`, `setTitle()`, `setVisibility()`, `setWindowCallback()`, `setWindowTitle()`, `setupAnimatorToVisibility()`, `showOverflowMenu()`
- **`DefaultItemAnimator`** — 35 function(s): `MoveInfo()`, `ChangeInfo()`, `this()`, `toString()`, `runPendingAnimations()`, `if()`, `while()`, `animateRemoveImpl()`, `run()`, `animateRemove()`, `resetAnimation()`, `onAnimationStart()`, `onAnimationEnd()`, `animateAdd()`, `animateAddImpl()`, `onAnimationCancel()`, `animateMove()`, `dispatchMoveFinished()`, `animateMoveImpl()`, `animateChange()`, `animateChangeImpl()`, `endChangeAnimation()`, `for()`, `endChangeAnimationIfNecessary()`, `dispatchChangeFinished()`, `endAnimation()`, `dispatchRemoveFinished()`, `dispatchAddFinished()`, `dispatchFinishedWhenDone()`, `isRunning()`, `return()`, `dispatchAnimationsFinished()`, `endAnimations()`, `cancelAll()`, `canReuseUpdatedViewHolder()`
- **`DialogTitle`** — 8 function(s): `DialogTitle()`, `super()`, `onMeasure()`, `if()`, `setSingleLine()`, `setMaxLines()`, `setTextSize()`, `setCustomSelectionActionModeCallback()`
- **`DividerItemDecoration`** — 10 function(s): `DividerItemDecoration()`, `if()`, `setOrientation()`, `IllegalArgumentException()`, `setDrawable()`, `onDraw()`, `drawVertical()`, `drawHorizontal()`, `for()`, `getItemOffsets()`
- **`DrawableUtils`** — 9 function(s): `if()`, `DrawableUtils()`, `getOpticalBounds()`, `for()`, `switch()`, `fixDrawable()`, `fixVectorDrawableTinting()`, `canSafelyMutateDrawable()`, `parseTintMode()`
- **`DropDownListView`** — 50 function(s): `DropDownListView()`, `super()`, `setCacheColorHint()`, `isInTouchMode()`, `return()`, `hasWindowFocus()`, `isFocused()`, `hasFocus()`, `setSelector()`, `if()`, `drawableStateChanged()`, `setSelectorEnabled()`, `updateSelectorStateCompat()`, `dispatchDraw()`, `drawSelectorCompat()`, `onTouchEvent()`, `lookForSelectablePosition()`, `while()`, `measureHeightOfChildrenCompat()`, `getListPaddingLeft()`, `getListPaddingRight()`, `GateKeeperDrawable()`, `setEnabled()`, `setState()`, `draw()`, `setHotspot()`, `setHotspotBounds()`, `setVisible()`, `onHoverEvent()`, `setSelectionFromTop()`, `setSelection()`, `onDetachedFromWindow()`, `onForwardedEvent()`, `clearPressedItem()`, `setPressedItem()`, `clickPressedItem()`, `performItemClick()`, `setListSelectionHidden()`, `positionSelectorLikeTouchCompat()`, `positionSelectorLikeFocusCompat()`, `positionSelectorCompat()`, `refreshDrawableState()`, `setPressed()`, `drawableHotspotChanged()`, `layoutChildren()`, `touchModeDrawsInPressedStateCompat()`, `ResolveHoverRunnable()`, `run()`, `cancel()`, `post()`
- **`FastScroller`** — 40 function(s): `run()`, `onScrolled()`, `FastScroller()`, `attachToRecyclerView()`, `if()`, `destroyCallbacks()`, `setupCallbacks()`, `cancelHide()`, `requestRedraw()`, `setState()`, `show()`, `resetHideDelay()`, `isLayoutRTL()`, `isDragging()`, `isVisible()`, `isHidden()`, `hide()`, `onDrawOver()`, `drawVerticalScrollbar()`, `drawHorizontalScrollbar()`, `updateScrollPosition()`, `onInterceptTouchEvent()`, `onTouchEvent()`, `horizontalScrollTo()`, `verticalScrollTo()`, `onRequestDisallowInterceptTouchEvent()`, `scrollTo()`, `isPointInsideVerticalThumb()`, `isPointInsideHorizontalThumb()`, `getHorizontalTrackDrawable()`, `getHorizontalThumbDrawable()`, `getVerticalTrackDrawable()`, `getVerticalThumbDrawable()`, `getVerticalRange()`, `getHorizontalRange()`, `AnimatorListener()`, `onAnimationEnd()`, `onAnimationCancel()`, `AnimatorUpdater()`, `onAnimationUpdate()`
- **`FitWindowsFrameLayout`** — 5 function(s): `FitWindowsFrameLayout()`, `super()`, `setOnFitSystemWindowsListener()`, `fitSystemWindows()`, `if()`
- **`FitWindowsLinearLayout`** — 5 function(s): `FitWindowsLinearLayout()`, `super()`, `setOnFitSystemWindowsListener()`, `fitSystemWindows()`, `if()`
- **`FitWindowsViewGroup`** — 2 function(s): `onFitSystemWindows()`, `setOnFitSystemWindowsListener()`
- **`ForwardingListener`** — 18 function(s): `getPopup()`, `ForwardingListener()`, `onTouch()`, `if()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `onForwardingStarted()`, `onForwardingStopped()`, `onTouchObserved()`, `clearCallbacks()`, `onLongPress()`, `onTouchForwarded()`, `toGlobalMotionEvent()`, `toLocalMotionEvent()`, `pointInView()`, `DisallowIntercept()`, `run()`, `TriggerLongPress()`
- **`GapWorker`** — 22 function(s): `compare()`, `if()`, `Task()`, `clear()`, `setPrefetchVector()`, `collectPrefetchPositionsFromView()`, `addPosition()`, `IllegalArgumentException()`, `lastPrefetchIncludedPosition()`, `for()`, `clearPrefetchPositions()`, `add()`, `remove()`, `postFromTraversal()`, `buildTaskList()`, `isPrefetchPositionAttached()`, `prefetchPositionWithDeadline()`, `prefetchInnerRecyclerViewWithDeadline()`, `flushTaskWithDeadline()`, `flushTasksWithDeadline()`, `prefetch()`, `run()`
- **`GridLayoutManager`** — 60 function(s): `GridLayoutManager()`, `super()`, `setSpanCount()`, `setStackFromEnd()`, `if()`, `UnsupportedOperationException()`, `getRowCountForAccessibility()`, `getSpanGroupIndex()`, `getColumnCountForAccessibility()`, `onInitializeAccessibilityNodeInfoForItem()`, `onLayoutChildren()`, `cachePreLayoutSpanMapping()`, `clearPreLayoutSpanMappingCache()`, `onLayoutCompleted()`, `for()`, `onItemsAdded()`, `onItemsChanged()`, `onItemsRemoved()`, `onItemsUpdated()`, `onItemsMoved()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `checkLayoutParams()`, `setSpanSizeLookup()`, `getSpanSizeLookup()`, `updateMeasurements()`, `calculateItemBorders()`, `setMeasuredDimension()`, `getSpaceForSpanRange()`, `onAnchorReady()`, `ensureAnchorIsInCorrectSpan()`, `ensureViewSet()`, `scrollHorizontallyBy()`, `scrollVerticallyBy()`, `while()`, `findReferenceChild()`, `ensureLayoutState()`, `getSpanIndex()`, `getSpanSize()`, `collectPrefetchPositionsForLayoutState()`, `layoutChunk()`, `IllegalArgumentException()`, `assignSpans()`, `addView()`, `addDisappearingView()`, `calculateItemDecorationsForChild()`, `measureChild()`, `guessMeasurement()`, `measureChildWithDecorationsAndMargin()`, `layoutDecoratedWithMargins()`, `getSpanCount()`, `requestLayout()`, `setSpanIndexCacheEnabled()`, `invalidateSpanIndexCache()`, `isSpanIndexCacheEnabled()`, `getCachedSpanIndex()`, `findReferenceIndexFromCache()`, `onFocusSearchFailed()`, `supportsPredictiveItemAnimations()`
- **`LayoutState`** — 3 function(s): `hasMore()`, `next()`, `toString()`
- **`LinearLayoutCompat`** — 66 function(s): `LinearLayoutCompat()`, `this()`, `super()`, `if()`, `setOrientation()`, `setGravity()`, `setBaselineAligned()`, `setDividerDrawable()`, `setShowDividers()`, `requestLayout()`, `shouldDelayChildPressedState()`, `getShowDividers()`, `getDividerDrawable()`, `setWillNotDraw()`, `setDividerPadding()`, `getDividerPadding()`, `getDividerWidth()`, `onDraw()`, `drawDividersVertical()`, `drawDividersHorizontal()`, `for()`, `drawHorizontalDivider()`, `drawVerticalDivider()`, `isBaselineAligned()`, `isMeasureWithLargestChildEnabled()`, `setMeasureWithLargestChildEnabled()`, `getBaseline()`, `RuntimeException()`, `getBaselineAlignedChildIndex()`, `setBaselineAlignedChildIndex()`, `IllegalArgumentException()`, `getVirtualChildAt()`, `getChildAt()`, `getVirtualChildCount()`, `getChildCount()`, `getWeightSum()`, `setWeightSum()`, `onMeasure()`, `measureVertical()`, `measureHorizontal()`, `hasDividerBeforeChildAt()`, `return()`, `while()`, `measureChildBeforeLayout()`, `setMeasuredDimension()`, `forceUniformWidth()`, `measureChildWithMargins()`, `forceUniformHeight()`, `getChildrenSkipCount()`, `measureNullChild()`, `getLocationOffset()`, `getNextLocationOffset()`, `onLayout()`, `layoutVertical()`, `layoutHorizontal()`, `setChildFrame()`, `getOrientation()`, `getGravity()`, `setHorizontalGravity()`, `setVerticalGravity()`, `generateLayoutParams()`, `LayoutParams()`, `generateDefaultLayoutParams()`, `checkLayoutParams()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`
- **`LinearLayoutManager`** — 135 function(s): `LinearLayoutManager()`, `this()`, `setOrientation()`, `setReverseLayout()`, `setStackFromEnd()`, `isAutoMeasureEnabled()`, `generateDefaultLayoutParams()`, `getRecycleChildrenOnDetach()`, `setRecycleChildrenOnDetach()`, `onDetachedFromWindow()`, `if()`, `removeAndRecycleAllViews()`, `onInitializeAccessibilityEvent()`, `onSaveInstanceState()`, `SavedState()`, `ensureLayoutState()`, `onRestoreInstanceState()`, `requestLayout()`, `canScrollHorizontally()`, `canScrollVertically()`, `assertNotInLayoutOrScroll()`, `getStackFromEnd()`, `getOrientation()`, `IllegalArgumentException()`, `resolveShouldLayoutReverse()`, `getReverseLayout()`, `findViewByPosition()`, `getExtraLayoutSpace()`, `smoothScrollToPosition()`, `startSmoothScroll()`, `computeScrollVectorForPosition()`, `PointF()`, `onLayoutChildren()`, `updateAnchorInfoForLayout()`, `onAnchorReady()`, `detachAndScrapAttachedViews()`, `updateLayoutStateToFillStart()`, `fill()`, `updateLayoutStateToFillEnd()`, `layoutForPredictiveAnimations()`, `onLayoutCompleted()`, `for()`, `updateAnchorFromChildren()`, `updateAnchorFromPendingData()`, `fixLayoutEndGap()`, `fixLayoutStartGap()`, `isLayoutRTL()`, `getLayoutDirection()`, `createLayoutState()`, `LayoutState()`, `scrollToPosition()`, `scrollToPositionWithOffset()`, `scrollHorizontallyBy()`, `scrollBy()`, `scrollVerticallyBy()`, `computeHorizontalScrollOffset()`, `computeScrollOffset()`, `computeVerticalScrollOffset()`, `computeHorizontalScrollExtent()`, `computeScrollExtent()`, `computeVerticalScrollExtent()`, `computeHorizontalScrollRange()`, `computeScrollRange()`, `computeVerticalScrollRange()`, `setSmoothScrollbarEnabled()`, `isSmoothScrollbarEnabled()`, `updateLayoutState()`, `resolveIsInfinite()`, `collectPrefetchPositionsForLayoutState()`, `collectInitialPrefetchPositions()`, `setInitialPrefetchItemCount()`, `getInitialPrefetchItemCount()`, `collectAdjacentPrefetchPositions()`, `recycleChildren()`, `removeAndRecycleViewAt()`, `recycleViewsFromStart()`, `recycleViewsFromEnd()`, `recycleByLayoutState()`, `while()`, `layoutChunk()`, `addView()`, `addDisappearingView()`, `measureChildWithMargins()`, `layoutDecoratedWithMargins()`, `shouldMeasureTwice()`, `return()`, `convertFocusDirectionToLayoutDirection()`, `getChildClosestToStart()`, `getChildAt()`, `getChildClosestToEnd()`, `findFirstVisibleChildClosestToStart()`, `findOneVisibleChild()`, `findFirstVisibleChildClosestToEnd()`, `findReferenceChildClosestToEnd()`, `findReferenceChildClosestToStart()`, `findFirstReferenceChild()`, `findReferenceChild()`, `findLastReferenceChild()`, `findPartiallyOrCompletelyInvisibleChildClosestToEnd()`, `findPartiallyOrCompletelyInvisibleChildClosestToStart()`, `findFirstPartiallyOrCompletelyInvisibleChild()`, `findOnePartiallyOrCompletelyInvisibleChild()`, `findLastPartiallyOrCompletelyInvisibleChild()`, `findFirstVisibleItemPosition()`, `getPosition()`, `findFirstCompletelyVisibleItemPosition()`, `findLastVisibleItemPosition()`, `findLastCompletelyVisibleItemPosition()`, `onFocusSearchFailed()`, `logChildren()`, `validateChildOrder()`, `RuntimeException()`, `supportsPredictiveItemAnimations()`, `prepareForDrop()`, `hasMore()`, `next()`, `nextViewFromScrapList()`, `assignPositionFromScrapList()`, `nextViewInLimitedList()`, `log()`, `createFromParcel()`, `newArray()`, `hasValidAnchor()`, `invalidateAnchor()`, `describeContents()`, `writeToParcel()`, `AnchorInfo()`, `reset()`, `assignCoordinateFromPadding()`, `toString()`, `isViewValidAsAnchor()`, `assignFromViewAndKeepVisibleRect()`, `assignFromView()`, `LayoutChunkResult()`, `resetInternal()`
- **`LinearSmoothScroller`** — 20 function(s): `LinearSmoothScroller()`, `onStart()`, `onTargetFound()`, `if()`, `onSeekTargetStep()`, `stop()`, `updateActionForInterimTarget()`, `onStop()`, `calculateSpeedPerPixel()`, `calculateTimeForDeceleration()`, `return()`, `calculateTimeForScrolling()`, `getHorizontalSnapPreference()`, `getVerticalSnapPreference()`, `normalize()`, `clampApplyScroll()`, `calculateDtToFit()`, `IllegalArgumentException()`, `calculateDyToMakeVisible()`, `calculateDxToMakeVisible()`
- **`LinearSnapHelper`** — 11 function(s): `calculateDistanceToFinalSnap()`, `if()`, `findTargetSnapPosition()`, `findSnapView()`, `findCenterView()`, `distanceToCenter()`, `estimateNextPositionDiffForFling()`, `for()`, `computeDistancePerChild()`, `getVerticalHelper()`, `getHorizontalHelper()`
- **`ListPopupWindow`** — 81 function(s): `ListPopupWindow()`, `this()`, `if()`, `setAdapter()`, `setPromptPosition()`, `getPromptPosition()`, `setModal()`, `isModal()`, `setForceIgnoreOutsideTouch()`, `setDropDownAlwaysVisible()`, `isDropDownAlwaysVisible()`, `setSoftInputMode()`, `getSoftInputMode()`, `setListSelector()`, `getBackground()`, `setBackgroundDrawable()`, `setAnimationStyle()`, `getAnimationStyle()`, `getAnchorView()`, `setAnchorView()`, `getHorizontalOffset()`, `setHorizontalOffset()`, `getVerticalOffset()`, `setVerticalOffset()`, `setEpicenterBounds()`, `setDropDownGravity()`, `getWidth()`, `setWidth()`, `setContentWidth()`, `getHeight()`, `setHeight()`, `IllegalArgumentException()`, `setWindowLayoutType()`, `setOnItemClickListener()`, `setOnItemSelectedListener()`, `setPromptView()`, `removePromptView()`, `show()`, `postShow()`, `setPopupClipToScreenEnabled()`, `clearListSelection()`, `dismiss()`, `setOnDismissListener()`, `setInputMethodMode()`, `getInputMethodMode()`, `setSelection()`, `isShowing()`, `isInputMethodNotNeeded()`, `performItemClick()`, `getSelectedItem()`, `getSelectedItemPosition()`, `getSelectedItemId()`, `getSelectedView()`, `getListView()`, `createDropDownListView()`, `DropDownListView()`, `setListItemExpandMax()`, `onKeyDown()`, `onKeyUp()`, `onKeyPreIme()`, `createDragToOpenListener()`, `ForwardingListener()`, `getPopup()`, `buildDropDown()`, `run()`, `onItemSelected()`, `onNothingSelected()`, `setOverlapAnchor()`, `PopupDataSetObserver()`, `onChanged()`, `onInvalidated()`, `ListSelectorHider()`, `ResizePopupRunnable()`, `PopupTouchInterceptor()`, `onTouch()`, `PopupScrollListener()`, `onScroll()`, `onScrollStateChanged()`, `isConfirmKey()`, `getMaxAvailableHeight()`, `return()`
- **`MenuItemHoverListener`** — 2 function(s): `onItemHoverEnter()`, `onItemHoverExit()`
- **`MenuPopupWindow`** — 16 function(s): `MenuPopupWindow()`, `super()`, `createDropDownListView()`, `setEnterTransition()`, `if()`, `setExitTransition()`, `setHoverListener()`, `setTouchModal()`, `onItemHoverEnter()`, `onItemHoverExit()`, `MenuDropDownListView()`, `clearSelection()`, `setSelection()`, `onKeyDown()`, `performItemClick()`, `onHoverEvent()`
- **`OpReorderer`** — 12 function(s): `obtainUpdateOp()`, `recycleUpdateOp()`, `OpReorderer()`, `reorderOps()`, `while()`, `if()`, `swapMoveOp()`, `swapMoveAdd()`, `swapMoveRemove()`, `swapMoveUpdate()`, `getLastMoveOutOfOrder()`, `for()`
- **`OrientationHelper`** — 25 function(s): `getDecoratedEnd()`, `getDecoratedMeasurement()`, `getDecoratedMeasurementInOther()`, `getDecoratedStart()`, `getEnd()`, `getEndAfterPadding()`, `getEndPadding()`, `getMode()`, `getModeInOther()`, `getStartAfterPadding()`, `getTotalSpace()`, `getTransformedEndWithDecoration()`, `getTransformedStartWithDecoration()`, `offsetChild()`, `offsetChildren()`, `OrientationHelper()`, `getLayoutManager()`, `onLayoutComplete()`, `getTotalSpaceChange()`, `if()`, `createOrientationHelper()`, `createHorizontalHelper()`, `createVerticalHelper()`, `IllegalArgumentException()`, `return()`
- **`PagerSnapHelper`** — 15 function(s): `calculateDistanceToFinalSnap()`, `if()`, `findSnapView()`, `findCenterView()`, `findTargetSnapPosition()`, `createSnapScroller()`, `LinearSmoothScroller()`, `onTargetFound()`, `calculateSpeedPerPixel()`, `calculateTimeForScrolling()`, `distanceToCenter()`, `for()`, `findStartView()`, `getVerticalHelper()`, `getHorizontalHelper()`
- **`PopupMenu`** — 22 function(s): `onDismiss()`, `onMenuItemClick()`, `PopupMenu()`, `this()`, `onMenuItemSelected()`, `if()`, `onMenuModeChange()`, `setGravity()`, `getGravity()`, `getDragToOpenListener()`, `onForwardingStarted()`, `onForwardingStopped()`, `getPopup()`, `getMenu()`, `getMenuInflater()`, `SupportMenuInflater()`, `inflate()`, `show()`, `dismiss()`, `setOnMenuItemClickListener()`, `setOnDismissListener()`, `getMenuListView()`
- **`RecyclerView`** — 587 function(s): `onGetChildDrawingOrder()`, `onChildViewAttachedToWindow()`, `onChildViewDetachedFromWindow()`, `onFling()`, `onInterceptTouchEvent()`, `onRequestDisallowInterceptTouchEvent()`, `onTouchEvent()`, `onViewRecycled()`, `getViewForPositionAndType()`, `getInterpolation()`, `return()`, `RecyclerView()`, `this()`, `super()`, `run()`, `if()`, `processDisappeared()`, `processAppeared()`, `processPersistent()`, `unused()`, `setScrollContainer()`, `setFocusableInTouchMode()`, `setWillNotDraw()`, `initAdapterManager()`, `initChildrenHelper()`, `initAutofill()`, `setAccessibilityDelegateCompat()`, `setDescendantFocusability()`, `initFastScroller()`, `createLayoutManager()`, `setNestedScrollingEnabled()`, `exceptionLabel()`, `getCompatAccessibilityDelegate()`, `IllegalStateException()`, `setLayoutManager()`, `getFullClassName()`, `getChildCount()`, `addView()`, `indexOfChild()`, `removeViewAt()`, `getChildAt()`, `removeAllViews()`, `for()`, `getChildViewHolder()`, `attachViewToParent()`, `IllegalArgumentException()`, `detachViewFromParent()`, `onEnteredHiddenState()`, `onLeftHiddenState()`, `findViewHolder()`, `offsetPositionsForRemovingInvisible()`, `offsetPositionsForRemovingLaidOutOrNewView()`, `markViewHoldersUpdated()`, `onDispatchFirstPass()`, `dispatchUpdate()`, `onDispatchSecondPass()`, `offsetPositionsForAdd()`, `offsetPositionsForMove()`, `setHasFixedSize()`, `hasFixedSize()`, `setClipToPadding()`, `invalidateGlows()`, `requestLayout()`, `getClipToPadding()`, `setScrollingTouchSlop()`, `swapAdapter()`, `setLayoutFrozen()`, `setAdapterInternal()`, `processDataSetCompletelyChanged()`, `setAdapter()`, `removeAndRecycleViews()`, `getAdapter()`, `setRecyclerListener()`, `getBaseline()`, `addOnChildAttachStateChangeListener()`, `removeOnChildAttachStateChangeListener()`, `clearOnChildAttachStateChangeListeners()`, `stopScroll()`, `setOnFlingListener()`, `getOnFlingListener()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `dispatchSaveInstanceState()`, `dispatchFreezeSelfOnly()`, `dispatchRestoreInstanceState()`, `dispatchThawSelfOnly()`, `addAnimatingView()`, `removeAnimatingView()`, `startInterceptRequestLayout()`, `stopInterceptRequestLayout()`, `getLayoutManager()`, `getRecycledViewPool()`, `setRecycledViewPool()`, `setViewCacheExtension()`, `setItemViewCacheSize()`, `getScrollState()`, `setScrollState()`, `stopScrollersInternal()`, `dispatchOnScrollStateChanged()`, `addItemDecoration()`, `markItemDecorInsetsDirty()`, `getItemDecorationAt()`, `IndexOutOfBoundsException()`, `getItemDecorationCount()`, `removeItemDecorationAt()`, `removeItemDecoration()`, `setChildDrawingOrderCallback()`, `setChildrenDrawingOrderEnabled()`, `setOnScrollListener()`, `addOnScrollListener()`, `removeOnScrollListener()`, `clearOnScrollListeners()`, `scrollToPosition()`, `awakenScrollBars()`, `jumpToPositionForSmoothScroller()`, `smoothScrollToPosition()`, `scrollTo()`, `scrollBy()`, `scrollByInternal()`, `scrollStep()`, `onEnterLayoutOrScroll()`, `fillRemainingScrollValues()`, `repositionShadowingViews()`, `onExitLayoutOrScroll()`, `consumePendingUpdateOperations()`, `dispatchLayout()`, `hasUpdatedView()`, `invalidate()`, `pullGlows()`, `considerReleasingGlowsOnScroll()`, `dispatchOnScrolled()`, `computeHorizontalScrollOffset()`, `computeHorizontalScrollExtent()`, `computeHorizontalScrollRange()`, `computeVerticalScrollOffset()`, `computeVerticalScrollExtent()`, `computeVerticalScrollRange()`, `assertNotInLayoutOrScroll()`, `isLayoutFrozen()`, `smoothScrollBy()`, `fling()`, `dispatchNestedFling()`, `startNestedScroll()`, `getMinFlingVelocity()`, `getMaxFlingVelocity()`, `ensureLeftGlow()`, `ensureRightGlow()`, `ensureTopGlow()`, `ensureBottomGlow()`, `releaseGlows()`, `absorbGlows()`, `setEdgeEffectFactory()`, `getEdgeEffectFactory()`, `focusSearch()`, `isPreferredNextFocus()`, `requestChildOnScreen()`, `offsetDescendantRectToMyCoords()`, `requestChildFocus()`, `offsetRectIntoDescendantCoords()`, `requestChildRectangleOnScreen()`, `addFocusables()`, `onRequestFocusInDescendants()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `removeCallbacks()`, `isAttachedToWindow()`, `assertInLayoutOrScroll()`, `addOnItemTouchListener()`, `removeOnItemTouchListener()`, `dispatchOnItemTouchIntercept()`, `dispatchOnItemTouch()`, `cancelTouch()`, `getParent()`, `onPointerUp()`, `stopNestedScroll()`, `requestDisallowInterceptTouchEvent()`, `resetTouch()`, `onGenericMotionEvent()`, `onMeasure()`, `defaultOnMeasure()`, `dispatchLayoutStep1()`, `dispatchLayoutStep2()`, `processAdapterUpdatesAndSetAnimationFlags()`, `setMeasuredDimension()`, `onSizeChanged()`, `setItemAnimator()`, `dispatchContentChangedIfNecessary()`, `dispatchPendingImportantForAccessibilityChanges()`, `isAccessibilityEnabled()`, `sendAccessibilityEventUnchecked()`, `isComputingLayout()`, `shouldDeferAccessibilityEvent()`, `getItemAnimator()`, `postAnimationRunner()`, `predictiveItemAnimationsEnabled()`, `dispatchLayoutStep3()`, `saveFocusInfo()`, `resetFocusInfo()`, `findNextViewToFocus()`, `recoverFocusFromState()`, `requestFocus()`, `getDeepestFocusedViewWithId()`, `while()`, `findMinMaxChildLayoutPositions()`, `saveOldPositions()`, `recordAnimationInfoIfBouncedHiddenView()`, `clearOldPositions()`, `handleMissingPreInfoForChangeError()`, `animateChange()`, `didChildRangeChange()`, `removeDetachedView()`, `dispatchChildDetached()`, `getChangedHolderKey()`, `animateAppearance()`, `animateDisappearance()`, `onLayout()`, `draw()`, `onDraw()`, `checkLayoutParams()`, `generateDefaultLayoutParams()`, `generateLayoutParams()`, `isAnimating()`, `offsetPositionRecordsForMove()`, `offsetPositionRecordsForInsert()`, `offsetPositionRecordsForRemove()`, `viewRangeUpdate()`, `canReuseUpdatedViewHolder()`, `markKnownViewsInvalid()`, `invalidateItemDecorations()`, `getPreserveFocusAfterLayout()`, `setPreserveFocusAfterLayout()`, `getChildViewHolderInt()`, `findContainingItemView()`, `findContainingViewHolder()`, `getChildPosition()`, `getChildAdapterPosition()`, `getChildLayoutPosition()`, `getChildItemId()`, `findViewHolderForPosition()`, `findViewHolderForLayoutPosition()`, `findViewHolderForAdapterPosition()`, `findViewHolderForItemId()`, `findChildViewUnder()`, `drawChild()`, `offsetChildrenVertical()`, `onChildAttachedToWindow()`, `onChildDetachedFromWindow()`, `offsetChildrenHorizontal()`, `getDecoratedBoundsWithMargins()`, `getDecoratedBoundsWithMarginsInt()`, `getItemDecorInsetsForChild()`, `onScrolled()`, `onScrollChanged()`, `onScrollStateChanged()`, `hasPendingAdapterUpdates()`, `ViewFlinger()`, `stop()`, `disableRunOnAnimationRequests()`, `postOnAnimation()`, `enableRunOnAnimationRequests()`, `distanceInfluenceForSnapDuration()`, `computeScrollDuration()`, `RecyclerViewDataObserver()`, `onChanged()`, `onItemRangeChanged()`, `triggerUpdateProcessor()`, `onItemRangeInserted()`, `onItemRangeRemoved()`, `onItemRangeMoved()`, `createEdgeEffect()`, `EdgeEffect()`, `ScrapData()`, `clear()`, `setMaxRecycledViews()`, `getRecycledViewCount()`, `getScrapDataForType()`, `getRecycledView()`, `size()`, `putRecycledView()`, `runningAverage()`, `factorInCreateTime()`, `factorInBindTime()`, `willCreateInTime()`, `willBindInTime()`, `attach()`, `detach()`, `onAdapterChanged()`, `findNestedRecyclerView()`, `clearNestedRecyclerViewIfNotNested()`, `getNanoTime()`, `Recycler()`, `recycleAndClearCachedViews()`, `setViewCacheSize()`, `updateViewCacheSize()`, `recycleCachedViewAt()`, `getScrapList()`, `validateViewHolderForOffsetPosition()`, `tryBindViewHolderByDeadline()`, `attachAccessibilityDelegateOnBind()`, `bindViewToPosition()`, `convertPreLayoutPositionToPostLayout()`, `getViewForPosition()`, `tryGetViewHolderForPositionByDeadline()`, `recycleViewHolderInternal()`, `invalidateDisplayListInt()`, `recycleView()`, `recycleViewInternal()`, `addViewHolderToRecycledViewPool()`, `dispatchViewRecycled()`, `quickRecycleScrapView()`, `scrapView()`, `unscrapView()`, `getScrapCount()`, `getScrapViewAt()`, `clearScrap()`, `getChangedScrapViewForPosition()`, `getScrapOrHiddenOrCachedHolderForPosition()`, `getScrapOrCachedViewForId()`, `getItemCount()`, `onBindViewHolder()`, `onCreateViewHolder()`, `createViewHolder()`, `bindViewHolder()`, `getItemViewType()`, `setHasStableIds()`, `getItemId()`, `hasStableIds()`, `onFailedToRecycleView()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `hasObservers()`, `registerAdapterDataObserver()`, `unregisterAdapterDataObserver()`, `onAttachedToRecyclerView()`, `onDetachedFromRecyclerView()`, `notifyDataSetChanged()`, `notifyItemChanged()`, `notifyItemRangeChanged()`, `notifyItemInserted()`, `notifyItemMoved()`, `notifyItemRangeInserted()`, `notifyItemRemoved()`, `notifyItemRangeRemoved()`, `dispatchChildAttached()`, `getParentStart()`, `getParentEnd()`, `getChildStart()`, `getChildEnd()`, `addPosition()`, `setRecyclerView()`, `setMeasureSpecs()`, `setMeasuredDimensionFromChildren()`, `chooseSize()`, `setAutoMeasureEnabled()`, `isAutoMeasureEnabled()`, `supportsPredictiveItemAnimations()`, `setItemPrefetchEnabled()`, `isItemPrefetchEnabled()`, `collectAdjacentPrefetchPositions()`, `collectInitialPrefetchPositions()`, `dispatchAttachedToWindow()`, `dispatchDetachedFromWindow()`, `onLayoutChildren()`, `onLayoutCompleted()`, `LayoutParams()`, `scrollHorizontallyBy()`, `scrollVerticallyBy()`, `canScrollHorizontally()`, `canScrollVertically()`, `startSmoothScroll()`, `isSmoothScrolling()`, `getLayoutDirection()`, `endAnimation()`, `addDisappearingView()`, `addViewInt()`, `removeView()`, `getPosition()`, `findViewByPosition()`, `detachView()`, `detachViewInternal()`, `detachViewAt()`, `attachView()`, `moveView()`, `detachAndScrapView()`, `scrapOrRecycleView()`, `detachAndScrapViewAt()`, `removeAndRecycleView()`, `removeAndRecycleViewAt()`, `getWidthMode()`, `getHeightMode()`, `getWidth()`, `getHeight()`, `getPaddingLeft()`, `getPaddingTop()`, `getPaddingRight()`, `getPaddingBottom()`, `getPaddingStart()`, `getPaddingEnd()`, `isFocused()`, `hasFocus()`, `getFocusedChild()`, `ignoreView()`, `stopIgnoringView()`, `detachAndScrapAttachedViews()`, `removeAndRecycleScrapInt()`, `measureChild()`, `shouldReMeasureChild()`, `shouldMeasureChild()`, `isMeasurementCacheEnabled()`, `setMeasurementCacheEnabled()`, `isMeasurementUpToDate()`, `measureChildWithMargins()`, `getChildMeasureSpec()`, `getDecoratedMeasuredWidth()`, `getDecoratedMeasuredHeight()`, `layoutDecorated()`, `layoutDecoratedWithMargins()`, `getTransformedBoundingBox()`, `getDecoratedLeft()`, `getDecoratedTop()`, `getDecoratedRight()`, `getDecoratedBottom()`, `calculateItemDecorationsForChild()`, `getTopDecorationHeight()`, `getBottomDecorationHeight()`, `getLeftDecorationWidth()`, `getRightDecorationWidth()`, `onFocusSearchFailed()`, `onInterceptFocusSearch()`, `getChildRectangleOnScreenScrollAmount()`, `isViewPartiallyVisible()`, `isFocusedChildVisibleAfterScrolling()`, `onRequestChildFocus()`, `onAddFocusables()`, `onItemsChanged()`, `onItemsAdded()`, `onItemsRemoved()`, `onItemsUpdated()`, `onItemsMoved()`, `getMinimumWidth()`, `getMinimumHeight()`, `stopSmoothScroller()`, `onSmoothScrollerStopped()`, `removeAndRecycleAllViews()`, `onInitializeAccessibilityNodeInfo()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfoForItem()`, `requestSimpleAnimationsInNextLayout()`, `getSelectionModeForAccessibility()`, `getRowCountForAccessibility()`, `getColumnCountForAccessibility()`, `isLayoutHierarchical()`, `performAccessibilityAction()`, `performAccessibilityActionForItem()`, `getProperties()`, `setExactMeasureSpecsFrom()`, `shouldMeasureTwice()`, `hasFlexibleChildInBothOrientations()`, `onDrawOver()`, `getItemOffsets()`, `ViewHolder()`, `flagRemovedAndOffsetPosition()`, `addFlags()`, `offsetPosition()`, `clearOldPosition()`, `saveOldPosition()`, `shouldIgnore()`, `getLayoutPosition()`, `getAdapterPosition()`, `getOldPosition()`, `isScrap()`, `unScrap()`, `wasReturnedFromScrap()`, `clearReturnedFromScrapFlag()`, `clearTmpDetachFlag()`, `stopIgnoring()`, `setScrapContainer()`, `isInvalid()`, `needsUpdate()`, `isBound()`, `isRemoved()`, `hasAnyOfTheFlags()`, `isTmpDetached()`, `isAdapterPositionUnknown()`, `setFlags()`, `addChangePayload()`, `createPayloadsIfNeeded()`, `clearPayload()`, `getUnmodifiedPayloads()`, `resetInternal()`, `toString()`, `setIsRecyclable()`, `isRecyclable()`, `shouldBeKeptAsChild()`, `doesTransientStatePreventRecycling()`, `isUpdated()`, `setChildImportantForAccessibilityInternal()`, `getAdapterPositionFor()`, `FastScroller()`, `getScrollingChildHelper()`, `isNestedScrollingEnabled()`, `hasNestedScrollingParent()`, `dispatchNestedScroll()`, `dispatchNestedPreScroll()`, `dispatchNestedPreFling()`, `viewNeedsUpdate()`, `isViewInvalid()`, `isItemRemoved()`, `isItemChanged()`, `getViewPosition()`, `getViewLayoutPosition()`, `getViewAdapterPosition()`, `computeScrollVectorForPosition()`, `onSeekTargetStep()`, `onStart()`, `onStop()`, `onTargetFound()`, `start()`, `setTargetPosition()`, `isPendingInitialRun()`, `isRunning()`, `getTargetPosition()`, `onAnimation()`, `instantScrollToPosition()`, `normalize()`, `Action()`, `jumpTo()`, `hasJumpTarget()`, `runIfNecessary()`, `validate()`, `getDx()`, `setDx()`, `getDy()`, `setDy()`, `getDuration()`, `setDuration()`, `getInterpolator()`, `setInterpolator()`, `update()`, `AdapterDataObservable()`, `notifyChanged()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `copyFrom()`, `assertLayoutStep()`, `reset()`, `prepareForNestedPrefetch()`, `isMeasuring()`, `isPreLayout()`, `willRunPredictiveAnimations()`, `willRunSimpleAnimations()`, `remove()`, `get()`, `put()`, `getTargetScrollPosition()`, `hasTargetScrollPosition()`, `didStructureChange()`, `getRemainingScrollHorizontal()`, `getRemainingScrollVertical()`, `ItemAnimatorRestoreListener()`, `onAnimationFinished()`, `onAnimationsFinished()`, `animatePersistence()`, `endAnimations()`, `runPendingAnimations()`, `getMoveDuration()`, `setMoveDuration()`, `getAddDuration()`, `setAddDuration()`, `getRemoveDuration()`, `setRemoveDuration()`, `getChangeDuration()`, `setChangeDuration()`, `setListener()`, `recordPreLayoutInformation()`, `obtainHolderInfo()`, `recordPostLayoutInformation()`, `buildAdapterChangeFlagsForAnimations()`, `dispatchAnimationFinished()`, `dispatchAnimationStarted()`, `onAnimationStarted()`, `dispatchAnimationsFinished()`, `ItemHolderInfo()`, `setFrom()`, `getChildDrawingOrder()`
- **`RecyclerViewAccessibilityDelegate`** — 8 function(s): `RecyclerViewAccessibilityDelegate()`, `shouldIgnore()`, `performAccessibilityAction()`, `if()`, `onInitializeAccessibilityNodeInfo()`, `onInitializeAccessibilityEvent()`, `getItemDelegate()`, `ItemDelegate()`
- **`ResourcesWrapper`** — 40 function(s): `ResourcesWrapper()`, `super()`, `getText()`, `getQuantityText()`, `getString()`, `getQuantityString()`, `getTextArray()`, `getStringArray()`, `getIntArray()`, `obtainTypedArray()`, `getDimension()`, `getDimensionPixelOffset()`, `getDimensionPixelSize()`, `getFraction()`, `getDrawable()`, `getDrawableForDensity()`, `getMovie()`, `getColor()`, `getColorStateList()`, `getBoolean()`, `getInteger()`, `getLayout()`, `getAnimation()`, `getXml()`, `openRawResource()`, `openRawResourceFd()`, `getValue()`, `getValueForDensity()`, `obtainAttributes()`, `updateConfiguration()`, `if()`, `getDisplayMetrics()`, `getConfiguration()`, `getIdentifier()`, `getResourceName()`, `getResourcePackageName()`, `getResourceTypeName()`, `getResourceEntryName()`, `parseBundleExtras()`, `parseBundleExtra()`
- **`RoundRectDrawable`** — 24 function(s): `RoundRectDrawable()`, `setBackground()`, `setPadding()`, `if()`, `updateBounds()`, `invalidateSelf()`, `getPadding()`, `draw()`, `onBoundsChange()`, `getOutline()`, `setRadius()`, `setAlpha()`, `setColorFilter()`, `getOpacity()`, `getRadius()`, `setColor()`, `getColor()`, `setTintList()`, `setTintMode()`, `onStateChange()`, `isStateful()`, `return()`, `createTintFilter()`, `PorterDuffColorFilter()`
- **`RoundRectDrawableWithShadow`** — 33 function(s): `drawRoundRect()`, `RoundRectDrawableWithShadow()`, `setBackground()`, `setShadowSize()`, `toEven()`, `if()`, `setAddPaddingForCorners()`, `invalidateSelf()`, `setAlpha()`, `onBoundsChange()`, `IllegalArgumentException()`, `getPadding()`, `calculateVerticalPadding()`, `return()`, `calculateHorizontalPadding()`, `onStateChange()`, `isStateful()`, `setColorFilter()`, `getOpacity()`, `setCornerRadius()`, `draw()`, `buildComponents()`, `drawShadow()`, `buildShadowCorners()`, `getCornerRadius()`, `getMaxShadowAndCornerPadding()`, `setMaxShadowSize()`, `getShadowSize()`, `getMaxShadowSize()`, `getMinWidth()`, `getMinHeight()`, `setColor()`, `getColor()`
- **`RtlSpacingHelper`** — 8 function(s): `getLeft()`, `getRight()`, `getStart()`, `getEnd()`, `setRelative()`, `if()`, `setAbsolute()`, `setDirection()`
- **`ScrollbarHelper`** — 6 function(s): `computeScrollOffset()`, `if()`, `computeScrollExtent()`, `computeScrollRange()`, `return()`, `ScrollbarHelper()`
- **`ScrollingTabContainerView`** — 58 function(s): `ScrollingTabContainerView()`, `super()`, `setHorizontalScrollBarEnabled()`, `setContentHeight()`, `addView()`, `onMeasure()`, `setFillViewport()`, `if()`, `performCollapse()`, `performExpand()`, `setTabSelected()`, `isCollapsed()`, `setAllowCollapse()`, `removeView()`, `removeCallbacks()`, `while()`, `animateToTab()`, `requestLayout()`, `createTabLayout()`, `createSpinner()`, `onConfigurationChanged()`, `animateToVisibility()`, `setAlpha()`, `run()`, `post()`, `onAttachedToWindow()`, `onDetachedFromWindow()`, `createTabView()`, `addTab()`, `updateTab()`, `removeTabAt()`, `removeAllTabs()`, `onItemSelected()`, `onNothingSelected()`, `TabView()`, `setBackgroundDrawable()`, `setGravity()`, `update()`, `bindTab()`, `setSelected()`, `sendAccessibilityEvent()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `getTab()`, `TabAdapter()`, `getCount()`, `getItem()`, `return()`, `getItemId()`, `getView()`, `TabClickListener()`, `onClick()`, `for()`, `VisibilityAnimListener()`, `withFinalVisibility()`, `onAnimationStart()`, `onAnimationEnd()`, `onAnimationCancel()`
- **`SearchView`** — 131 function(s): `onClose()`, `onQueryTextChange()`, `onQueryTextSubmit()`, `onSuggestionClick()`, `onSuggestionSelect()`, `SearchView()`, `this()`, `super()`, `run()`, `if()`, `onClick()`, `onKey()`, `onEditorAction()`, `onItemClick()`, `onItemSelected()`, `onNothingSelected()`, `beforeTextChanged()`, `onTextChanged()`, `afterTextChanged()`, `onFocusChange()`, `setIconifiedByDefault()`, `setMaxWidth()`, `setImeOptions()`, `setInputType()`, `setFocusable()`, `onLayoutChange()`, `updateViewsVisibility()`, `updateQueryHint()`, `getSuggestionRowLayout()`, `getSuggestionCommitIconResId()`, `setSearchableInfo()`, `updateSearchAutoComplete()`, `setAppSearchData()`, `getImeOptions()`, `getInputType()`, `requestFocus()`, `clearFocus()`, `setOnQueryTextListener()`, `setOnCloseListener()`, `setOnQueryTextFocusChangeListener()`, `setOnSuggestionListener()`, `setOnSearchClickListener()`, `getQuery()`, `setQuery()`, `onSubmitQuery()`, `setQueryHint()`, `getQueryHint()`, `isIconfiedByDefault()`, `setIconified()`, `onCloseClicked()`, `onSearchClicked()`, `isIconified()`, `setSubmitButtonEnabled()`, `isSubmitButtonEnabled()`, `setQueryRefinementEnabled()`, `isQueryRefinementEnabled()`, `setSuggestionsAdapter()`, `getSuggestionsAdapter()`, `requestLayout()`, `getMaxWidth()`, `onMeasure()`, `onLayout()`, `getChildBoundsWithinSearchView()`, `setTouchDelegate()`, `getLocationInWindow()`, `getPreferredWidth()`, `getContext()`, `getPreferredHeight()`, `updateSubmitButton()`, `updateCloseButton()`, `updateVoiceButton()`, `updateSubmitArea()`, `hasVoiceSearch()`, `isSubmitAreaEnabled()`, `return()`, `postUpdateFocusedState()`, `post()`, `updateFocusedState()`, `invalidate()`, `onDetachedFromWindow()`, `removeCallbacks()`, `onQueryRefine()`, `onSuggestionsKey()`, `onItemClicked()`, `getDecoratedHint()`, `launchQuerySearch()`, `dismissSuggestions()`, `onVoiceClicked()`, `onTextFocusChanged()`, `forceSuggestionQuery()`, `onWindowFocusChanged()`, `onActionViewCollapsed()`, `onActionViewExpanded()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `toString()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `adjustDropDownSizeAndPosition()`, `launchSuggestion()`, `rewriteQueryFromSuggestion()`, `launchIntent()`, `createIntent()`, `createVoiceWebSearchIntent()`, `createVoiceAppSearchIntent()`, `createIntentFromSuggestion()`, `isLandscapeMode()`, `UpdatableTouchDelegate()`, `setBounds()`, `onTouchEvent()`, `SearchAutoComplete()`, `onFinishInflate()`, `setMinWidth()`, `setSearchView()`, `setThreshold()`, `isEmpty()`, `replaceText()`, `performCompletion()`, `onFocusChanged()`, `enoughToFilter()`, `onKeyPreIme()`, `setImeVisibility()`, `getSearchViewTextMinWidthDp()`, `onCreateInputConnection()`, `showSoftInputIfNecessary()`, `AutoCompleteTextViewReflector()`, `doBeforeTextChanged()`, `doAfterTextChanged()`, `ensureImeVisible()`
- **`ShareActionProvider`** — 17 function(s): `onShareTargetSelected()`, `ShareActionProvider()`, `super()`, `setOnShareTargetSelectedListener()`, `setActivityChooserPolicyIfNeeded()`, `onCreateActionView()`, `if()`, `hasSubMenu()`, `onPrepareSubMenu()`, `for()`, `setShareHistoryFileName()`, `setShareIntent()`, `updateIntent()`, `ShareMenuItemOnMenuItemClickListener()`, `onMenuItemClick()`, `ShareActivityChooserModelPolicy()`, `onChooseActivity()`
- **`SimpleItemAnimator`** — 28 function(s): `animateAdd()`, `animateChange()`, `animateMove()`, `animateRemove()`, `getSupportsChangeAnimations()`, `setSupportsChangeAnimations()`, `canReuseUpdatedViewHolder()`, `animateDisappearance()`, `if()`, `animateAppearance()`, `animatePersistence()`, `dispatchMoveFinished()`, `dispatchRemoveFinished()`, `onRemoveFinished()`, `dispatchAnimationFinished()`, `onMoveFinished()`, `dispatchAddFinished()`, `onAddFinished()`, `dispatchChangeFinished()`, `onChangeFinished()`, `dispatchRemoveStarting()`, `onRemoveStarting()`, `dispatchMoveStarting()`, `onMoveStarting()`, `dispatchAddStarting()`, `onAddStarting()`, `dispatchChangeStarting()`, `onChangeStarting()`
- **`SnapHelper`** — 20 function(s): `onScrollStateChanged()`, `if()`, `onScrolled()`, `calculateDistanceToFinalSnap()`, `findSnapView()`, `findTargetSnapPosition()`, `onFling()`, `return()`, `attachToRecyclerView()`, `destroyCallbacks()`, `setupCallbacks()`, `snapToTargetExistingView()`, `IllegalStateException()`, `calculateScrollDistance()`, `snapFromFling()`, `createScroller()`, `createSnapScroller()`, `LinearSmoothScroller()`, `onTargetFound()`, `calculateSpeedPerPixel()`
- **`StaggeredGridLayoutManager`** — 184 function(s): `run()`, `StaggeredGridLayoutManager()`, `setOrientation()`, `setSpanCount()`, `setReverseLayout()`, `createOrientationHelpers()`, `isAutoMeasureEnabled()`, `checkForGaps()`, `if()`, `requestSimpleAnimationsInNextLayout()`, `requestLayout()`, `onScrollStateChanged()`, `onDetachedFromWindow()`, `removeCallbacks()`, `for()`, `hasGapsToFix()`, `checkSpanForGap()`, `assertNotInLayoutOrScroll()`, `invalidateSpanAssignments()`, `IllegalArgumentException()`, `getGapStrategy()`, `setGapStrategy()`, `getSpanCount()`, `resolveShouldLayoutReverse()`, `isLayoutRTL()`, `getLayoutDirection()`, `getReverseLayout()`, `setMeasuredDimension()`, `onLayoutChildren()`, `removeAndRecycleAllViews()`, `applyPendingSavedState()`, `updateAnchorInfoForLayout()`, `detachAndScrapAttachedViews()`, `updateMeasureSpecs()`, `updateLayoutState()`, `setLayoutStateDirection()`, `fill()`, `repositionToWrapContentIfNecessary()`, `fixEndGap()`, `fixStartGap()`, `onLayoutCompleted()`, `updateAnchorFromChildren()`, `updateAnchorFromPendingData()`, `supportsPredictiveItemAnimations()`, `findFirstVisibleItemPositions()`, `findFirstCompletelyVisibleItemPositions()`, `findLastVisibleItemPositions()`, `findLastCompletelyVisibleItemPositions()`, `computeHorizontalScrollOffset()`, `computeScrollOffset()`, `computeVerticalScrollOffset()`, `computeHorizontalScrollExtent()`, `computeScrollExtent()`, `computeVerticalScrollExtent()`, `computeHorizontalScrollRange()`, `computeScrollRange()`, `computeVerticalScrollRange()`, `measureChildWithDecorationsAndMargin()`, `calculateItemDecorationsForChild()`, `updateSpecWithExtra()`, `onRestoreInstanceState()`, `onSaveInstanceState()`, `SavedState()`, `onInitializeAccessibilityNodeInfoForItem()`, `onInitializeAccessibilityEvent()`, `findFirstVisibleItemPositionInt()`, `getPosition()`, `getRowCountForAccessibility()`, `getColumnCountForAccessibility()`, `findFirstVisibleItemClosestToStart()`, `findFirstVisibleItemClosestToEnd()`, `offsetChildrenHorizontal()`, `offsetChildrenVertical()`, `onItemsRemoved()`, `handleUpdate()`, `onItemsAdded()`, `onItemsChanged()`, `onItemsMoved()`, `onItemsUpdated()`, `updateAllRemainingSpans()`, `while()`, `addView()`, `attachViewToSpans()`, `layoutDecoratedWithMargins()`, `updateRemainingSpans()`, `recycle()`, `createFullSpanItemFromEnd()`, `createFullSpanItemFromStart()`, `appendViewToAllSpans()`, `prependViewToAllSpans()`, `recycleFromEnd()`, `recycleFromStart()`, `getMaxStart()`, `getMinStart()`, `areAllEndsEqual()`, `areAllStartsEqual()`, `getMaxEnd()`, `getMinEnd()`, `removeAndRecycleView()`, `preferLastSpan()`, `return()`, `getNextSpan()`, `canScrollVertically()`, `canScrollHorizontally()`, `scrollHorizontallyBy()`, `scrollBy()`, `scrollVerticallyBy()`, `calculateScrollDirectionForPosition()`, `computeScrollVectorForPosition()`, `smoothScrollToPosition()`, `startSmoothScroll()`, `scrollToPosition()`, `scrollToPositionWithOffset()`, `collectAdjacentPrefetchPositions()`, `prepareLayoutStateForDelta()`, `getLastChildPosition()`, `getFirstChildPosition()`, `findFirstReferenceChildPosition()`, `findLastReferenceChildPosition()`, `generateDefaultLayoutParams()`, `LayoutParams()`, `generateLayoutParams()`, `checkLayoutParams()`, `getOrientation()`, `onFocusSearchFailed()`, `convertFocusDirectionToLayoutDirection()`, `super()`, `setFullSpan()`, `isFullSpan()`, `getSpanIndex()`, `Span()`, `getStartLine()`, `calculateCachedStart()`, `getEndLine()`, `calculateCachedEnd()`, `prependToSpan()`, `appendToSpan()`, `cacheReferenceLineAndClear()`, `clear()`, `invalidateCache()`, `setLine()`, `popEnd()`, `popStart()`, `getDeletedSize()`, `getLayoutParams()`, `onOffset()`, `findFirstVisibleItemPosition()`, `findOneVisibleChild()`, `findFirstPartiallyVisibleItemPosition()`, `findOnePartiallyVisibleChild()`, `findFirstCompletelyVisibleItemPosition()`, `findLastVisibleItemPosition()`, `findLastPartiallyVisibleItemPosition()`, `findLastCompletelyVisibleItemPosition()`, `findOnePartiallyOrCompletelyVisibleChild()`, `getFocusableViewAfter()`, `LazySpanLookup()`, `forceInvalidateAfter()`, `invalidateAfter()`, `getSpan()`, `setSpan()`, `ensureSize()`, `sizeForPosition()`, `offsetForRemoval()`, `offsetFullSpansForRemoval()`, `offsetForAddition()`, `offsetFullSpansForAddition()`, `invalidateFullSpansAfter()`, `addFullSpanItem()`, `getFullSpanItem()`, `getFirstFullSpanItemInRange()`, `createFromParcel()`, `FullSpanItem()`, `newArray()`, `getGapForSpan()`, `describeContents()`, `writeToParcel()`, `toString()`, `invalidateSpanInfo()`, `invalidateAnchorPositionInfo()`, `AnchorInfo()`, `reset()`, `saveSpanReferenceLines()`, `assignCoordinateFromPadding()`
- **`SuggestionsAdapter`** — 36 function(s): `SuggestionsAdapter()`, `super()`, `setQueryRefinement()`, `getQueryRefinement()`, `hasStableIds()`, `runQueryOnBackgroundThread()`, `if()`, `close()`, `changeCursor()`, `notifyDataSetChanged()`, `updateSpinnerState()`, `notifyDataSetInvalidated()`, `newView()`, `ChildViewCache()`, `bindView()`, `setViewText()`, `setViewDrawable()`, `onClick()`, `formatUrl()`, `getIcon1()`, `getDefaultIcon1()`, `getIcon2()`, `getDrawableFromResourceValue()`, `convertToString()`, `getView()`, `getDropDownView()`, `storeInIconCache()`, `getDrawable()`, `getDrawableFromResourceUri()`, `FileNotFoundException()`, `checkIconCache()`, `getActivityIconWithCache()`, `getActivityIcon()`, `getColumnString()`, `getStringOrNull()`, `getSearchManagerSuggestions()`
- **`SwitchCompat`** — 77 function(s): `get()`, `set()`, `SwitchCompat()`, `this()`, `super()`, `if()`, `applyThumbTint()`, `applyTrackTint()`, `setSwitchTextAppearance()`, `refreshDrawableState()`, `setChecked()`, `requestLayout()`, `setSwitchTypefaceByIndex()`, `setSwitchTypeface()`, `invalidate()`, `setSwitchPadding()`, `getSwitchPadding()`, `setSwitchMinWidth()`, `getSwitchMinWidth()`, `setThumbTextPadding()`, `getThumbTextPadding()`, `setTrackDrawable()`, `setTrackResource()`, `getTrackDrawable()`, `setTrackTintList()`, `getTrackTintList()`, `setTrackTintMode()`, `getTrackTintMode()`, `setThumbDrawable()`, `setThumbResource()`, `getThumbDrawable()`, `setThumbTintList()`, `getThumbTintList()`, `setThumbTintMode()`, `getThumbTintMode()`, `setSplitTrack()`, `getSplitTrack()`, `getTextOn()`, `setTextOn()`, `getTextOff()`, `setTextOff()`, `setShowText()`, `getShowText()`, `onMeasure()`, `setMeasuredDimension()`, `onPopulateAccessibilityEvent()`, `makeLayout()`, `StaticLayout()`, `hitThumb()`, `onTouchEvent()`, `getParent()`, `setThumbPosition()`, `stopDrag()`, `cancelSuperTouch()`, `playSoundEffect()`, `animateThumbToCheckedState()`, `cancelPositionAnimator()`, `getTargetCheckedState()`, `toggle()`, `onLayout()`, `draw()`, `onDraw()`, `getCompoundPaddingLeft()`, `getCompoundPaddingRight()`, `getThumbOffset()`, `return()`, `getThumbScrollRange()`, `onCreateDrawableState()`, `mergeDrawableStates()`, `drawableStateChanged()`, `drawableHotspotChanged()`, `verifyDrawable()`, `jumpDrawablesToCurrentState()`, `onInitializeAccessibilityEvent()`, `onInitializeAccessibilityNodeInfo()`, `setCustomSelectionActionModeCallback()`, `constrain()`
- **`ThemeUtils`** — 8 function(s): `createDisabledStateList()`, `ColorStateList()`, `getThemeAttrColor()`, `getThemeAttrColorStateList()`, `getDisabledThemeAttrColor()`, `if()`, `getTypedValue()`, `ThemeUtils()`
- **`ThemedSpinnerAdapter`** — 5 function(s): `getDropDownViewTheme()`, `setDropDownViewTheme()`, `Helper()`, `if()`, `getDropDownViewInflater()`
- **`TintContextWrapper`** — 11 function(s): `wrap()`, `if()`, `synchronized()`, `for()`, `shouldWrap()`, `TintContextWrapper()`, `super()`, `getTheme()`, `setTheme()`, `getResources()`, `getAssets()`
- **`TintInfo`** — 1 function(s): `clear()`
- **`TintResources`** — 4 function(s): `TintResources()`, `super()`, `getDrawable()`, `if()`
- **`TintTypedArray`** — 33 function(s): `obtainStyledAttributes()`, `TintTypedArray()`, `getDrawable()`, `if()`, `getDrawableIfKnown()`, `getFont()`, `length()`, `getIndexCount()`, `getIndex()`, `getResources()`, `getText()`, `getString()`, `getNonResourceString()`, `getBoolean()`, `getInt()`, `getFloat()`, `getColor()`, `getColorStateList()`, `getInteger()`, `getDimension()`, `getDimensionPixelOffset()`, `getDimensionPixelSize()`, `getLayoutDimension()`, `getFraction()`, `getResourceId()`, `getTextArray()`, `getValue()`, `getType()`, `hasValue()`, `peekValue()`, `getPositionDescription()`, `recycle()`, `getChangingConfigurations()`
- **`Toolbar`** — 136 function(s): `onMenuItemClick()`, `Toolbar()`, `this()`, `super()`, `if()`, `run()`, `ensureContentInsets()`, `setTitle()`, `setSubtitle()`, `setPopupTheme()`, `setNavigationIcon()`, `setNavigationContentDescription()`, `setLogo()`, `setLogoDescription()`, `setTitleTextColor()`, `setSubtitleTextColor()`, `getPopupTheme()`, `setTitleMargin()`, `requestLayout()`, `getTitleMarginStart()`, `setTitleMarginStart()`, `getTitleMarginTop()`, `setTitleMarginTop()`, `getTitleMarginEnd()`, `setTitleMarginEnd()`, `getTitleMarginBottom()`, `setTitleMarginBottom()`, `onRtlPropertiesChanged()`, `canShowOverflowMenu()`, `getVisibility()`, `isOverflowMenuShowing()`, `isOverflowMenuShowPending()`, `showOverflowMenu()`, `hideOverflowMenu()`, `setMenu()`, `ensureMenuView()`, `dismissPopupMenus()`, `isTitleTruncated()`, `for()`, `ensureLogoView()`, `addSystemView()`, `removeView()`, `getLogo()`, `getLogoDescription()`, `hasExpandedActionView()`, `return()`, `collapseActionView()`, `getTitle()`, `getSubtitle()`, `setTitleTextAppearance()`, `setSubtitleTextAppearance()`, `getNavigationContentDescription()`, `ensureNavButtonView()`, `getNavigationIcon()`, `setNavigationOnClickListener()`, `getMenu()`, `ensureMenu()`, `setOverflowIcon()`, `getOverflowIcon()`, `getMenuInflater()`, `SupportMenuInflater()`, `inflateMenu()`, `setOnMenuItemClickListener()`, `setContentInsetsRelative()`, `getContentInsetStart()`, `getContentInsetEnd()`, `setContentInsetsAbsolute()`, `getContentInsetLeft()`, `getContentInsetRight()`, `getContentInsetStartWithNavigation()`, `setContentInsetStartWithNavigation()`, `getContentInsetEndWithActions()`, `setContentInsetEndWithActions()`, `getCurrentContentInsetStart()`, `getCurrentContentInsetEnd()`, `getCurrentContentInsetLeft()`, `getCurrentContentInsetRight()`, `ensureCollapseButtonView()`, `onClick()`, `addView()`, `onSaveInstanceState()`, `onRestoreInstanceState()`, `postShowOverflowMenu()`, `removeCallbacks()`, `post()`, `onDetachedFromWindow()`, `onTouchEvent()`, `onHoverEvent()`, `measureChildConstrained()`, `measureChildCollapseMargins()`, `shouldCollapse()`, `onMeasure()`, `while()`, `setMeasuredDimension()`, `onLayout()`, `addCustomViewsWithGravity()`, `getViewListMeasuredWidth()`, `layoutChildLeft()`, `layoutChildRight()`, `getChildTop()`, `getPaddingTop()`, `getChildVerticalGravity()`, `getChildHorizontalGravity()`, `shouldLayout()`, `getHorizontalMargins()`, `getVerticalMargins()`, `generateLayoutParams()`, `LayoutParams()`, `generateDefaultLayoutParams()`, `checkLayoutParams()`, `isCustomView()`, `getWrapper()`, `removeChildrenForExpandedActionView()`, `removeViewAt()`, `addChildrenForExpandedActionView()`, `isChildOrHidden()`, `setCollapsible()`, `setMenuCallbacks()`, `getOuterActionMenuPresenter()`, `getPopupContext()`, `copyMarginsFromCompat()`, `createFromParcel()`, `SavedState()`, `newArray()`, `writeToParcel()`, `ExpandedActionViewMenuPresenter()`, `initForMenu()`, `getMenuView()`, `updateMenuView()`, `collapseItemActionView()`, `setCallback()`, `onSubMenuSelected()`, `onCloseMenu()`, `flagActionItems()`, `expandItemActionView()`, `getId()`
- **`ToolbarWidgetWrapper`** — 68 function(s): `ToolbarWidgetWrapper()`, `this()`, `if()`, `setTitle()`, `setSubtitle()`, `setLogo()`, `setIcon()`, `setNavigationIcon()`, `setDisplayOptions()`, `setCustomView()`, `setDefaultNavigationContentDescription()`, `onClick()`, `setNavigationContentDescription()`, `detectDisplayOptions()`, `getViewGroup()`, `getContext()`, `hasExpandedActionView()`, `collapseActionView()`, `setWindowCallback()`, `setWindowTitle()`, `setTitleInt()`, `getTitle()`, `getSubtitle()`, `initProgress()`, `initIndeterminateProgress()`, `hasIcon()`, `hasLogo()`, `updateToolbarLogo()`, `canShowOverflowMenu()`, `isOverflowMenuShowing()`, `isOverflowMenuShowPending()`, `showOverflowMenu()`, `hideOverflowMenu()`, `setMenuPrepared()`, `setMenu()`, `dismissPopupMenus()`, `getDisplayOptions()`, `updateHomeAccessibility()`, `updateNavigationIcon()`, `setEmbeddedTabView()`, `hasEmbeddedTabs()`, `isTitleTruncated()`, `setCollapsible()`, `setHomeButtonEnabled()`, `getNavigationMode()`, `setNavigationMode()`, `IllegalArgumentException()`, `ensureSpinner()`, `setDropdownParams()`, `setDropdownSelectedPosition()`, `IllegalStateException()`, `getDropdownSelectedPosition()`, `getDropdownItemCount()`, `getCustomView()`, `animateToVisibility()`, `setupAnimatorToVisibility()`, `onAnimationStart()`, `onAnimationEnd()`, `onAnimationCancel()`, `setDefaultNavigationIcon()`, `saveHierarchyState()`, `restoreHierarchyState()`, `setBackgroundDrawable()`, `getHeight()`, `setVisibility()`, `getVisibility()`, `setMenuCallbacks()`, `getMenu()`
- **`TooltipCompat`** — 3 function(s): `setTooltipText()`, `if()`, `TooltipCompat()`
- **`TooltipCompatHandler`** — 15 function(s): `run()`, `setTooltipText()`, `if()`, `setPendingHandler()`, `TooltipCompatHandler()`, `clearAnchorPos()`, `onLongClick()`, `show()`, `onHover()`, `hide()`, `onViewAttachedToWindow()`, `onViewDetachedFromWindow()`, `scheduleShow()`, `cancelPendingShow()`, `updateAnchorPos()`
- **`TooltipPopup`** — 9 function(s): `TooltipPopup()`, `show()`, `if()`, `hide()`, `computePosition()`, `isShowing()`, `getAppRootView()`, `for()`, `return()`
- **`VectorEnabledTintResources`** — 8 function(s): `shouldBeUsed()`, `isCompatVectorFromResourcesEnabled()`, `VectorEnabledTintResources()`, `super()`, `getDrawable()`, `if()`, `superGetDrawable()`, `setCompatVectorFromResourcesEnabled()`
- **`ViewBoundsCheck`** — 20 function(s): `getChildAt()`, `getChildCount()`, `getChildEnd()`, `getChildStart()`, `getParent()`, `getParentEnd()`, `getParentStart()`, `ViewBoundsCheck()`, `BoundFlags()`, `setBounds()`, `setFlags()`, `addFlags()`, `resetFlags()`, `compare()`, `if()`, `boundsMatch()`, `return()`, `findOneViewWithinBoundFlags()`, `for()`, `isViewWithinBoundFlags()`
- **`ViewInfoStore`** — 30 function(s): `processAppeared()`, `processDisappeared()`, `processPersistent()`, `unused()`, `clear()`, `addToPreLayout()`, `if()`, `isDisappearing()`, `return()`, `popFromPreLayout()`, `popFromLayoutStep()`, `popFromPostLayout()`, `IllegalArgumentException()`, `addToOldChangeHolders()`, `addToAppearedInPreLayoutHolders()`, `isInPreLayout()`, `getFromOldChangeHolders()`, `addToPostLayout()`, `addToDisappearedInLayout()`, `removeFromDisappearedInLayout()`, `process()`, `for()`, `removeViewHolder()`, `while()`, `onDetach()`, `onViewDetached()`, `InfoRecord()`, `obtain()`, `recycle()`, `drainCache()`
- **`ViewStubCompat`** — 22 function(s): `onInflate()`, `ViewStubCompat()`, `this()`, `super()`, `setId()`, `setVisibility()`, `setWillNotDraw()`, `getInflatedId()`, `setInflatedId()`, `getLayoutResource()`, `setLayoutResource()`, `setLayoutInflater()`, `getLayoutInflater()`, `onMeasure()`, `setMeasuredDimension()`, `draw()`, `dispatchDraw()`, `if()`, `IllegalStateException()`, `inflate()`, `IllegalArgumentException()`, `setOnInflateListener()`
- **`ViewUtils`** — 5 function(s): `if()`, `ViewUtils()`, `isLayoutRtl()`, `computeFitSystemWindows()`, `makeOptionalFitsSystemWindows()`
- **`WithHint`** — 1 function(s): `getHint()`

</details>

### Package `android.support.v7.widget.helper`  (3 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ItemTouchHelper` | class | RecyclerView.ItemDecoration implements RecyclerView.OnChildAttachStateChangeListener | 1,347 | 289 |
| `ItemTouchUIUtil` | class | — | 17 | 4 |
| `ItemTouchUIUtilImpl` | class | ItemTouchUIUtil | 69 | 12 |

<details>
<summary><b>Function list for <code>android.support.v7.widget.helper</code></b> (click to expand)</summary>

- **`ItemTouchHelper`** — 94 function(s): `run()`, `if()`, `onInterceptTouchEvent()`, `onTouchEvent()`, `onRequestDisallowInterceptTouchEvent()`, `prepareForDrop()`, `ItemTouchHelper()`, `hitTest()`, `attachToRecyclerView()`, `destroyCallbacks()`, `setupCallbacks()`, `startGestureDetection()`, `for()`, `releaseVelocityTracker()`, `stopGestureDetection()`, `getSelectedDxDy()`, `onDrawOver()`, `onDraw()`, `select()`, `endRecoverAnimation()`, `addChildDrawingOrderCallback()`, `IllegalArgumentException()`, `removeChildDrawingOrderCallbackIfNecessary()`, `onAnimationEnd()`, `postDispatchSwipe()`, `hasRunningRecoverAnim()`, `scrollIfNecessary()`, `findSwapTargets()`, `while()`, `moveIfNecessary()`, `onChildViewAttachedToWindow()`, `onChildViewDetachedFromWindow()`, `getItemOffsets()`, `obtainVelocityTracker()`, `findSwipedView()`, `checkSelectForSwipe()`, `findChildView()`, `startDrag()`, `startSwipe()`, `findAnimation()`, `updateDxDy()`, `swipeIfNecessary()`, `return()`, `checkHorizontalSwipe()`, `checkVerticalSwipe()`, `onGetChildDrawingOrder()`, `getInterpolation()`, `getMovementFlags()`, `onMove()`, `onSwiped()`, `getDefaultUIUtil()`, `convertToRelativeDirection()`, `makeMovementFlags()`, `makeFlag()`, `convertToAbsoluteDirection()`, `getAbsoluteMovementFlags()`, `hasDragFlag()`, `hasSwipeFlag()`, `canDropOver()`, `isLongPressDragEnabled()`, `isItemViewSwipeEnabled()`, `getBoundingBoxMargin()`, `getSwipeThreshold()`, `getMoveThreshold()`, `getSwipeEscapeVelocity()`, `getSwipeVelocityThreshold()`, `chooseDropTarget()`, `onSelectedChanged()`, `getMaxDragScroll()`, `onMoved()`, `onChildDraw()`, `onChildDrawOver()`, `clearView()`, `getAnimationDuration()`, `interpolateOutOfBoundsScroll()`, `SimpleCallback()`, `setDefaultSwipeDirs()`, `setDefaultDragDirs()`, `getSwipeDirs()`, `getDragDirs()`, `ItemTouchHelperGestureListener()`, `doNotReactToLongPress()`, `onDown()`, `onLongPress()`, `RecoverAnimation()`, `onAnimationUpdate()`, `setFraction()`, `setDuration()`, `start()`, `cancel()`, `update()`, `onAnimationStart()`, `onAnimationCancel()`, `onAnimationRepeat()`
- **`ItemTouchUIUtil`** — 4 function(s): `clearView()`, `onDraw()`, `onDrawOver()`, `onSelected()`
- **`ItemTouchUIUtilImpl`** — 7 function(s): `onDraw()`, `if()`, `findMaxElevation()`, `for()`, `onDrawOver()`, `clearView()`, `onSelected()`

</details>

### Package `android.support.v7.widget.util`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `SortedListAdapterCallback` | class | SortedList.Callback<T2> | 39 | 6 |

<details>
<summary><b>Function list for <code>android.support.v7.widget.util</code></b> (click to expand)</summary>

- **`SortedListAdapterCallback`** — 5 function(s): `SortedListAdapterCallback()`, `onInserted()`, `onRemoved()`, `onMoved()`, `onChanged()`

</details>

### Package `androidx.core.graphics.drawable`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `IconCompatParcelizer` | class | — | 34 | 2 |

<details>
<summary><b>Function list for <code>androidx.core.graphics.drawable</code></b> (click to expand)</summary>

- **`IconCompatParcelizer`** — 2 function(s): `read()`, `write()`

</details>

### Package `androidx.core.internal`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `package-info` | class | — | 3 | 0 |

<details>
<summary><b>Function list for <code>androidx.core.internal</code></b> (click to expand)</summary>


</details>

### Package `androidx.versionedparcelable`  (11 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `CustomVersionedParcelable` | class | VersionedParcelable | 11 | 2 |
| `NonParcelField` | class | — | 13 | 0 |
| `ParcelField` | class | — | 14 | 1 |
| `ParcelImpl` | class | Parcelable | 46 | 9 |
| `ParcelUtils` | class | — | 33 | 10 |
| `R` | class | — | 8 | 1 |
| `VersionedParcel` | class | RuntimeException | 997 | 387 |
| `VersionedParcelParcel` | class | VersionedParcel | 224 | 41 |
| `VersionedParcelStream` | class | VersionedParcel | 510 | 107 |
| `VersionedParcelable` | class | — | 6 | 0 |
| `VersionedParcelize` | class | — | 22 | 5 |

<details>
<summary><b>Function list for <code>androidx.versionedparcelable</code></b> (click to expand)</summary>

- **`CustomVersionedParcelable`** — 2 function(s): `onPreParceling()`, `onPostParceling()`
- **`ParcelField`** — 1 function(s): `value()`
- **`ParcelImpl`** — 7 function(s): `createFromParcel()`, `ParcelImpl()`, `newArray()`, `getVersionedParcel()`, `return()`, `describeContents()`, `writeToParcel()`
- **`ParcelUtils`** — 9 function(s): `ParcelUtils()`, `toParcelable()`, `ParcelImpl()`, `fromParcelable()`, `if()`, `IllegalArgumentException()`, `return()`, `toOutputStream()`, `fromInputStream()`
- **`R`** — 1 function(s): `R()`
- **`VersionedParcel`** — 88 function(s): `closeField()`, `createSubParcel()`, `readBoolean()`, `readBundle()`, `readByteArray()`, `readDouble()`, `readField()`, `readFloat()`, `readInt()`, `readLong()`, `readParcelable()`, `readString()`, `readStrongBinder()`, `setOutputField()`, `writeBoolean()`, `writeBundle()`, `writeByteArray()`, `writeDouble()`, `writeFloat()`, `writeInt()`, `writeLong()`, `writeParcelable()`, `writeString()`, `writeStrongBinder()`, `writeStrongInterface()`, `isStream()`, `setSerializationFlags()`, `if()`, `return()`, `writeByte()`, `writeSize()`, `writeSizeF()`, `writeSparseBooleanArray()`, `for()`, `writeBooleanArray()`, `readBooleanArray()`, `writeCharArray()`, `readCharArray()`, `writeIntArray()`, `readIntArray()`, `writeLongArray()`, `readLongArray()`, `writeFloatArray()`, `readFloatArray()`, `writeDoubleArray()`, `readDoubleArray()`, `writeSet()`, `writeCollection()`, `writeList()`, `while()`, `writeVersionedParcelable()`, `writeSerializable()`, `writeArray()`, `getType()`, `IllegalArgumentException()`, `writeVersionedParcelableCreator()`, `writeToParcel()`, `RuntimeException()`, `writeException()`, `writeNoException()`, `throw()`, `readException()`, `readExceptionCode()`, `getRootCause()`, `createException()`, `switch()`, `UnsupportedOperationException()`, `NetworkOnMainThreadException()`, `IllegalStateException()`, `NullPointerException()`, `BadParcelableException()`, `SecurityException()`, `readByte()`, `readSize()`, `Size()`, `readSizeF()`, `SizeF()`, `readSparseBooleanArray()`, `readSet()`, `readList()`, `readCollection()`, `readArray()`, `readVersionedParcelable()`, `readSerializable()`, `readFromParcel()`, `findParcelClass()`, `ParcelException()`, `super()`
- **`VersionedParcelParcel`** — 30 function(s): `VersionedParcelParcel()`, `this()`, `readUntilField()`, `if()`, `readField()`, `setOutputField()`, `closeField()`, `writeInt()`, `createSubParcel()`, `writeByteArray()`, `writeLong()`, `writeFloat()`, `writeDouble()`, `writeString()`, `writeStrongBinder()`, `writeParcelable()`, `writeBoolean()`, `writeStrongInterface()`, `writeBundle()`, `readInt()`, `readLong()`, `readFloat()`, `readDouble()`, `readString()`, `readStrongBinder()`, `readByteArray()`, `readParcelable()`, `return()`, `readBundle()`, `readBoolean()`
- **`VersionedParcelStream`** — 46 function(s): `VersionedParcelStream()`, `isStream()`, `setSerializationFlags()`, `if()`, `RuntimeException()`, `closeField()`, `createSubParcel()`, `readField()`, `while()`, `setOutputField()`, `writeByteArray()`, `writeInt()`, `writeLong()`, `writeFloat()`, `writeDouble()`, `writeString()`, `writeBoolean()`, `writeStrongBinder()`, `writeParcelable()`, `writeStrongInterface()`, `readStrongBinder()`, `readParcelable()`, `readInt()`, `readLong()`, `readFloat()`, `readDouble()`, `readString()`, `String()`, `readByteArray()`, `readBoolean()`, `writeBundle()`, `for()`, `writeObject()`, `readBundle()`, `readObject()`, `writeArray()`, `writeBooleanArray()`, `writeDoubleArray()`, `writeIntArray()`, `writeLongArray()`, `writeFloatArray()`, `IllegalArgumentException()`, `switch()`, `FieldBuffer()`, `flushField()`, `InputBuffer()`
- **`VersionedParcelize`** — 5 function(s): `allowSerialization()`, `deprecatedIds()`, `ignoreParcelables()`, `isCustom()`, `jetifyAs()`

</details>

### Package `com.google.android.material.internal`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `package-info` | class | — | 3 | 0 |

<details>
<summary><b>Function list for <code>com.google.android.material.internal</code></b> (click to expand)</summary>


</details>

### Package `com.google.gson`  (25 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `DefaultDateTypeAdapter` | class | TypeAdapter<Date> | 109 | 24 |
| `ExclusionStrategy` | class | — | 9 | 2 |
| `FieldAttributes` | class | — | 55 | 10 |
| `FieldNamingPolicy` | class | FieldNamingStrategy | 77 | 17 |
| `FieldNamingStrategy` | class | — | 9 | 1 |
| `Gson` | class | TypeAdapter<T> | 572 | 123 |
| `GsonBuilder` | class | — | 204 | 34 |
| `InstanceCreator` | class | — | 9 | 1 |
| `JsonArray` | class | JsonElement implements Iterable<JsonElement> | 193 | 58 |
| `JsonDeserializationContext` | class | — | 9 | 1 |
| `JsonDeserializer` | class | — | 9 | 1 |
| `JsonElement` | class | — | 122 | 49 |
| `JsonIOException` | class | JsonParseException | 19 | 6 |
| `JsonNull` | class | JsonElement | 24 | 4 |
| `JsonObject` | class | JsonElement | 91 | 27 |
| `JsonParseException` | class | RuntimeException | 19 | 6 |
| `JsonParser` | class | — | 50 | 11 |
| `JsonPrimitive` | class | JsonElement | 210 | 67 |
| `JsonSerializationContext` | class | — | 11 | 2 |
| `JsonSerializer` | class | — | 9 | 1 |
| `JsonStreamParser` | class | Iterator<JsonElement> | 75 | 16 |
| `JsonSyntaxException` | class | JsonParseException | 19 | 6 |
| `LongSerializationPolicy` | class | — | 20 | 5 |
| `TypeAdapter` | class | — | 85 | 23 |
| `TypeAdapterFactory` | class | — | 9 | 1 |

<details>
<summary><b>Function list for <code>com.google.gson</code></b> (click to expand)</summary>

- **`DefaultDateTypeAdapter`** — 12 function(s): `this()`, `DefaultDateTypeAdapter()`, `if()`, `IllegalArgumentException()`, `write()`, `synchronized()`, `read()`, `Timestamp()`, `AssertionError()`, `deserializeToDate()`, `JsonSyntaxException()`, `toString()`
- **`ExclusionStrategy`** — 2 function(s): `shouldSkipClass()`, `shouldSkipField()`
- **`FieldAttributes`** — 9 function(s): `FieldAttributes()`, `getName()`, `getDeclaredType()`, `getAnnotation()`, `return()`, `getAnnotations()`, `hasModifier()`, `get()`, `isSynthetic()`
- **`FieldNamingPolicy`** — 7 function(s): `translateName()`, `upperCaseFirstLetter()`, `separateCamelCase()`, `for()`, `if()`, `while()`, `modifyString()`
- **`FieldNamingStrategy`** — 1 function(s): `translateName()`
- **`Gson`** — 35 function(s): `Gson()`, `this()`, `excluder()`, `fieldNamingStrategy()`, `serializeNulls()`, `htmlSafe()`, `doubleAdapter()`, `if()`, `read()`, `write()`, `floatAdapter()`, `checkValidFloatingPoint()`, `IllegalArgumentException()`, `longAdapter()`, `atomicLongAdapter()`, `AtomicLong()`, `atomicLongArrayAdapter()`, `for()`, `while()`, `getAdapter()`, `getDelegateAdapter()`, `toJsonTree()`, `toJson()`, `JsonIOException()`, `newJsonWriter()`, `newJsonReader()`, `fromJson()`, `return()`, `assertFullConsumption()`, `JsonSyntaxException()`, `FutureTypeAdapter()`, `setDelegate()`, `AssertionError()`, `IllegalStateException()`, `toString()`
- **`GsonBuilder`** — 26 function(s): `setVersion()`, `excludeFieldsWithModifiers()`, `generateNonExecutableJson()`, `excludeFieldsWithoutExposeAnnotation()`, `serializeNulls()`, `enableComplexMapKeySerialization()`, `disableInnerClassSerialization()`, `setLongSerializationPolicy()`, `setFieldNamingPolicy()`, `setFieldNamingStrategy()`, `setExclusionStrategies()`, `for()`, `addSerializationExclusionStrategy()`, `addDeserializationExclusionStrategy()`, `setPrettyPrinting()`, `setLenient()`, `disableHtmlEscaping()`, `setDateFormat()`, `registerTypeAdapter()`, `if()`, `registerTypeAdapterFactory()`, `registerTypeHierarchyAdapter()`, `serializeSpecialFloatingPointValues()`, `create()`, `addTypeAdaptersForDate()`, `Gson()`
- **`InstanceCreator`** — 1 function(s): `createInstance()`
- **`JsonArray`** — 27 function(s): `JsonArray()`, `deepCopy()`, `if()`, `for()`, `add()`, `addAll()`, `set()`, `remove()`, `contains()`, `size()`, `iterator()`, `get()`, `getAsNumber()`, `IllegalStateException()`, `getAsString()`, `getAsDouble()`, `getAsBigDecimal()`, `getAsBigInteger()`, `getAsFloat()`, `getAsLong()`, `getAsInt()`, `getAsByte()`, `getAsCharacter()`, `getAsShort()`, `getAsBoolean()`, `equals()`, `hashCode()`
- **`JsonDeserializationContext`** — 1 function(s): `deserialize()`
- **`JsonDeserializer`** — 1 function(s): `deserialize()`
- **`JsonElement`** — 28 function(s): `deepCopy()`, `isJsonArray()`, `isJsonObject()`, `isJsonPrimitive()`, `isJsonNull()`, `getAsJsonObject()`, `if()`, `return()`, `IllegalStateException()`, `getAsJsonArray()`, `getAsJsonPrimitive()`, `getAsJsonNull()`, `getAsBoolean()`, `UnsupportedOperationException()`, `getAsBooleanWrapper()`, `getAsNumber()`, `getAsString()`, `getAsDouble()`, `getAsFloat()`, `getAsLong()`, `getAsInt()`, `getAsByte()`, `getAsCharacter()`, `getAsBigDecimal()`, `getAsBigInteger()`, `getAsShort()`, `toString()`, `AssertionError()`
- **`JsonIOException`** — 2 function(s): `JsonIOException()`, `super()`
- **`JsonNull`** — 4 function(s): `JsonNull()`, `deepCopy()`, `hashCode()`, `equals()`
- **`JsonObject`** — 18 function(s): `deepCopy()`, `for()`, `add()`, `if()`, `remove()`, `addProperty()`, `createJsonElement()`, `entrySet()`, `keySet()`, `size()`, `has()`, `get()`, `getAsJsonPrimitive()`, `return()`, `getAsJsonArray()`, `getAsJsonObject()`, `equals()`, `hashCode()`
- **`JsonParseException`** — 2 function(s): `JsonParseException()`, `super()`
- **`JsonParser`** — 5 function(s): `parse()`, `if()`, `JsonSyntaxException()`, `JsonIOException()`, `JsonParseException()`
- **`JsonPrimitive`** — 26 function(s): `JsonPrimitive()`, `setValue()`, `deepCopy()`, `if()`, `isBoolean()`, `getAsBooleanWrapper()`, `return()`, `getAsBoolean()`, `isNumber()`, `getAsNumber()`, `isString()`, `getAsString()`, `getAsDouble()`, `getAsBigDecimal()`, `getAsBigInteger()`, `getAsFloat()`, `getAsLong()`, `getAsShort()`, `getAsInt()`, `getAsByte()`, `getAsCharacter()`, `isPrimitiveOrString()`, `for()`, `hashCode()`, `equals()`, `isIntegral()`
- **`JsonSerializationContext`** — 1 function(s): `serialize()`
- **`JsonSerializer`** — 1 function(s): `serialize()`
- **`JsonStreamParser`** — 12 function(s): `JsonStreamParser()`, `this()`, `next()`, `if()`, `NoSuchElementException()`, `JsonParseException()`, `hasNext()`, `synchronized()`, `JsonIOException()`, `JsonSyntaxException()`, `remove()`, `UnsupportedOperationException()`
- **`JsonSyntaxException`** — 2 function(s): `JsonSyntaxException()`, `super()`
- **`LongSerializationPolicy`** — 2 function(s): `serialize()`, `JsonPrimitive()`
- **`TypeAdapter`** — 11 function(s): `read()`, `write()`, `toJson()`, `nullSafe()`, `if()`, `return()`, `AssertionError()`, `toJsonTree()`, `JsonIOException()`, `fromJson()`, `fromJsonTree()`
- **`TypeAdapterFactory`** — 1 function(s): `create()`

</details>

### Package `com.google.gson.annotations`  (5 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `Expose` | class | — | 18 | 2 |
| `JsonAdapter` | class | — | 16 | 1 |
| `SerializedName` | class | — | 18 | 2 |
| `Since` | class | — | 16 | 1 |
| `Until` | class | — | 16 | 1 |

<details>
<summary><b>Function list for <code>com.google.gson.annotations</code></b> (click to expand)</summary>

- **`Expose`** — 2 function(s): `deserialize()`, `serialize()`
- **`JsonAdapter`** — 1 function(s): `nullSafe()`
- **`SerializedName`** — 2 function(s): `alternate()`, `value()`
- **`Since`** — 1 function(s): `value()`
- **`Until`** — 1 function(s): `value()`

</details>

### Package `com.google.gson.internal`  (12 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `C$Gson$Preconditions` | class | — | 23 | 8 |
| `C$Gson$Types` | class | ParameterizedType, Serializable | 475 | 129 |
| `ConstructorConstructor` | class | — | 204 | 58 |
| `Excluder` | class | TypeAdapterFactory, Cloneable | 203 | 46 |
| `JsonReaderInternalAccess` | class | — | 12 | 1 |
| `LazilyParsedNumber` | class | Number | 71 | 15 |
| `LinkedHashTreeMap` | class | AbstractMap<K, V> implements Serializable | 780 | 158 |
| `LinkedTreeMap` | class | AbstractMap<K, V> implements Serializable | 577 | 124 |
| `ObjectConstructor` | class | — | 7 | 1 |
| `Primitives` | class | — | 56 | 16 |
| `Streams` | class | Writer | 103 | 20 |
| `UnsafeAllocator` | class | — | 74 | 22 |

<details>
<summary><b>Function list for <code>com.google.gson.internal</code></b> (click to expand)</summary>

- **`C$Gson$Preconditions`** — 7 function(s): `C$Gson$Preconditions()`, `UnsupportedOperationException()`, `checkNotNull()`, `if()`, `NullPointerException()`, `checkArgument()`, `IllegalArgumentException()`
- **`C$Gson$Types`** — 37 function(s): `C$Gson$Types()`, `UnsupportedOperationException()`, `newParameterizedTypeWithOwner()`, `ParameterizedTypeImpl()`, `arrayOf()`, `GenericArrayTypeImpl()`, `subtypeOf()`, `if()`, `WildcardTypeImpl()`, `supertypeOf()`, `canonicalize()`, `return()`, `getRawType()`, `IllegalArgumentException()`, `equal()`, `equals()`, `hashCodeOrZero()`, `typeToString()`, `getGenericSupertype()`, `for()`, `while()`, `getSupertype()`, `resolve()`, `getArrayComponentType()`, `getCollectionElementType()`, `getMapKeyAndValueTypes()`, `resolveTypeVariable()`, `indexOf()`, `NoSuchElementException()`, `checkNotPrimitive()`, `getActualTypeArguments()`, `getOwnerType()`, `hashCode()`, `toString()`, `getGenericComponentType()`, `getUpperBounds()`, `getLowerBounds()`
- **`ConstructorConstructor`** — 12 function(s): `ConstructorConstructor()`, `get()`, `if()`, `construct()`, `return()`, `newUnsafeAllocator()`, `newDefaultConstructor()`, `AssertionError()`, `RuntimeException()`, `newDefaultImplementationConstructor()`, `JsonIOException()`, `toString()`
- **`Excluder`** — 22 function(s): `m5clone()`, `return()`, `AssertionError()`, `withVersion()`, `withModifiers()`, `for()`, `disableInnerClassSerialization()`, `excludeFieldsWithoutExposeAnnotation()`, `withExclusionStrategy()`, `if()`, `create()`, `read()`, `delegate()`, `write()`, `excludeField()`, `excludeClass()`, `isAnonymousOrLocal()`, `isInnerClass()`, `isStatic()`, `isValidVersion()`, `isValidSince()`, `isValidUntil()`
- **`JsonReaderInternalAccess`** — 1 function(s): `promoteNameToValue()`
- **`LazilyParsedNumber`** — 12 function(s): `LazilyParsedNumber()`, `intValue()`, `return()`, `BigDecimal()`, `longValue()`, `floatValue()`, `doubleValue()`, `toString()`, `writeReplace()`, `hashCode()`, `equals()`, `if()`
- **`LinkedHashTreeMap`** — 56 function(s): `compare()`, `LinkedHashTreeMap()`, `this()`, `size()`, `get()`, `if()`, `containsKey()`, `findByObject()`, `put()`, `NullPointerException()`, `clear()`, `while()`, `remove()`, `find()`, `ClassCastException()`, `rebalance()`, `doubleCapacity()`, `findByEntry()`, `equal()`, `secondaryHash()`, `return()`, `removeInternal()`, `replaceInParent()`, `removeInternalByKey()`, `for()`, `rotateLeft()`, `rotateRight()`, `entrySet()`, `keySet()`, `Node()`, `getKey()`, `getValue()`, `setValue()`, `equals()`, `hashCode()`, `toString()`, `first()`, `last()`, `AvlIterator()`, `reset()`, `next()`, `AvlBuilder()`, `add()`, `root()`, `IllegalStateException()`, `LinkedTreeMapIterator()`, `hasNext()`, `nextNode()`, `NoSuchElementException()`, `ConcurrentModificationException()`, `EntrySet()`, `iterator()`, `contains()`, `KeySet()`, `writeReplace()`, `LinkedHashMap()`
- **`LinkedTreeMap`** — 49 function(s): `compare()`, `LinkedTreeMap()`, `this()`, `size()`, `get()`, `if()`, `containsKey()`, `findByObject()`, `put()`, `NullPointerException()`, `clear()`, `remove()`, `find()`, `while()`, `ClassCastException()`, `rebalance()`, `findByEntry()`, `equal()`, `removeInternal()`, `replaceInParent()`, `removeInternalByKey()`, `for()`, `rotateLeft()`, `rotateRight()`, `entrySet()`, `keySet()`, `Node()`, `getKey()`, `getValue()`, `setValue()`, `equals()`, `hashCode()`, `toString()`, `first()`, `last()`, `LinkedTreeMapIterator()`, `hasNext()`, `nextNode()`, `NoSuchElementException()`, `ConcurrentModificationException()`, `IllegalStateException()`, `EntrySet()`, `iterator()`, `next()`, `contains()`, `return()`, `KeySet()`, `writeReplace()`, `LinkedHashMap()`
- **`ObjectConstructor`** — 1 function(s): `construct()`
- **`Primitives`** — 7 function(s): `Primitives()`, `UnsupportedOperationException()`, `add()`, `isPrimitive()`, `isWrapperType()`, `wrap()`, `unwrap()`
- **`Streams`** — 16 function(s): `Streams()`, `UnsupportedOperationException()`, `parse()`, `JsonSyntaxException()`, `if()`, `JsonIOException()`, `write()`, `writerForAppendable()`, `AppendableWriter()`, `flush()`, `close()`, `CurrentWrite()`, `length()`, `charAt()`, `subSequence()`, `String()`
- **`UnsafeAllocator`** — 7 function(s): `newInstance()`, `create()`, `UnsafeAllocator()`, `assertInstantiable()`, `return()`, `UnsupportedOperationException()`, `if()`

</details>

### Package `com.google.gson.internal.bind`  (14 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ArrayTypeAdapter` | class | TypeAdapter<Object> | 74 | 11 |
| `CollectionTypeAdapterFactory` | class | TypeAdapterFactory | 79 | 10 |
| `DateTypeAdapter` | class | TypeAdapter<Date> | 68 | 10 |
| `JsonAdapterAnnotationTypeAdapterFactory` | class | TypeAdapterFactory | 50 | 7 |
| `JsonTreeReader` | class | JsonReader | 352 | 101 |
| `JsonTreeWriter` | class | JsonWriter | 202 | 66 |
| `MapTypeAdapterFactory` | class | TypeAdapterFactory | 171 | 30 |
| `ObjectTypeAdapter` | class | TypeAdapter<Object> | 82 | 11 |
| `ReflectiveTypeAdapterFactory` | class | TypeAdapterFactory | 255 | 47 |
| `SqlDateTypeAdapter` | class | TypeAdapter<Date> | 49 | 8 |
| `TimeTypeAdapter` | class | TypeAdapter<Time> | 50 | 8 |
| `TreeTypeAdapter` | class | TypeAdapter<T> | 140 | 26 |
| `TypeAdapterRuntimeTypeWrapper` | class | TypeAdapter<T> | 59 | 8 |
| `TypeAdapters` | class | Enum<T>> extends TypeAdapter<T> | 941 | 193 |

<details>
<summary><b>Function list for <code>com.google.gson.internal.bind</code></b> (click to expand)</summary>

- **`ArrayTypeAdapter`** — 7 function(s): `create()`, `if()`, `ArrayTypeAdapter()`, `read()`, `while()`, `for()`, `write()`
- **`CollectionTypeAdapterFactory`** — 8 function(s): `CollectionTypeAdapterFactory()`, `create()`, `if()`, `Adapter()`, `read()`, `while()`, `write()`, `for()`
- **`DateTypeAdapter`** — 7 function(s): `create()`, `if()`, `DateTypeAdapter()`, `read()`, `deserializeToDate()`, `JsonSyntaxException()`, `write()`
- **`JsonAdapterAnnotationTypeAdapterFactory`** — 5 function(s): `JsonAdapterAnnotationTypeAdapterFactory()`, `create()`, `if()`, `return()`, `IllegalArgumentException()`
- **`JsonTreeReader`** — 33 function(s): `read()`, `AssertionError()`, `close()`, `JsonTreeReader()`, `super()`, `push()`, `beginArray()`, `expect()`, `endArray()`, `popStack()`, `if()`, `beginObject()`, `endObject()`, `hasNext()`, `return()`, `peek()`, `IllegalStateException()`, `peekStack()`, `nextName()`, `nextString()`, `nextBoolean()`, `nextNull()`, `nextDouble()`, `NumberFormatException()`, `nextLong()`, `nextInt()`, `skipValue()`, `toString()`, `getClass()`, `promoteNameToValue()`, `getPath()`, `while()`, `locationString()`
- **`JsonTreeWriter`** — 20 function(s): `write()`, `AssertionError()`, `flush()`, `close()`, `JsonTreeWriter()`, `super()`, `get()`, `if()`, `IllegalStateException()`, `peek()`, `put()`, `beginArray()`, `endArray()`, `beginObject()`, `endObject()`, `name()`, `value()`, `nullValue()`, `IllegalArgumentException()`, `IOException()`
- **`MapTypeAdapterFactory`** — 11 function(s): `MapTypeAdapterFactory()`, `create()`, `if()`, `Adapter()`, `read()`, `while()`, `JsonSyntaxException()`, `write()`, `for()`, `keyToString()`, `AssertionError()`
- **`ObjectTypeAdapter`** — 8 function(s): `create()`, `if()`, `ObjectTypeAdapter()`, `read()`, `switch()`, `while()`, `IllegalStateException()`, `write()`
- **`ReflectiveTypeAdapterFactory`** — 18 function(s): `ReflectiveTypeAdapterFactory()`, `excludeField()`, `return()`, `getFieldNames()`, `if()`, `for()`, `create()`, `Adapter()`, `createBoundField()`, `BoundField()`, `write()`, `read()`, `writeField()`, `getBoundFields()`, `while()`, `IllegalArgumentException()`, `AssertionError()`, `JsonSyntaxException()`
- **`SqlDateTypeAdapter`** — 7 function(s): `create()`, `if()`, `SqlDateTypeAdapter()`, `read()`, `Date()`, `JsonSyntaxException()`, `write()`
- **`TimeTypeAdapter`** — 7 function(s): `create()`, `if()`, `TimeTypeAdapter()`, `read()`, `Time()`, `JsonSyntaxException()`, `write()`
- **`TreeTypeAdapter`** — 14 function(s): `TreeTypeAdapter()`, `read()`, `if()`, `delegate()`, `write()`, `newFactory()`, `SingleTypeFactory()`, `newFactoryWithMatchRawType()`, `newTypeHierarchyFactory()`, `create()`, `GsonContextImpl()`, `serialize()`, `deserialize()`, `return()`
- **`TypeAdapterRuntimeTypeWrapper`** — 5 function(s): `TypeAdapterRuntimeTypeWrapper()`, `read()`, `write()`, `if()`, `getRuntimeTypeIfMoreSpecific()`
- **`TypeAdapters`** — 32 function(s): `write()`, `UnsupportedOperationException()`, `read()`, `while()`, `if()`, `JsonSyntaxException()`, `for()`, `AtomicInteger()`, `AtomicBoolean()`, `LazilyParsedNumber()`, `BigDecimal()`, `BigInteger()`, `StringBuilder()`, `StringBuffer()`, `URL()`, `JsonIOException()`, `create()`, `return()`, `Timestamp()`, `GregorianCalendar()`, `Locale()`, `switch()`, `JsonPrimitive()`, `IllegalArgumentException()`, `EnumTypeAdapter()`, `TypeAdapters()`, `AssertionError()`, `newFactory()`, `TypeAdapterFactory()`, `toString()`, `newFactoryForMultipleTypes()`, `newTypeHierarchyFactory()`

</details>

### Package `com.google.gson.internal.bind.util`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `ISO8601Utils` | class | — | 337 | 65 |

<details>
<summary><b>Function list for <code>com.google.gson.internal.bind.util</code></b> (click to expand)</summary>

- **`ISO8601Utils`** — 12 function(s): `format()`, `padInt()`, `if()`, `parse()`, `IllegalArgumentException()`, `IndexOutOfBoundsException()`, `checkOffset()`, `parseInt()`, `NumberFormatException()`, `while()`, `for()`, `indexOfNonDigit()`

</details>

### Package `com.google.gson.reflect`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `TypeToken` | class | — | 195 | 46 |

<details>
<summary><b>Function list for <code>com.google.gson.reflect</code></b> (click to expand)</summary>

- **`TypeToken`** — 17 function(s): `TypeToken()`, `getSuperclassTypeParameter()`, `if()`, `RuntimeException()`, `getType()`, `isAssignableFrom()`, `buildUnexpectedTypeError()`, `while()`, `for()`, `typeEquals()`, `AssertionError()`, `matches()`, `hashCode()`, `equals()`, `return()`, `toString()`, `get()`

</details>

### Package `com.google.gson.stream`  (5 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `JsonReader` | class | Closeable | 1,376 | 294 |
| `JsonScope` | class | — | 17 | 0 |
| `JsonToken` | class | — | 16 | 0 |
| `JsonWriter` | class | Closeable, Flushable | 365 | 124 |
| `MalformedJsonException` | class | IOException | 22 | 7 |

<details>
<summary><b>Function list for <code>com.google.gson.stream</code></b> (click to expand)</summary>

- **`JsonReader`** — 53 function(s): `promoteNameToValue()`, `if()`, `IllegalStateException()`, `JsonReader()`, `NullPointerException()`, `setLenient()`, `isLenient()`, `beginArray()`, `push()`, `endArray()`, `beginObject()`, `endObject()`, `hasNext()`, `return()`, `peek()`, `switch()`, `AssertionError()`, `doPeek()`, `syntaxError()`, `checkLenient()`, `consumeNonExecutePrefix()`, `peekKeyword()`, `for()`, `peekNumber()`, `while()`, `isLiteral()`, `nextName()`, `nextString()`, `nextBoolean()`, `nextNull()`, `nextDouble()`, `MalformedJsonException()`, `nextLong()`, `NumberFormatException()`, `nextQuotedValue()`, `String()`, `nextUnquotedValue()`, `skipQuotedValue()`, `readEscapeCharacter()`, `skipUnquotedValue()`, `UnsupportedOperationException()`, `nextInt()`, `close()`, `skipValue()`, `fillBuffer()`, `nextNonWhitespace()`, `EOFException()`, `skipToEndOfLine()`, `skipTo()`, `toString()`, `getClass()`, `locationString()`, `getPath()`
- **`JsonWriter`** — 34 function(s): `for()`, `JsonWriter()`, `push()`, `if()`, `NullPointerException()`, `setIndent()`, `setLenient()`, `isLenient()`, `setHtmlSafe()`, `isHtmlSafe()`, `setSerializeNulls()`, `getSerializeNulls()`, `beginArray()`, `writeDeferredName()`, `open()`, `endArray()`, `close()`, `beginObject()`, `endObject()`, `beforeValue()`, `IllegalStateException()`, `newline()`, `peek()`, `replaceTop()`, `name()`, `beforeName()`, `string()`, `value()`, `nullValue()`, `jsonValue()`, `IllegalArgumentException()`, `flush()`, `IOException()`, `while()`
- **`MalformedJsonException`** — 3 function(s): `MalformedJsonException()`, `super()`, `initCause()`

</details>

### Package `com.yftech.tbox.sdk`  (6 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `BuildConfig` | class | — | 15 | 0 |
| `CarTBoxSdkManager` | class | ICarTBoxSdkCallback.Stub implements IBinder.DeathRecipient, MonitorServiceRestartManage... | 788 | 181 |
| `ICarTBoxSdkCallback` | class | IInterface | 507 | 68 |
| `ICarTBoxSdkService` | class | IInterface | 542 | 54 |
| `LogUtil` | class | — | 29 | 5 |
| `R` | class | — | 2,534 | 15 |

<details>
<summary><b>Function list for <code>com.yftech.tbox.sdk</code></b> (click to expand)</summary>

- **`CarTBoxSdkManager`** — 54 function(s): `CarTBoxSdkManager()`, `getInstance()`, `if()`, `synchronized()`, `registerCarTBoxSdkCallback()`, `IllegalArgumentException()`, `unregisterCarTBoxSdkCallback()`, `requestCurrentOperator()`, `requestCurrentNetworkType()`, `requestCurrentSignalStrength()`, `resetTBoxNetwork()`, `requestCurrentSignalRSSI()`, `requestNetworkStatus()`, `resetTBox()`, `shutdownTBox()`, `requestTBoxVersion()`, `requestFiveCodeInfo()`, `requestUpgrade()`, `stopUpgrade()`, `requestDownloadLog()`, `stopDownloadLog()`, `requestActiveDisconnect()`, `requestHighPrecisionLocationInfo()`, `requestTimeZoneInfo()`, `getVersionName()`, `CarTBoxSdkManagerGlobal()`, `get()`, `getCarScreenService()`, `startReconnectThread()`, `onServiceStart()`, `connectCarTBoxSdkServiceLocked()`, `for()`, `run()`, `asBinder()`, `binderDied()`, `onCurrentOperator()`, `onCurrentNetworkType()`, `onCurrentSignalStrength()`, `onCurrentSignalRSSI()`, `onNetworkState()`, `onTBoxVersion()`, `onFiveCodeInfo()`, `onBaseStationInfo()`, `onResetTBoxNetwork()`, `onResetTBox()`, `onShutdownTBox()`, `onUpgradeState()`, `onUpgradeTip()`, `onDownloadLogState()`, `onActiveDisconnect()`, `onHighPrecisionLocationInfo()`, `onTimeZoneInfo()`, `onGNSSLocationInfo()`, `onServiceBind()`
- **`ICarTBoxSdkCallback`** — 28 function(s): `onActiveDisconnect()`, `onBaseStationInfo()`, `onCurrentNetworkType()`, `onCurrentOperator()`, `onCurrentSignalRSSI()`, `onCurrentSignalStrength()`, `onDownloadLogState()`, `onFiveCodeInfo()`, `onGNSSLocationInfo()`, `onHighPrecisionLocationInfo()`, `onNetworkState()`, `onResetTBox()`, `onResetTBoxNetwork()`, `onShutdownTBox()`, `onTBoxVersion()`, `onTimeZoneInfo()`, `onUpgradeState()`, `onUpgradeTip()`, `Stub()`, `attachInterface()`, `asInterface()`, `if()`, `return()`, `Proxy()`, `asBinder()`, `onTransact()`, `switch()`, `getInterfaceDescriptor()`
- **`ICarTBoxSdkService`** — 29 function(s): `registerCarTBoxSdkCallback()`, `requestActiveDisconnect()`, `requestCurrentNetworkType()`, `requestCurrentOperator()`, `requestCurrentSignalRSSI()`, `requestCurrentSignalStrength()`, `requestDownloadLog()`, `requestFiveCodeInfo()`, `requestHighPrecisionLocationInfo()`, `requestNetworkStatus()`, `requestTBoxVersion()`, `requestTimeZoneInfo()`, `requestUpgrade()`, `resetTBox()`, `resetTBoxNetwork()`, `shutdownTBox()`, `stopDownloadLog()`, `stopUpgrade()`, `unregisterCarTBoxSdkCallback()`, `Stub()`, `attachInterface()`, `asInterface()`, `if()`, `return()`, `Proxy()`, `asBinder()`, `onTransact()`, `switch()`, `getInterfaceDescriptor()`
- **`LogUtil`** — 5 function(s): `i()`, `d()`, `w()`, `e()`, `v()`
- **`R`** — 15 function(s): `R()`, `anim()`, `animator()`, `attr()`, `bool()`, `color()`, `dimen()`, `drawable()`, `id()`, `integer()`, `interpolator()`, `layout()`, `string()`, `style()`, `styleable()`

</details>

### Package `org.greenrobot.eventbus`  (18 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AsyncPoster` | class | Runnable, Poster | 29 | 5 |
| `BackgroundPoster` | class | Runnable, Poster | 51 | 9 |
| `EventBus` | class | — | 514 | 128 |
| `EventBusBuilder` | class | — | 142 | 26 |
| `EventBusException` | class | RuntimeException | 19 | 6 |
| `HandlerPoster` | class | Handler implements Poster | 66 | 13 |
| `Logger` | class | Logger | 64 | 12 |
| `MainThreadSupport` | class | MainThreadSupport | 30 | 6 |
| `NoSubscriberEvent` | class | — | 13 | 1 |
| `PendingPost` | class | — | 45 | 8 |
| `PendingPostQueue` | class | — | 50 | 13 |
| `Poster` | class | — | 7 | 1 |
| `Subscribe` | class | — | 20 | 3 |
| `SubscriberExceptionEvent` | class | — | 17 | 1 |
| `SubscriberMethod` | class | — | 51 | 8 |
| `SubscriberMethodFinder` | class | — | 265 | 58 |
| `Subscription` | class | — | 27 | 4 |
| `ThreadMode` | class | — | 11 | 0 |

<details>
<summary><b>Function list for <code>org.greenrobot.eventbus</code></b> (click to expand)</summary>

- **`AsyncPoster`** — 5 function(s): `AsyncPoster()`, `enqueue()`, `run()`, `if()`, `IllegalStateException()`
- **`BackgroundPoster`** — 6 function(s): `BackgroundPoster()`, `enqueue()`, `synchronized()`, `if()`, `run()`, `while()`
- **`EventBus`** — 38 function(s): `onPostCompleted()`, `getDefault()`, `if()`, `synchronized()`, `builder()`, `EventBusBuilder()`, `clearCaches()`, `EventBus()`, `this()`, `initialValue()`, `PostingThreadState()`, `register()`, `for()`, `subscribe()`, `EventBusException()`, `checkPostStickyEventToSubscription()`, `postToSubscription()`, `isMainThread()`, `isRegistered()`, `unsubscribeByEventType()`, `while()`, `unregister()`, `post()`, `postSingleEvent()`, `cancelEventDelivery()`, `postSticky()`, `getStickyEvent()`, `removeStickyEvent()`, `removeAllStickyEvents()`, `hasSubscriberForEvent()`, `postSingleEventForEventType()`, `invokeSubscriber()`, `IllegalStateException()`, `addInterfaces()`, `handleSubscriberException()`, `getExecutorService()`, `getLogger()`, `toString()`
- **`EventBusBuilder`** — 21 function(s): `logSubscriberExceptions()`, `logNoSubscriberMessages()`, `sendSubscriberExceptionEvent()`, `sendNoSubscriberEvent()`, `throwSubscriberException()`, `eventInheritance()`, `executorService()`, `skipMethodVerificationFor()`, `if()`, `ignoreGeneratedIndex()`, `strictMethodVerification()`, `addIndex()`, `logger()`, `getLogger()`, `getMainThreadSupport()`, `getAndroidMainLooperOrNull()`, `installDefaultEventBus()`, `synchronized()`, `EventBusException()`, `build()`, `EventBus()`
- **`EventBusException`** — 2 function(s): `EventBusException()`, `super()`
- **`HandlerPoster`** — 7 function(s): `HandlerPoster()`, `super()`, `enqueue()`, `synchronized()`, `if()`, `EventBusException()`, `handleMessage()`
- **`Logger`** — 7 function(s): `log()`, `JavaLogger()`, `get()`, `if()`, `AndroidLogger()`, `SystemOutLogger()`, `getAndroidMainLooperOrNull()`
- **`MainThreadSupport`** — 4 function(s): `createPoster()`, `isMainThread()`, `AndroidHandlerMainThreadSupport()`, `HandlerPoster()`
- **`NoSubscriberEvent`** — 1 function(s): `NoSubscriberEvent()`
- **`PendingPost`** — 5 function(s): `PendingPost()`, `obtainPendingPost()`, `synchronized()`, `if()`, `releasePendingPost()`
- **`PendingPostQueue`** — 7 function(s): `enqueue()`, `if()`, `NullPointerException()`, `IllegalStateException()`, `notifyAll()`, `poll()`, `wait()`
- **`Poster`** — 1 function(s): `enqueue()`
- **`Subscribe`** — 3 function(s): `priority()`, `sticky()`, `threadMode()`
- **`SubscriberExceptionEvent`** — 1 function(s): `SubscriberExceptionEvent()`
- **`SubscriberMethod`** — 5 function(s): `SubscriberMethod()`, `equals()`, `if()`, `checkMethodString()`, `hashCode()`
- **`SubscriberMethodFinder`** — 21 function(s): `SubscriberMethodFinder()`, `findSubscriberMethods()`, `if()`, `EventBusException()`, `findUsingInfo()`, `while()`, `for()`, `findUsingReflectionInSingleClass()`, `getMethodsAndRelease()`, `synchronized()`, `prepareFindState()`, `FindState()`, `getSubscriberInfo()`, `findUsingReflection()`, `clearCaches()`, `initForSubscriber()`, `recycle()`, `checkAdd()`, `IllegalStateException()`, `checkAddWithMethodSignature()`, `moveToSuperclass()`
- **`Subscription`** — 4 function(s): `Subscription()`, `equals()`, `if()`, `hashCode()`

</details>

### Package `org.greenrobot.eventbus.android`  (1 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AndroidLogger` | class | Logger | 60 | 11 |

<details>
<summary><b>Function list for <code>org.greenrobot.eventbus.android</code></b> (click to expand)</summary>

- **`AndroidLogger`** — 5 function(s): `isAndroidLogAvailable()`, `AndroidLogger()`, `log()`, `if()`, `mapLevel()`

</details>

### Package `org.greenrobot.eventbus.meta`  (5 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AbstractSubscriberInfo` | class | SubscriberInfo | 64 | 14 |
| `SimpleSubscriberInfo` | class | AbstractSubscriberInfo | 26 | 4 |
| `SubscriberInfo` | class | — | 15 | 3 |
| `SubscriberInfoIndex` | class | — | 7 | 1 |
| `SubscriberMethodInfo` | class | — | 29 | 5 |

<details>
<summary><b>Function list for <code>org.greenrobot.eventbus.meta</code></b> (click to expand)</summary>

- **`AbstractSubscriberInfo`** — 9 function(s): `AbstractSubscriberInfo()`, `getSubscriberClass()`, `getSuperSubscriberInfo()`, `if()`, `RuntimeException()`, `shouldCheckSuperclass()`, `createSubscriberMethod()`, `SubscriberMethod()`, `EventBusException()`
- **`SimpleSubscriberInfo`** — 4 function(s): `SimpleSubscriberInfo()`, `super()`, `getSubscriberMethods()`, `for()`
- **`SubscriberInfo`** — 3 function(s): `getSubscriberMethods()`, `getSuperSubscriberInfo()`, `shouldCheckSuperclass()`
- **`SubscriberInfoIndex`** — 1 function(s): `getSubscriberInfo()`
- **`SubscriberMethodInfo`** — 2 function(s): `SubscriberMethodInfo()`, `this()`

</details>

### Package `org.greenrobot.eventbus.util`  (8 classes)

| Class | Kind | Extends / Implements | Lines | Methods |
|---|---|---|---:|---|
| `AsyncExecutor` | class | — | 104 | 22 |
| `ErrorDialogConfig` | class | — | 65 | 10 |
| `ErrorDialogFragmentFactory` | class | ErrorDialogFragmentFactory<Fragment> | 89 | 19 |
| `ErrorDialogFragments` | class | DialogFragment implements DialogInterface.OnClickListener | 73 | 10 |
| `ErrorDialogManager` | class | Fragment | 201 | 42 |
| `ExceptionToResourceMapping` | class | — | 54 | 8 |
| `HasExecutionScope` | class | — | 9 | 2 |
| `ThrowableFailureEvent` | class | HasExecutionScope | 37 | 6 |

<details>
<summary><b>Function list for <code>org.greenrobot.eventbus.util</code></b> (click to expand)</summary>

- **`AsyncExecutor`** — 13 function(s): `run()`, `Builder()`, `threadPool()`, `failureEventType()`, `eventBus()`, `build()`, `buildForScope()`, `if()`, `AsyncExecutor()`, `builder()`, `create()`, `RuntimeException()`, `execute()`
- **`ErrorDialogConfig`** — 10 function(s): `ErrorDialogConfig()`, `addMapping()`, `getMessageIdForThrowable()`, `if()`, `setDefaultDialogIconId()`, `setDefaultEventTypeOnDialogClosed()`, `disableExceptionLogging()`, `setTagForLoggingExceptions()`, `setEventBus()`, `getEventBus()`
- **`ErrorDialogFragmentFactory`** — 9 function(s): `createErrorFragment()`, `ErrorDialogFragmentFactory()`, `prepareErrorFragment()`, `if()`, `getTitleFor()`, `getMessageFor()`, `Support()`, `super()`, `Honeycomb()`
- **`ErrorDialogFragments`** — 6 function(s): `createDialog()`, `if()`, `handleOnClick()`, `RuntimeException()`, `onCreateDialog()`, `onClick()`
- **`ErrorDialogManager`** — 11 function(s): `onCreate()`, `onResume()`, `if()`, `onPause()`, `onEventMainThread()`, `attachTo()`, `RuntimeException()`, `isSupportActivity()`, `for()`, `checkLogException()`, `isInExecutionScope()`
- **`ExceptionToResourceMapping`** — 5 function(s): `mapThrowable()`, `if()`, `mapThrowableFlat()`, `for()`, `addMapping()`
- **`HasExecutionScope`** — 2 function(s): `getExecutionScope()`, `setExecutionScope()`
- **`ThrowableFailureEvent`** — 5 function(s): `ThrowableFailureEvent()`, `getThrowable()`, `isSuppressErrorUi()`, `getExecutionScope()`, `setExecutionScope()`

</details>

## 8. Notable constants, endpoints and data

### Network endpoints and schemes

- `http://schemas.android.com/apk/res-auto` — referenced in ChipDrawable.java
- `http://schemas.android.com/apk/res/android` — referenced in Chip.java, TypedArrayUtils.java

### Native libraries (`System.loadLibrary`)

_none found_

### Reflection targets (`Class.forName`)

`android.app.Notification$Action`, `android.content.res.ThemedResourceCache`, `android.graphics.Insets`, `android.support.transition.FragmentTransitionSupport`, `android.util.Log`, `android.view.GhostView`, `com.android.internal.view.menu.MenuBuilder`, `libcore.icu.ICU`, `sun.misc.Unsafe`

### Cryptography used

_none found_

### SQL statements

_none found_

### Other notable literals

- `"com.yftech.intent.action.start.engineeringmode"  (launch action)`
- `"com.yftech.intent.action.engineeringmode.config.TYPE"  (ConfigDataReceiver)`
- `"com.yftech.intent.action.engineeringmode.log"  (LogReceiver)`
- `"/cache/recovery/last_certificate"  and  "/cache/recovery/last_certificate_hicar"`
- `"persist.sys.carplay.certificate"  /  "persist.sys.hicar.certificate"  /  "persist.vendor.ul.dl.same.rate"`
- `"<sdcard>/certificate"  and  "<sdcard>/certificate_hicar"`

## 9. Resource inventory

| Extension | Count |
|---|---:|
| `.xml` | 415 |
| `.png` | 282 |
| `.version` | 31 |
| `.dex` | 2 |
| `.json` | 2 |
| `.mf` | 1 |
| `.rsa` | 1 |
| `.sf` | 1 |
| `.mp3` | 1 |

## 10. How this was produced

```bash
# 1. fetch the single APK file (no repo clone)
curl -L -o com.yftech.engineeringmode.apk \
  https://github.com/ammisaidkaidi/yftech-apks/raw/main/com.yftech.engineeringmode.apk

# 2. Java-readable decompilation
jadx -d sources -j 2 --show-bad-code com.yftech.engineeringmode.apk

# 3. smali + resource decoding
apktool d -f -o smali com.yftech.engineeringmode.apk
```

## License / disclaimer

This repository is an automatically generated, human-readable decompilation of a system application for research and interoperability purposes. All code remains the property of its original author(s). No original source code was published by the vendor.
