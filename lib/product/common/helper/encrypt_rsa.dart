//NOTE: Bu dosya sifreleme ve şifre çözme işlemlerini gerçekleştiren bir yardımcı fonksiyon içerir.
/* import 'dart:convert';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';


Future<String> encryptRsa(String cleanText) async {
  var publicKeyBase64 =
      'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3nEPnATWaS5nQEWcxHRy2w9chabd9v2+fapEjG74P81faxBLRaVnLHortZUkadmxXw5OxfjAIBw1Rea53G8RhE3cblBwV0NU1m0zzen8w4K+jwl+X++2y0W73H/+5BVe7/xcES5D9GUCikRjsk9imKMML6Bzz5iWS1KCpPZkPhiywFI3V5SqAR5L+5uW+PXX9kyF2+foVnEMdAh/5vvPCIojNg2FrkFdHIDcJ176qoSEQjVet2aKZNDkmrpRGbL9zcpa9LsQQ4JJNr8GNuMgrUAUhKU/0mNPNLhDPMK31bxMG3WaI7TGSmtIhSDZyPRoaVGpNG7qTKRG02kNdfeUmQIDAQAB';
  var publicKeyBytes = base64Decode(publicKeyBase64);
  var asn1Parser = ASN1Parser(publicKeyBytes);
  var sequence = asn1Parser.nextObject() as ASN1Sequence;
  var publicKeyBitString = sequence.elements[1] as ASN1BitString;

  var publicKeyParser = ASN1Parser(publicKeyBitString.stringValue as Uint8List);
  var publicKeySequence = publicKeyParser.nextObject() as ASN1Sequence;
  var modulus = (publicKeySequence.elements[0] as ASN1Integer).valueAsBigInteger;
  var exponent = (publicKeySequence.elements[1] as ASN1Integer).valueAsBigInteger;

  var rsaPublicKey = RSAPublicKey(modulus, exponent);

  final oaepEncoding = OAEPEncoding.withSHA256(RSAEngine());

  oaepEncoding.init(true, PublicKeyParameter<RSAPublicKey>(rsaPublicKey));

  var dataToEncrypt = Uint8List.fromList(utf8.encode(cleanText));
  var encryptedData = oaepEncoding.process(dataToEncrypt);

  var encryptedPayloadBase64Encoded = base64Encode(encryptedData);
  return encryptedPayloadBase64Encoded;
}
 */
