#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QSysInfo>
#include <QQuickView>

#include <QDebug>

int main(int argc, char *argv[])
{
    if (QSysInfo::productType()=="windows") {
        qputenv("QT_SCALE_FACTOR", "0.7");
    } else {
//        qputenv("QT_SCALE_FACTOR", "0.33");
    }

    //qputenv("QT_AUTO_SCREEN_SCALE_FACTOR",QByteArray("1"));

    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_DisableHighDpiScaling);
    //QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
    //QCoreApplication::setAttribute(Qt::AA_Use96Dpi);

    qmlRegisterSingletonType( QUrl("qrc:/MyMediaPlayer.qml"), "com.luxoft.demo", 1, 0, "MyMediaPlayer" );


    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    view.showFullScreen();

    /*
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
        */

    QObject::connect(view.engine(), &QQmlApplicationEngine::quit, [&app](){
        app.exit();
    });

    return app.exec();
}
