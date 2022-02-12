// Essas são algumas das classes de um framework complexo de um
// conversor de vídeo de terceiros. Nós não controlamos aquele
// código, portanto não podemos simplificá-lo.

class VideoFile {
  void method() => print('VideoFile...');
}

class OggCompressionCodec {
  void method() => print('OggCompressionCodec...');
}

class MPEG4CompressionCodec {
  void method() => print('MPEG4CompressionCodec...');
}

class CodecFactory {
  void method() => print('CodecFactory...');
}

class BitrateReader {
  void method() => print('BitrateReader...');
}

class AudioMixer {
  void method() => print('AudioMixer...');
}

// Nós criamos uma classe fachada para esconder a complexidade
// do framework atrás de uma interface simples. É uma troca
// entre funcionalidade e simplicidade.
class VideoConverter {
  String converterVideo(String name, String extensionFile) {
    VideoFile videoFile = new VideoFile();
    OggCompressionCodec oggCompressionCodec = new OggCompressionCodec();
    MPEG4CompressionCodec mpeg4CompressionCodec = new MPEG4CompressionCodec();
    CodecFactory codecFactory = new CodecFactory();
    BitrateReader bitrateReader = new BitrateReader();
    AudioMixer audioMixer = new AudioMixer();

    videoFile.method();
    oggCompressionCodec.method();
    mpeg4CompressionCodec.method();
    codecFactory.method();
    bitrateReader.method();
    audioMixer.method();

    return '$name.$extensionFile';
  }
}

// As classes da aplicação não dependem de um bilhão de classes
// fornecidas por um framework complexo. Também, se você decidir
// trocar de frameworks, você só precisa reescrever a classe
// fachada.
void main() {
  VideoConverter videoConverter = new VideoConverter();
  print("\nConvertendo vídeo...");
  print(videoConverter.converterVideo('video', 'mp4'));
}
