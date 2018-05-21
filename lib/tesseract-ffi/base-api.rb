require 'ffi'

module Tesseract
  class BaseApi
    extend FFI::Library
    ffi_lib '/usr/lib/x86_64-linux-gnu/libtesseract.so'

    enum :OcrEngineMode, [:OEM_TESSERACT_ONLY, :OEM_LSTM_ONLY, :OEM_TESSERACT_LSTM_COMBINED, :OEM_DEFAULT,
                          :OEM_CUBE_ONLY, :OEM_TESSERACT_CUBE_COMBINED]

    enum :PageSegMode, [
        :PSM_OSD_ONLY,
        :PSM_AUTO_OSD,
        :PSM_AUTO_ONLY,
        :PSM_AUTO,
        :PSM_SINGLE_COLUMN,
        :PSM_SINGLE_BLOCK_VERT_TEXT,
        :PSM_SINGLE_BLOCK,
        :PSM_SINGLE_LINE,
        :PSM_SINGLE_WORD,
        :PSM_CIRCLE_WORD,
        :PSM_SINGLE_CHAR,
        :PSM_SPARSE_TEXT,
        :PSM_SPARSE_TEXT_OSD,
        :PSM_RAW_LINE,
        :PSM_COUNT
    ]
    attach_function :TessBaseAPICreate, [], :pointer
    attach_function :TessBaseAPIDelete, [:pointer], :void
    attach_function :TessBaseAPIEnd, [:pointer], :void
    attach_function :TessBaseAPIInit4, [:pointer, :string, :string, :OcrEngineMode, :pointer, :int, :pointer, :pointer,
                                        :size_t, :bool], :int
    attach_function :TessBaseAPISetPageSegMode, [:pointer, :PageSegMode], :void
    attach_function :TessBaseAPISetImage2, [:pointer, :pointer], :void
    attach_function :TessBaseAPIGetHOCRText, [:pointer, :int], :string
    attach_function :TessBaseAPIGetUTF8Text, [:pointer], :string

  end
end