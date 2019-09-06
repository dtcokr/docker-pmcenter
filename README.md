# docker-pmcenter
Using pmcenter for Telegram in docker. (Telegram PM chat bot)

Source code by [Elepover(GitHub)](https://github.com/Elepover/pmcenter). 

You can also use the [official docker image](https://github.com/Elepover/pmcenter#use-docker).

## configuration

* you need to create a Telegram bot with the help of [Bot Father](https://t.me/BotFather) to get a API key
* download the `pmcenter.json` [**HERE**](https://github.com/Elepover/pmcenter/raw/master/pmcenter.json), edit it as you like(especially the `APIKey` and `OwnerUID`, you can get the OwnerUID with the help of [userinfobot](https://t.me/userinfobot)), mount it when running this image. for more info, please refer to the [**official document#configuring**(GitHub)](https://github.com/Elepover/pmcenter#configuring)
* using english by default, if you want to use other language, download the language file [**HERE**](https://github.com/Elepover/pmcenter/tree/master/locales) and mount it
* for bot commands, refer to the [**official document#commands**(GitHub)](https://github.com/Elepover/pmcenter#commands)

## usage
here's an example of mounting the configuration file(**must have**) and language file(**optional**)

```sh
$ docker run -d \
    -v /path/to/your/pmcenter.json:/pmcenter/pmcenter.json \
    -v /path/to/your/pmcenter_locale_zh.json:/pmcenter/pmcenter_locale.json \
    dtcokr/pmcenter
```
