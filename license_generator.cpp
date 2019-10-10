#include "license_generator.h"

#include <QCryptographicHash>
#include <QByteArray>
#include <QDebug>
#include <QGuiApplication>
#include <QClipboard>

void cLicenseGenerator::generate()
{
    QString source = QString("%1,%2,%3,%4,%5")
            .arg(_software)
            .arg(_sensorType)
            .arg(_serial).arg(_name).arg(_company);
    QByteArray ii = QCryptographicHash::hash(source.toUtf8(), QCryptographicHash::Algorithm::Sha3_256);
    _licenseCode = QString("%1%2").arg(QString(ii.toHex())).arg(QString(ii.toHex().count()));

    QString t;
     t+= QString("    {\n\n");
     t += QString("        \"Product name\" : \"%1\",\n").arg(_software);
     t += QString("        \"User\" : \"%1\",\n").arg(_name);
     t += QString("        \"Company\" : \"%1\",\n").arg(_company);
     t += QString("        \"Sensor type\" : \"%1\",\n").arg(_sensorType);
     t += QString("        \"Sensor serial\" : \"%1\",\n").arg(_serial);
     t += QString("        \"Software key\" : \"%1\"\n").arg(_licenseCode);
     t += QString("    }\n");

    setGeneratedText(t);
    emit generatedTextChanged();
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(t);
}

QString cLicenseGenerator::name()
{ return _name; }

void cLicenseGenerator::setName(QString inName)
{ _name = inName; }

QString cLicenseGenerator::company()
{ return _company; }

void cLicenseGenerator::setCompany(QString inCompany)
{ _company = inCompany; }

QString cLicenseGenerator::software()
{ return _software; }

void cLicenseGenerator::setSoftware(QString inSoftware)
{ _software = inSoftware; }

QString cLicenseGenerator::sensorType()
{ return _sensorType; }

void cLicenseGenerator::setSensorType(QString inSensorType)
{ _sensorType = inSensorType; }

QString cLicenseGenerator::serial()
{ return _serial; }

void cLicenseGenerator::setSerial(QString inSerial)
{ _serial = inSerial; }

QString cLicenseGenerator::generatedText()
{ return _generatedText; }

void cLicenseGenerator::setGeneratedText(QString inGeneratedText)
{ _generatedText = inGeneratedText; }
