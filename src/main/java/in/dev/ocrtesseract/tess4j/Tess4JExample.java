package in.dev.ocrtesseract.tess4j;

import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

import java.awt.*;
import java.io.File;

public class Tess4JExample {

    public static void main(String[] args) {
        String filePath = "assets/ocr/images/baeldung.png";
        filePath = "assets/ocr/pdf/Attention-policyholder.pdf";
        String result = null;
        try {
            File image = new File(filePath);
            Tesseract tesseract = new Tesseract();
            tesseract.setLanguage("eng");
            tesseract.setPageSegMode(1);
            tesseract.setOcrEngineMode(1);
            tesseract.setVariable("tessedit_create_hocr", "1");
            String tessdataPath = "assets/tesseract/tessdata";
            if (null != System.getenv("TESSDATA_PREFIX")) {
                tessdataPath = System.getenv("TESSDATA_PREFIX");
            }
            tesseract.setDatapath(tessdataPath);
            result = tesseract.doOCR(image, new Rectangle(1200, 200));
            result = tesseract.doOCR(image);
        } catch (TesseractException e) {
            e.printStackTrace();
        }
        System.out.println(result);
    }

}
