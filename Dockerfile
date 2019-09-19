FROM microsoft/dotnet:2.1-sdk-alpine as Builder

RUN apk add --no-cache --update git \
  && git clone https://github.com/Elepover/pmcenter.git --depth=1 \
  && cd pmcenter/pmcenter \
  && dotnet restore \
  && dotnet publish --configuration Release \
  && mkdir /pmcbuild \
  && mv bin/Release/netcoreapp2.1/publish/* /pmcbuild/ \
  && wget https://github.com/Elepover/pmcenter/raw/master/locales/pmcenter_locale_en.json -O /pmcbuild/pmcenter_locale.json

FROM microsoft/dotnet:2.1-runtime-alpine
LABEL maintainer="dtcokr <dtcokr@outlook.com>" \
  org.label-schema.vcs-url="https://github.com/dtcokr/docker-pmcenter"

COPY --from=Builder /pmcbuild/* /pmcenter/

VOLUME /pmcenter
WORKDIR /pmcenter

ENTRYPOINT ["dotnet", "pmcenter.dll"]
