FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart compile exe bin/cloud_hub.dart -o bin/cloud_hub

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/cloud_hub /app/bin/

ENV PORT=8080
EXPOSE $PORT

CMD ["/app/bin/cloud_hub"]
