package in.dev.ocrtesseract;

import in.dev.ocrtesseract.tess4j.Tess4JExample;
import in.dev.ocrtesseract.tess4j.Tess4JPDFExample;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OcrTesseractApplication {

	public static void main(String[] args) {
		SpringApplication.run(OcrTesseractApplication.class, args);
		Tess4JExample.main(new String[0]);
		Tess4JPDFExample.main(new String[]{});
	}

}
