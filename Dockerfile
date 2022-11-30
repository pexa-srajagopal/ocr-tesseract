FROM amazoncorretto:11
RUN yum update -y &&\
	yum install -y gcc gcc-c++ autoconf automake make pkgconfig libtool &&\
	yum install -y zlib-devel libpng-devel libjpeg-turbo-devel libtiff-devel libwebp-devel openjpeg2-devel giflib-devel &&\
	yum install -y gzip tar &&\
    yum clean all &&\
    rm -rf /var/cache/yum

WORKDIR /opt

COPY ./assets/leptonica-1.82.0.tar.gz .
RUN gunzip -v leptonica-1.82.0.tar.gz
RUN tar xvf leptonica-1.82.0.tar

WORKDIR leptonica-1.82.0

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

RUN ./autogen.sh
RUN ./configure
RUN make && make install
ENV PKG_CONFIG_PATH $PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

COPY ./assets/leptonica_version.c .
RUN gcc leptonica_version.c -o leptonica_version -I/usr/local/include -L/usr/local/lib -llept

WORKDIR /opt

COPY ./assets/tesseract-5.2.0.tar.gz .
RUN gunzip -v tesseract-5.2.0.tar.gz
RUN tar xvf tesseract-5.2.0.tar

WORKDIR tesseract-5.2.0

RUN ./autogen.sh
RUN ./configure
RUN make && make install

ARG TESSDATA_PREFIX=/usr/local/share/tessdata/
ENV TESSDATA_PREFIX ${TESSDATA_PREFIX}

WORKDIR /opt

RUN mkdir -p ocr-app/assets
RUN mkdir ocr-app/result

COPY ./assets/tesseract/tessdata/*.traineddata ${TESSDATA_PREFIX}
COPY ./assets ocr-app/assets

WORKDIR ocr-app
COPY ./build/libs/ocr-tesseract-0.0.1-SNAPSHOT.jar ocr-app.jar
ENTRYPOINT ["java", "-jar", "ocr-app.jar"]

#CMD ["java", "-version"]
#CMD ["pkg-config", "--modversion", "lept"]
#CMD ["/opt/leptonica_version"]
#CMD ["tesseract", "--version"]

# checking giflib is at least version 5.1 (but not 5.1.2)

# convert              file.pdf -depth 8 file.tiff
# convert -density 300 file.pdf -depth 8 file.tiff
# tesseract file.tiff result

# curl -o test-tesseract.png https://raw.githubusercontent.com/madmaze/pytesseract/master/tests/data/test.png
# tesseract test-tesseract.png stdout
# tesseract test-tesseract.png test-tesseract
# cat test-tesseract.txt