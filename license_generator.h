#ifndef LICENSE_GENERATOR_H
#define LICENSE_GENERATOR_H

#include <QObject>

class cLicenseGenerator : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY (QString company READ company WRITE setCompany NOTIFY companyChanged)
    Q_PROPERTY (QString software READ software WRITE setSoftware NOTIFY softwareChanged)
    Q_PROPERTY (QString sensorType READ sensorType WRITE setSensorType NOTIFY sensorTypeChanged)
    Q_PROPERTY (QString serial READ serial WRITE setSerial NOTIFY serialChanged)
    Q_PROPERTY (QString generatedText READ generatedText WRITE setGeneratedText NOTIFY generatedTextChanged)

public:
    Q_INVOKABLE void generate();

    QString name();
    void setName(QString inName);
    QString company();
    void setCompany(QString inCompany);
    QString software();
    void setSoftware(QString inCompany);
    QString sensorType();
    void setSensorType(QString inSensorType);
    QString serial();
    void setSerial(QString inSerial);
    QString generatedText();
    void setGeneratedText(QString inGeneratedText);

signals:
    void nameChanged();
    void companyChanged();
    void softwareChanged();
    void sensorTypeChanged();
    void serialChanged();
    void generatedTextChanged();

private:
    QString _software, _name, _company, _sensorType, _serial, _licenseCode, _generatedText;
};

#endif // LICENSE_GENERATOR_H
