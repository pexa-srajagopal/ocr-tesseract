# ocr-tesseract
Creating Searchable PDF

> ./gradlew clean build


> docker build -t ocr-tesseract .

> docker run --rm -v $(pwd)/result:/opt/ocr-app/result ocr-tesseract

> docker run -it --rm ocr-tesseract /bin/bash

> docker run -it --rm --name ocr-tesseract -v $(pwd)/result:/opt/ocr-app/result ocr-tesseract /bin/bash

> docker exec -it ocr-tesseract /bin/bash

```
docker cp ocr-tesseract:/usr/local/lib/libtesseract.so.5.0.2 libs
docker cp ocr-tesseract:/usr/local/lib/liblept.so.5.0.4 libs
docker cp ocr-tesseract:/lib64/libjpeg.so.62.3.0 libs
docker cp ocr-tesseract:/lib64/libtiff.so.5.2.0 libs
docker cp ocr-tesseract:/lib64/libwebp.so.4.0.2 libs
docker cp ocr-tesseract:/lib64/libopenjp2.so.2.4.0 libs
docker cp ocr-tesseract:/lib64/libgomp.so.1.0.0 libs
docker cp ocr-tesseract:/lib64/libgomp.so.1.0.0 libs
docker cp ocr-tesseract:/lib64/libjbig.so.2.0 libs
```
> docker build -f lib.Dockerfile -t ocr-tesseract-lib .

> docker run --rm -v $(pwd)/result:/opt/ocr-app/result ocr-tesseract-lib

> docker run -it --rm --name ocr-tesseract-lib -v $(pwd)/result:/opt/ocr-app/result ocr-tesseract-lib /bin/bash