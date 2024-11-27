// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_api_provider.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$EmailApiProvider extends EmailApiProvider {
  _$EmailApiProvider([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = EmailApiProvider;

  @override
  Future<Response<dynamic>> sendEmail({required EmailModel email}) {
    final Uri $url = Uri.parse('${apiEmailJs}');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final $body = email;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
