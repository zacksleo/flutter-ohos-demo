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

import {
  Any,
  BasicMessageChannel,
  EventChannel,
  FlutterManager,
  FlutterPlugin,
  Log,
  MethodCall,
  MethodChannel,
  StandardMessageCodec
} from '@ohos/flutter_ohos';
import { FlutterPluginBinding } from '@ohos/flutter_ohos/src/main/ets/embedding/engine/plugins/FlutterPlugin';
import { batteryInfo } from '@kit.BasicServicesKit';
import { MethodCallHandler, MethodResult } from '@ohos/flutter_ohos/src/main/ets/plugin/common/MethodChannel';
import { preferences } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import router from '@ohos.router'

const TAG = "[flutter][plugin][forest]";

export default class OhosPlugin implements FlutterPlugin {
  private channel?: MethodChannel;
  private basicChannel?: BasicMessageChannel<Any>;
  private api = new OhosApi();
  private dataPreferences: preferences.Preferences | null = null;

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "shaohushuo.com/app");
    this.channel.setMethodCallHandler({
      onMethodCall : (call: MethodCall, result: MethodResult) => {
        console.log(`${TAG}-->[${call.method}]: ${JSON.stringify(call.args)}`);
        switch (call.method) {
          case "redirectNative":
            let url = String(call.argument("url"));
            router.pushUrl({
              url: url
            })
            break;
          default:
            result.notImplemented();
            break;
        }
      }
    })
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    Log.i(TAG, "onDetachedFromEngine");
    this.channel?.setMethodCallHandler(null);
  }

  getUniqueClassName(): string {
    return "OhosPlugin";
  }
}

class OhosApi {

}

