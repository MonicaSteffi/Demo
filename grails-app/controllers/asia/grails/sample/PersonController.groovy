package asia.grails.sample

import jxl.DateCell
import jxl.LabelCell
import jxl.NumberCell
import jxl.Sheet
import jxl.Workbook

class PersonController {

    private final static int COLUMN_MIRID = 0
    private final static int COLUMN_CANCER = 1
    private final static int COLUMN_PROFILE = 2
    private final static int COLUMN_PUBMED = 3

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }

    def upload() {
    }

    def doUpload() {
        def file = request.getFile('file')
        Workbook workbook = Workbook.getWorkbook(file.getInputStream());
        Sheet sheet = workbook.getSheet(0);

           for (int row = 1; row < sheet.getRows(); row++) {
            LabelCell mirId = sheet.getCell(COLUMN_MIRID, row)
            LabelCell cancer = sheet.getCell(COLUMN_CANCER, row)
            LabelCell profile = sheet.getCell(COLUMN_PROFILE, row)
            LabelCell pubmed = sheet.getCell(COLUMN_PUBMED, row)

            new Person(mirId:mirId.string , cancer:cancer.string ,
                    profile:profile.string, pubmed:pubmed.string).save()

        }
        redirect (action:'list')
    }

}
