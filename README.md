# hapi-fhir-r4
Setup experimental environment for learning FHIR R4 Server

HAPI FHIR Serverを開発、検証用に迅速に立ちあげられるようにDockerにパッケージングしました。今後要望に応じてMySQL等の外部データベースサーバの永続化などの機能を追加していきます。

デモ、開発環境として使いたい方は、下記のコマンドのみで稼働可能です。

前提環境
* Docker 18.06以降
* メモリ 4GB以上

Dockerが入っている環境で下記のコマンドを実行します。Docker Imageがダウンロードされ、起動します。

```
docker run -p 8080:8080 kandalva/hapi-fhir-r4
```

起動したら、Webブラウザを開いて下記のURLを入力してください。 FHIR R4版でホストしているWebアプリケーションサーバにアクセスできます。特に認証は設定されていないPublic Serverと同等の環境で稼働しています。

```
http://localhost:8080/hapi-fhir-jpaserver
```

References:
*[HAPI FHIR - The Open Source FHIR API for Java](http://hapifhir.io/)
*[FHIR R4 Specifications](http://www.hl7.org/FHIR/)
