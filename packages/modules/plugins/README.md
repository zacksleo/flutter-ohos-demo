# 插件使用示例

## flutter_inappwebview

`packages/plugins/pubspec.yaml`

```diff
+  flutter_inappwebview: ^6.0.0
```

`packages/apps/ohos_app/pubspec_overrides.yaml`

```diff
+  flutter_inappwebview:
+    git:
+      url: https://gitcode.com/openharmony-sig/flutter_inappwebview.git
+      path: flutter_inappwebview
```

## video_player

`packages/plugins/pubspec.yaml`

```diff
+  video_player: ^2.7.0
```

`packages/apps/ohos_app/pubspec_overrides.yaml`

```diff
+  video_player:
+    git:
+      url: https://gitcode.com/openharmony-sig/flutter_packages.git
+      path: packages/video_player/video_player
```
## cached_network_image

`packages/plugins/pubspec.yaml`

```diff
+  cached_network_image: ^3.4.1
```

`packages/apps/ohos_app/pubspec_overrides.yaml`

```diff
+  path_provider:
+    git:
+      url: "https://gitcode.com/openharmony-sig/flutter_packages.git"
+      path: "packages/path_provider/path_provider"
```

## image_picker

`packages/plugins/pubspec.yaml`

```diff
+  image_picker: ^1.1.2
```

`packages/apps/ohos_app/pubspec_overrides.yaml`

```diff
+  image_picker:
+    git:
+      url: https://gitcode.com/openharmony-sig/flutter_packages.git
+      path: packages/image_picker/image_picker
```