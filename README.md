# DentCity — Setup Guide

Follow these steps in order to get the project running on your PC.

---

## Step 1 — Enable Developer Mode

1. Press `Windows + R` and type:
   ```ms-settings:developer```
2. Toggle **Developer Mode** to **ON**
3. Restart your PC

---

## Step 2 — Install Flutter SDK (Can Skip if Finished)

1. Go to https://docs.flutter.dev/get-started/install/windows
2. Download the Flutter SDK zip file
3. Extract it to:
   ```C:\flutter```
4. Add Flutter to your PATH:
   - Search **"Environment Variables"** in Windows search
   - Under **System Variables** find **Path** and click **Edit**
   - Click **New** and add:
     ```C:\flutter\bin```
   - Click **OK** on all windows
5. Verify by opening a terminal and running (use bash terminal):
   ``` bash flutter --version ```

---

## Step 3 — Install Visual Studio

1. Go to https://visualstudio.microsoft.com/
2. Download and install **Visual Studio Community 2026** (free)
3. During installation, make sure to check:
   - ✅ **Desktop development with C++**
   - ✅ **Windows 10/11 SDK**
4. Click **Install** and wait for it to finish

---

## Step 4 — Verify your setup

Run this command to check everything is installed correctly:
```flutter doctor```

You should see all green checkmarks:
```
[√] Flutter
[√] Windows Version
[√] Visual Studio
[√] Connected device
```

If you see any red errors, fix them before moving on.

---

## Step 5 — Clone the project

```bash
git clone https://github.com/Project-ByteSize/app.git
cd app
```

---

## Step 6 — Install dependencies 

```bash
flutter pub get
```

---

## Step 7 — Generate database code (THIS IS VERY IMPORTANT)

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Step 8 — Run the app (make sure to run on windows)

```bash
flutter run -d windows
```

The app should open on your screen

---
