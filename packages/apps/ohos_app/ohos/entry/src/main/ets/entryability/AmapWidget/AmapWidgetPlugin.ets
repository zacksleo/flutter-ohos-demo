/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import  { FlutterPlugin,
  FlutterPluginBinding } from '@ohos/flutter_ohos/src/main/ets/embedding/engine/plugins/FlutterPlugin';
import StandardMessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMessageCodec';
import { AmapWidgetFactory } from './AmapWidgetFactory';

export class AmapWidgetPlugin implements FlutterPlugin {
  getUniqueClassName(): string {
    return 'AmapWidgetPlugin';
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    binding.getPlatformViewRegistry()?.
    registerViewFactory('com.shaohushuo.app/customView', new AmapWidgetFactory(binding.getBinaryMessenger(), StandardMessageCodec.INSTANCE));
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {}
}