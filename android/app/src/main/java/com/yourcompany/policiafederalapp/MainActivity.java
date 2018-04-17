package com.yourcompany.policiafederalapp;

import android.Manifest;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.graphics.pdf.PdfDocument;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.Settings;
import android.support.v4.app.ActivityCompat;
import android.util.Log;
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

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.yourcompany.policiafederalapp/general";
    private static MethodChannel channelObject;
    private static final int REQUEST_WRITE_STORAGE = 112;

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
                              Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(Environment.getExternalStorageDirectory().getAbsolutePath()+"/niveles/nivel" + level + ".mp4"));
                              intent.setDataAndType(Uri.parse(Environment.getExternalStorageDirectory().getAbsolutePath()+"/niveles/nivel" + level + ".mp4"), "video/*");
                              startActivity(intent);

                          } catch (Exception e) {

                          }


                      }else if (call.method.equals("writePDF")) {

                          String datos = call.argument("datos");

                          if (isCheckWriteStoragePermission()) {
                              createandDisplayPdf(datos);
                              result.success(1);
                          }

                      }else{
                          result.notImplemented();
                      }
                  }
              });
  }

    // Method for creating a pdf file from text, saving it then opening it for display
    public void createandDisplayPdf(String text) {

        Document doc = new Document();

        try {
            String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/Dir";

            File dir = new File(path);
            if(!dir.exists()) {
                dir.mkdirs();
            }

            File file = new File(dir, "datosAppMuseo.pdf");
            FileOutputStream fOut = new FileOutputStream(file);

            PdfWriter.getInstance(doc, fOut);

            //open the document
            doc.open();

            Paragraph p1 = new Paragraph(text);
            //Font paraFont= new Font(Font.BOLD);
            p1.setAlignment(Paragraph.ALIGN_CENTER);
            //p1.setFont(paraFont);

            //add paragraph to document
            doc.add(p1);

        } catch (DocumentException de) {
            Log.e("PDFCreator", "DocumentException:" + de);
        } catch (IOException e) {
            Log.e("PDFCreator", "ioException:" + e);
        }
        finally {
            doc.close();
        }
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

    public boolean isCheckWriteStoragePermission() {

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) !=
                PackageManager.PERMISSION_GRANTED) {

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)) {
                showMessageOKCancelWriteStorage("Debes permitir el acceso del almacenamiento al dispositivo");
                return false;
            }

            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                    REQUEST_WRITE_STORAGE);
            return false;
        }

        return true;

    }

    private void showMessageOKCancelWriteStorage(String message) {
        new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.myDialog))
                .setMessage(message)
                .setPositiveButton("Aceptar", listenerStorage)
                .setNegativeButton("Cancelar", listenerStorage)
                .create()
                .show();
    }

    DialogInterface.OnClickListener listenerStorage = new DialogInterface.OnClickListener() {

        final int BUTTON_NEGATIVE = -2;
        final int BUTTON_POSITIVE = -1;

        @Override
        public void onClick(DialogInterface dialog, int which) {
            switch (which) {
                case BUTTON_NEGATIVE:
                    // int which = -2
                    dialog.dismiss();
                    break;

                case BUTTON_POSITIVE:
                    // int which = -1
                    ActivityCompat.requestPermissions(
                            MainActivity.this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                            REQUEST_WRITE_STORAGE);
                    dialog.dismiss();
                    break;
            }
        }
    };

    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           String permissions[], int[] grantResults) {
        switch (requestCode) {

            case REQUEST_WRITE_STORAGE: {

                for (int i = 0, len = permissions.length; i < len; i++) {
                    String permission = permissions[i];

                    if (permission.equals(Manifest.permission.WRITE_EXTERNAL_STORAGE)) {

                        if (grantResults[i] == PackageManager.PERMISSION_DENIED) {
                            boolean showRationale = ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_FINE_LOCATION);
                            if (!showRationale) {

                                AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.myDialog));

                                builder.setTitle("Permite el acceso al almacenamiento");

                                builder.setMessage("La aplicación no tiene permiso para escribir en tu almacenamiento." + "\n\n"+
                                        " Por lo tanto, no puede funcionar correctamente. " + "\n\n"+
                                        "Por favor considere otorgarle este permiso.")

                                        .setPositiveButton("Configuración de la App", new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int id) {

                                                Intent intent = new Intent();
                                                intent.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                                                intent.addCategory(Intent.CATEGORY_DEFAULT);
                                                intent.setData(Uri.parse("package:" + getBaseContext().getPackageName()));
                                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                                intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                                                intent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                                                getBaseContext().startActivity(intent);

                                            }
                                        })

                                        .setNegativeButton("Ahora no", new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int id) {
                                            }
                                        });

                                AlertDialog cameraFinalDialog = builder.create();
                                cameraFinalDialog.show();

                            }
                        }
                    }
                }

            }
        }
    }

}
