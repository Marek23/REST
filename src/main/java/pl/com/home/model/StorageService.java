package pl.com.home.model;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.stream.Stream;

@Component
public class StorageService {
	ArrayList<File> files = new ArrayList<File>();

	public void store(MultipartFile file) throws IllegalStateException, IOException {
		File out = new File("out/" + file.getOriginalFilename());
		out.createNewFile();
		file.transferTo(out.toPath());
	}

	public Stream<Path> loadAll() throws IOException {
		Path dir = Paths.get("files");
		return Files.walk(dir);
	}

	public File loadFile(String filename) {
		return new File("files/" + filename);
	}
}