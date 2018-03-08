FROM alpine

COPY ./frontend/frontend /frontend
COPY ./gifcreator/gifcreator /gifcreator
COPY ./render/render /render

COPY ./frontend/static /static
COPY ./frontend/templates /templates

COPY ./gifcreator/scene /scene

# Add trusted CA root bundles
RUN   apk update \
  &&   apk add ca-certificates wget \
  &&   update-ca-certificates

RUN   apk add libc6-compat
RUN   ln -s /lib /lib64

ENV FRONTEND_TEMPLATES_DIR=/templates
ENV FRONTEND_STATIC_DIR=/static
ENV SCENE_PATH=/scene
