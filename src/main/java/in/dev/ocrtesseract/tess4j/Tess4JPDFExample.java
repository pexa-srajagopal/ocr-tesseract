package in.dev.ocrtesseract.tess4j;

import net.sourceforge.tess4j.ITessAPI;
import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Tess4JPDFExample {

    public static void main(String[] args) {
        String pdfFileName = "Attention-policyholder.pdf";
        try {
            File image = new File("assets/ocr/pdf/Attention-policyholder.pdf");
            //image = new File(Paths.get(ClassLoader.getSystemResource("pdf").toURI()).toString(), pdfFileName);
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
            String outputBase = Paths.get("result", "tess4j-result").toAbsolutePath().toString();
//            outputBase = Paths.get("result").toAbsolutePath().toString();
            System.out.println(Paths.get("result","tess4j-result").toAbsolutePath());
            List<ITesseract.RenderedFormat> formats = new ArrayList<ITesseract.RenderedFormat>(List.of(ITesseract.RenderedFormat.PDF, ITesseract.RenderedFormat.HOCR, ITesseract.RenderedFormat.TEXT));
            tesseract.setVariable(ITesseract.DOCUMENT_TITLE, "My document");
            tesseract.createDocumentsWithResults(image.getPath(), outputBase, formats, ITessAPI.TessPageIteratorLevel.RIL_WORD);

        } catch (TesseractException e) {
            e.printStackTrace();
        }
    }

}
