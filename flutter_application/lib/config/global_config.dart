import 'package:openid_client/openid_client.dart';

const String authHost = '192.168.137.12:8080';
const String apiHost = '192.168.137.12';
const int apiPort = 8090;
const String scheme = 'http://';
const String realm = 'DeLaKom';
const String clientId = 'delakom';
const String redirectUrl = 'de.delakom.app://callback';
const List<String> scopes = ['profile'];
const String clientSecret = 'rnrHGj1vzJscjahTiA2irPyLppC49fjx';
String token = '';
late Client client;
late UserInfo userInfo;
