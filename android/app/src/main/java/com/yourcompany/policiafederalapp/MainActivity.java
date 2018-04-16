package com.yourcompany.policiafederalapp;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.pdf.PdfDocument;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContextThemeWrapper;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;


public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.yourcompany.policiafederalapp/general";
    private static MethodChannel channelObject;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    initializeChannels();


  }

  private void initializeChannels(){

      channelObject = new MethodChannel(getFlutterView(), CHANNEL);

      channelObject.setMethodCallHandler(
              new MethodCallHandler() {
                  @Override
                  public void onMethodCall(MethodCall call, Result result) {
                      if (call.method.equals("openPuzzle")) {
                          startActivity(new Intent(MainActivity.this, PuzzleActivity.class));
                      } else if (call.method.equals("openVideo")){

                          String level = call.argument("level").toString();

                          try {

                              System.out.println("Level is: " + level);
                              Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("/storage/emulated/0/niveles/" + level + ".mp4"));
                              intent.setDataAndType(Uri.parse("/storage/emulated/0/niveles/" + level + ".mp4"), "video/*");
                              startActivity(intent);

                          } catch (Exception e) {

                          }


                      }else{
                          result.notImplemented();
                      }
                  }
              });
  }

  public static void finishPuzzle(boolean isSolved) {

      channelObject.invokeMethod("handlePuzzle", isSolved);
  }

  @Override
  public void onBackPressed() {

      AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.permissionsDialog));


      builder.setMessage("¿Seguro que desea salir de la aplicación?")
                .setTitle("Salir");

      builder.setPositiveButton("Salir", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                // User clicked OK button
                MainActivity.super.onBackPressed();
            }
        });
      builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                // User cancelled the dialog
            }
        });

      AlertDialog dialog = builder.create();

      dialog.show();
  }

}
