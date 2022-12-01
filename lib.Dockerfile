FROM amazoncorretto:11
RUN yum update -y &&\
	#yum install -y gcc gcc-c++ autoconf automake make pkgconfig libtool &&\
	#yum install -y zlib-devel libpng-devel libjpeg-turbo-devel libtiff-devel libwebp-devel openjpeg2-devel giflib-devel &&\
	#yum install -y gzip tar &&\
    yum clean all &&\
    rm -rf /var/cache/yum

WORKDIR /opt

ARG ARG_LD_LIBRARY_PATH=/usr/local/lib
#ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:${ARG_LD_LIBRARY_PATH}
ENV LD_LIBRARY_PATH ${ARG_LD_LIBRARY_PATH}
#ENV PKG_CONFIG_PATH $PKG_CONFIG_PATH:${ARG_LD_LIBRARY_PATH}/pkgconfig
ENV PKG_CONFIG_PATH ${ARG_LD_LIBRARY_PATH}/pkgconfig
ARG ARG_TESSDATA_PREFIX=/usr/local/share/tessdata
ENV TESSDATA_PREFIX ${ARG_TESSDATA_PREFIX}

RUN mkdir -p ocr-app/assets
RUN mkdir ocr-app/result

COPY ./assets/tesseract/tessdata/*.traineddata ${ARG_TESSDATA_PREFIX}/
COPY ./libs/* ${ARG_LD_LIBRARY_PATH}/
COPY ./assets ocr-app/assets

RUN echo ${ARG_LD_LIBRARY_PATH} >> /etc/ld.so.conf
RUN ldconfig

WORKDIR ocr-app
COPY ./build/libs/ocr-tesseract-0.0.1-SNAPSHOT.jar ocr-app.jar
CMD ["java", "-jar", "ocr-app.jar"]
