package com.care.bowfun.s3;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.springframework.stereotype.Component;

@Component
public class S3 {

	public void uploadToS3(String fullPath) {
	 try { 
         // AWS CLI 명령어
         String s3BucketPath = "s3://bowfun-bucket" + fullPath.replace("\\", "/");  // 슬래시로 구분
         String awsCliCommand = "aws s3 cp \"" + fullPath + "\" \"" + s3BucketPath + "\"";
         System.out.println("명령어 : " + awsCliCommand);

         // 프로세스 빌더 생성
         ProcessBuilder processBuilder = new ProcessBuilder();
         processBuilder.command("bash", "-c", awsCliCommand);

         // 프로세스 실행
         Process process = processBuilder.start();

         // 프로세스의 출력 및 에러를 읽기
         BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
         BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));

         // 프로세스의 출력을 읽기
         String line;
         while ((line = reader.readLine()) != null) {
             System.out.println(line);
         }

         // 프로세스의 에러를 읽기
         while ((line = errorReader.readLine()) != null) {
             System.err.println(line);  // 에러 스트림을 표준 에러로 출력
         }

         // 프로세스 종료 대기
         int exitCode = process.waitFor();
         System.out.println("Exited with error code " + exitCode);

     } catch (Exception e) {
         e.printStackTrace();
     }
	 
	}
}
