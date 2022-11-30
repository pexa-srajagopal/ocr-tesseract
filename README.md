# ocr-tesseract
Creating Searchable PDF

> ./gradlew clean build
> docker build -t ocr-tesseract .
> docker run --rm -v $(pwd)/result:/opt/ocr-app/result ocr-tesseract
> docker run -it --rm ocr-tesseract /bin/bash
> docker run -it --rm --name ocr-tesseract -v $(pwd)/result:/opt/ocr-app/result ocr-tesseract /bin/bash
> docker exec -it ocr-tesseract /bin/bash