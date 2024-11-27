import 'package:chopper/chopper.dart';
import 'package:naviquezon/src/core/models/email/email_model.dart';
import 'package:naviquezon/src/core/utils/keys/api_keys.dart';

part 'email_api_provider.chopper.dart';

///{@template EmailApiProvider}
/// Api provider for email service.
///{@endtemplate}
@ChopperApi(baseUrl: apiEmailJs)
abstract class EmailApiProvider extends ChopperService {
  /// A helper method that helps instantiating the service.
  ///
  static EmailApiProvider create([ChopperClient? client]) =>
      _$EmailApiProvider(client);

  @Post(
    optionalBody: true,
    headers: {'Content-Type': 'application/json'},
  )
  Future<Response<dynamic>> sendEmail({
    @Body() required EmailModel email,
  });
}
