# python ~/dotfiles/bin/add_watermark_pdf.py -i /home/tiagoaguiar/Downloads/ebookxxx.pdf -p "email@hotmail.com" -n "FulanoDaSilva" -o /home/tiagoaguiar/Downloads/output.pdf 
# Pillow==6.2.1
# PyPDF2==1.26.0
# reportlab==3.5.32


from PyPDF2 import PdfFileWriter, PdfFileReader
import io
import argparse
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter


def set_watermark(input_pdf, user_password, user_name, output_pdf):
    packet = io.BytesIO()

    # create a new PDF with Reportlab
    can = canvas.Canvas(packet, pagesize=letter)
    can.setFillColorRGB(1,0,0)
    can.drawString(20, 20, "{} - {}".format(user_name, user_password))
    can.save()

    # move to the beginning of the StringIO buffer
    packet.seek(0)
    new_pdf = PdfFileReader(packet)

    # read existing PDF
    existing_pdf = PdfFileReader(open(input_pdf, "rb"))

    output = PdfFileWriter()
    # add the "watermark" (which is the new pdf) on the existing page

    for i in range(existing_pdf.getNumPages()):
        page = existing_pdf.getPage(i)
        page2 = new_pdf.getPage(0)
        page.mergePage(page2)
        output.addPage(page)

    # finally, write "output" to a real file
    outputStream = open(output_pdf, "wb")
    output.encrypt(user_password, user_password, use_128bit=True)
    output.write(outputStream)
    outputStream.close()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input_pdf', required=True,
                        help='Input pdf file')
    parser.add_argument('-p', '--user_password', required=True,
                        help='output CSV file')
    parser.add_argument('-n', '--user_name', required=True,
                        help='output CSV file')
    parser.add_argument('-o', '--output_pdf', required=True,
                        help='output CSV file')
    args = parser.parse_args()
    set_watermark(args.input_pdf, args.user_password, args.user_name, args.output_pdf)

if __name__ == "__main__":
    main()
