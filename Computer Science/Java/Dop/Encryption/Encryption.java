package Encryption;

import java.io.*;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class Encryption {

    private static String type = "AES";

    /**
     * Файл srcFile зашифрован и хранится как destFile
     * @param srcFile Файл перед шифрованием
     * @param destFile зашифрованный файл
     * @param privateKey key
     * @throws GeneralSecurityException
     * @throws IOException
     */

    public void encrypt(String srcFile, String destFile, String privateKey) throws GeneralSecurityException, IOException {
        Key key = getKey(privateKey);
        Cipher cipher = Cipher.getInstance(type + "/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key);

        FileInputStream fis = null;
        FileOutputStream fos = null;

        try {
            fis = new FileInputStream(srcFile);
            fos = new FileOutputStream(mkdirFiles(destFile));

            crypt(fis, fos, cipher);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                fis.close();
            }
            if (fos != null) {
                fos.close();
            }
        }
    }

    /**
     * Расшифруйте файл srcFile и сохраните его как destFile.
     * @param srcFile Файл перед расшифровкой
     * @param destFile расшифрованный файл
     * @param privateKey key
     * @throws GeneralSecurityException
     * @throws IOException
     */

    public void decrypt(String srcFile, String destFile, String privateKey) throws GeneralSecurityException, IOException {
        Key key = getKey(privateKey);

        Cipher cipher = Cipher.getInstance(type + "/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, key);

        FileInputStream fis = null;
        FileOutputStream fos = null;

        try {
            fis = new FileInputStream(srcFile);
            fos = new FileOutputStream(mkdirFiles(destFile));

            crypt(fis, fos, cipher);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                fis.close();
            }
            if (fos != null) {
                fos.close();
            }
        }
    }

    /**
     * Создайте соответствующий каталог в соответствии с filePath
     * @param filePath путь к файлу, который будет создан
     * @return файл
     * @throws IOException
     */

    private File mkdirFiles(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        file.createNewFile();

        return file;
    }

    /**
     * Сгенерировать ключ указанной строки
     * @param secret Строка для генерации ключа
     * @return secretKey Сгенерированный ключ
     * @throws GeneralSecurityException
     */

    private static Key getKey(String secret) throws GeneralSecurityException {
        KeyGenerator kgen = KeyGenerator.getInstance(type);

        kgen.init(128, new SecureRandom(secret.getBytes()));

        SecretKey secretKey = kgen.generateKey();

        return secretKey;
    }

    /**
     * Зашифрованный и расшифрованный поток
     * @param в потоке перед шифрованием и дешифрованием
     * @param out зашифрованный и расшифрованный поток
     * @param шифрование и дешифрование
     * @throws IOException
     * @throws GeneralSecurityException
     */
    private static void crypt(InputStream in, OutputStream out, Cipher cipher) throws IOException, GeneralSecurityException {
        int blockSize = cipher.getBlockSize() * 1000;
        int outputSize = cipher.getOutputSize(blockSize);

        byte[] inBytes = new byte[blockSize];
        byte[] outBytes = new byte[outputSize];

        int inLength = 0;
        boolean more = true;

        while (more) {
            inLength = in.read(inBytes);

            if (inLength == blockSize) {
                int outLength = cipher.update(inBytes, 0, blockSize, outBytes);

                out.write(outBytes, 0, outLength);
            }
            else {
                more = false;
            }
        }

        if (inLength > 0)
            outBytes = cipher.doFinal(inBytes, 0, inLength);
        else
            outBytes = cipher.doFinal();
        out.write(outBytes);
    }
}

