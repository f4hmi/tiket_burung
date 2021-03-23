<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pemilik_event".
 *
 * @property int $id
 * @property int|null $pemilik_tempat_id
 * @property string|null $nama_event
 * @property string|null $tgl_event
 * @property string|null $created_ad
 * @property string|null $updated_ad
 */
class PemilikEvent extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pemilik_event';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id', 'pemilik_tempat_id'], 'integer'],
            [['created_ad', 'updated_ad'], 'safe'],
            [['nama_event', 'tgl_event'], 'string', 'max' => 255],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pemilik_tempat_id' => 'Pemilik Tempat ID',
            'nama_event' => 'Nama Event',
            'tgl_event' => 'Tgl Event',
            'created_ad' => 'Created Ad',
            'updated_ad' => 'Updated Ad',
        ];
    }
}
