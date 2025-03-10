import MethodChannel, {
  MethodCallHandler,
  MethodResult
} from '@ohos/flutter_ohos/src/main/ets/plugin/common/MethodChannel';
import PlatformView, { Params } from '@ohos/flutter_ohos/src/main/ets/plugin/platform/PlatformView';
import common from '@ohos.app.ability.common';
import { BinaryMessenger } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';
import StandardMethodCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMethodCodec';
import MethodCall from '@ohos/flutter_ohos/src/main/ets/plugin/common/MethodCall';
import { webview } from '@kit.ArkWeb';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AMap, MapsInitializer, MapView, MapViewComponent, MapViewManager, } from '@amap/amap_lbs_map3d';

MapsInitializer.setApiKey("e4147e927a1f63a0acff45cecf9419b5");
MapViewManager.getInstance().registerMapViewCreatedCallback((mapview?: MapView, mapViewName?: string) => {
  if (!mapview) {
    return;
  }
  let mapView = mapview;
  mapView.onCreate();
  mapView.getMapAsync((map) => {
    let aMap: AMap = map;
  })
})

@Component
struct ButtonComponent {
  @Prop params: Params
  customView: AmapWidgetView = this.params.platformView as AmapWidgetView
  @StorageLink('numValue') storageLink: string = "first"
  @State bkColor: Color = Color.Red

  build() {
    Row() {
      MapViewComponent()
        .width('100%')
        .height('100%')
    }
  }
}

@Builder
function ButtonBuilder(params: Params) {
  ButtonComponent({ params: params })
    .backgroundColor(Color.Transparent)
}

AppStorage.setOrCreate('numValue', 'test')

@Observed
export class AmapWidgetView extends PlatformView implements MethodCallHandler {
  numValue: string = "test";

  methodChannel: MethodChannel;
  index: number = 1;

  constructor(context: common.Context, viewId: number, args: ESObject, message: BinaryMessenger) {
    super();
    // 注册消息通道
    this.methodChannel = new MethodChannel(message, `com.shaohushuo.app/amapView/${viewId}`, StandardMethodCodec.INSTANCE);
    this.methodChannel.setMethodCallHandler(this);
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    // 接受Dart侧发来的消息
    let method: string = call.method;
    let link1: SubscribedAbstractProperty<number> = AppStorage.link('numValue');
    switch (method) {
      case 'getMessageFromFlutterView':
        let value: ESObject = call.args;
        this.numValue = value;
        link1.set(value)
        console.log("nodeController receive message from dart: " + this.numValue);
        result.success(true);
        break;
    }
  }

  public  sendMessage = (text: string) => {
    console.log("nodeController sendMessage")
    //向Dart侧发送消息
    this.methodChannel.invokeMethod('getMessageFromOhosView', text);
  }

  getView(): WrappedBuilder<[Params]> {
    return new WrappedBuilder(ButtonBuilder);
  }

  dispose(): void {
  }
}