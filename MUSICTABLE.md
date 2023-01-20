# Music table

![Music table](images/music_table.png)
![19 inch rack unit stand](images/rack_stand.png)

# Rack enclosure

The rack enclosure has two parts: the riser and the frame for the rack ears. The design assumes the use of 21x33mm lumber. They come in 2400mm and 3000mm lengths where I live.

When the rack enclosure has a tilt, the two frontal beams need to be a bit longer than the actual length in units. Without this the rear corner of the rack ears would have to be dug into the horizontal beam. This offset depends on the tilt angle and can be calculated using the `Law of sines`.

In my design I override this offset to 20mm which would be the result of a tilt of about 30 degrees. I do this because I am not yet sure about the final tilt angle. The good thing is that if I start at 10 degrees and want to go up I will end up cutting my pieces shorter and shorter. At the same time the bigger the tilt the larger the offset is going to be. I know that I will not go higher than 30 degrees so if I start out with a length that would already allow 30 degrees then I can be sure that I will have enough material left for any angle between 0 and 30 degrees.

The rack ear used is an [Adam Hall 19" Parts 61535 B 8](https://www.adamhall.com/shop/af-en/19-inch-rack-accessories/19-inch-rack-rails/943/61535-b-8) which is about 22mm wide with some rounding.

## BOM for two rack enclosures

This BOM assumes that the pieces are cut from a 2400mm long piece. 5mm extra is added to the length of each item when trying to divide up lumber between them to account for the width of the saw blade and the occasional mistake. Everything .5 and above is rounded up to the nearest millimeter.

| Length | Count | Remarks                                                          |
| ------ | ----- | ---------------------------------------------------------------- |
| 191mm  | 8     | 90 degree ends                                                   |
| 328mm  | 4     | 90 degree ends                                                   |
| 349mm  | 8     | 90 degree ends                                                   |
| 376mm  | 4     | 10 degree across the long side on one end                        |
| 455mm  | 4     | 36.8 degree acros the long side on one end and 43.2 on the other |
| 537mm  | 8     | 90 degree ends                                                   |

<table>
  <thead>
    <tr>
      <th>Lumber</th>
      <th>Cut length</th>
      <th>Count</th>
      <th>Total length</th>
      <th>Lefrover lumber</th>
      <th>Remarks</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">#1</td>
      <td>191mm</td>
      <td>7</td>
      <td>1337+35mm</td>
      <td>1028mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td>328mm</td>
      <td>3</td>
      <td>984+15</td>
      <td>29mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td rowspan="3">#2</td>
      <td>191mm</td>
      <td>1</td>
      <td>191+5mm</td>
      <td>2204mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td>328mm</td>
      <td>1</td>
      <td>328+5mm</td>
      <td>1871mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td>455mm</td>
      <td>4</td>
      <td>1820+20mm</td>
      <td>31mm</td>
      <td>36.8 degree acros the long side on one end and 43.2 on the other</td>
    </tr>
    <tr>
      <td rowspan="2">#3</td>
      <td>376mm</td>
      <td>4</td>
      <td>1504+20mm</td>
      <td>876mm</td>
      <td>10 degree across the long side on one end</td>
    </tr>
    <tr>
      <td>349mm</td>
      <td>1</td>
      <td>349+5mm</td>
      <td>522mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td>#4</td>
      <td>537mm</td>
      <td>4</td>
      <td>2148+20mm</td>
      <td>232mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td rowspan="2">#5</td>
      <td>537mm</td>
      <td>3</td>
      <td>1611+15mm</td>
      <td>774mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td>349mm</td>
      <td>2</td>
      <td>698+10mm</td>
      <td>66mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td rowspan="2">#6</td>
      <td>349mm</td>
      <td>5</td>
      <td>1745+25mm</td>
      <td>630mm</td>
      <td>90 degree ends</td>
    </tr>
    <tr>
      <td>537mm</td>
      <td>1</td>
      <td>537+5mm</td>
      <td>88mm</td>
      <td>90 degree ends</td>
    </tr>
  </tbody>
</table>

### Cutting the pieces to length

I did not want to have to change and then re-adjust the stopper between cuts so I made up the following order. The idea is that once the stopper is set, all pieces for that specific length are cut, sometimes from different pieces of lumber. A total of six 2400mm long pieces of lumber is required.

<table>
  <thead>
    <tr>
      <th>Stopper length</th>
      <th>#</th>
      <th>Lumber #</th>
      <th>Count</th>
    </tr>
  <thead>
  <tbody>
    <tr>
      <td rowspan="2">191mm</td>
      <td>1</td>
      <td>#1</td>
      <td>7</td>
    </tr>
    <tr>
      <td>2</td>
      <td>#2</td>
      <td>1</td>
    </tr>
    <tr>
      <td rowspan="2">328mm</td>
      <td>3</td>
      <td>#1</td>
      <td>3</td>
    </tr>
    <tr>
      <td>4</td>
      <td>#2</td>
      <td>1</td>
    </tr>
    <tr>
      <td rowspan="1">455mm</td>
      <td>5</td>
      <td>#2</td>
      <td>4</td>
    </tr>
    <tr>
      <td rowspan="1">376mm</td>
      <td>6</td>
      <td>#3</td>
      <td>4</td>
    </tr>
    <tr>
      <td rowspan="3">349mm</td>
      <td>7</td>
      <td>#3</td>
      <td>1</td>
    </tr>
    <tr>
      <td>8</td>
      <td>#5</td>
      <td>2</td>
    </tr>
    <tr>
      <td>9</td>
      <td>#6</td>
      <td>5</td>
    </tr>
    <tr>
      <td rowspan="3">537mm</td>
      <td>10</td>
      <td>#4</td>
      <td>4</td>
    </tr>
    <tr>
      <td>11</td>
      <td>#5</td>
      <td>3</td>
    </tr>
    <tr>
      <td>12</td>
      <td>#6</td>
      <td>1</td>
    </tr>
  </tbody>
</table>

### Cutting the angled pieces

1. Adjust the cutting angle to 10 degress off and adjust the stopper for the 376mm piece
2. Turn the piece so that the angled end goes across the long side
3. Cut the 376mm pieces
4. Adjust the cutting angle to 36.8 off and adjust the stopper for the 455mm piece
5. Turn the piece so that the angled end goes across the long side
6. Cut the 455mm pieces
7. Adjust the angle to 43.2 degrees without changing the stopper
8. Cut the other end of the 455mm pieces, when done, the piece should form a trapezoid
