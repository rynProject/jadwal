import 'package:flutter/material.dart';
import 'package:jadwal_sholat_app/model/ResponseJadwal.dart';
import 'package:intl/intl.dart';
import 'package:jadwal_sholat_app/text_style.dart';

class HeaderContent extends StatelessWidget {
  ResponseJadwal responseJadwal;

  HeaderContent(this.responseJadwal);

  @override
  Widget build(BuildContext context) {
    String shubuh = responseJadwal.results.datetime[0].times.Fajr;
    String dzuhur = responseJadwal.results.datetime[0].times.Dhuhr;
    String ashar = responseJadwal.results.datetime[0].times.Asr;
    String maghrib = responseJadwal.results.datetime[0].times.Maghrib;
    String isha = responseJadwal.results.datetime[0].times.Isha;

    var format = DateFormat("HH:mm");
    var now = DateTime.now();
    var saatIni = DateFormat('HH:mm').format(now);
    var shubuhTime = format.parse(shubuh);
    var dzuhurTime = format.parse(dzuhur);
    var asharTime = format.parse(ashar);
    var maghribTime = format.parse(maghrib);
    var ishaTime = format.parse(isha);

    var two = format.parse(saatIni.toString());
    var diffShubuh = two.difference(shubuhTime);
    var diffDzuhur = two.difference(dzuhurTime);
    var diffAshar = two.difference(asharTime);
    var diffMaghrib = two.difference(maghribTime);
    var diffIsha = two.difference(ishaTime);

    var diff;

    if (now.isAfter(ishaTime) && now.isBefore(shubuhTime)) {
      diff = diffShubuh;
    }
    if (now.isAfter(shubuhTime) && now.isBefore(dzuhurTime)) {
      diff = diffDzuhur;
    }
    if (now.isAfter(dzuhurTime) && now.isBefore(asharTime)) {
      diff = diffAshar;
    }
    if (now.isAfter(asharTime) && now.isBefore(maghribTime)) {
      diff = diffMaghrib;
    }
    if (now.isAfter(maghribTime) && now.isBefore(ishaTime)) {
      diff = diffIsha;
    }

    return Positioned(
      left: 20.0,
      bottom: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.timelapse,
                color: Colors.white,
                size: 20.0,
              ),
              Text(
                diff.toString() + " Menuju Shubuh",
                style: styleAddressHeader,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              )
            ],
          )
        ],
      ),
    );
  }
}
