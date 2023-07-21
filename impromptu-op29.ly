%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

#(set-global-staff-size 18)

\header {
  maintainer = "Knute Snortum"
  maintainerEmail = "knute (at) snortum (dot) net"
  source = "https://s9.imslp.org/files/imglnks/usimg/0/06/IMSLP842145-PMLP2262-Op29-manuscript.pdf" % MS
  source = "https://s9.imslp.org/files/imglnks/usimg/c/c9/IMSLP399452-PMLP02262-BnF_btv1b52500459z.pdf" % SrcA
  source = "https://vmirror.imslp.org/files/imglnks/usimg/b/b8/IMSLP447371-PMLP02262-Chopin_F_-_Impromptu_pour_le_pianoforte_op._29_(colour).pdf" % SrcB
  % Differences in the sources are discussed inline. 
  copyright = \markup { 
    \center-column {
      "Copyright © 2023 Knute Snortum. This work is licensed under the" 
      \with-url #"https://creativecommons.org/licenses/by-sa/4.0/" 
      "Creative Commons Attribution-ShareAlike 4.0 International License."
    }
  }
}

%%% Scheme functions %%%

makeSpanner =
#(define-music-function (mrkup) (markup?)
  #{
    \override TextSpanner.bound-details.left.text = #mrkup
    \override TextSpanner.bound-details.left.stencil-align-dir-y = 0
    \override TextSpanner.bound-details.left-broken.text = ##f
  #})

%%% Definitions

sd = \sustainOn
su = \sustainOff

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

textUnderSlur = 
  \once {
    \override TextScript.avoid-slur = #'inside
    \override TextScript.outside-staff-priority = ##f
  }

%%% Positions 

slurShapeA = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 2) (0 . 3.5))
                        ((0 . 2.5) (0 . 2) (0 . 3) (0 . 4))
                      ) \etc
slurShapeB = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . -1) (0 . 2) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 1) (0 . 0) (0 . 0))
                      ) \etc
slurShapeC = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 1)) \etc
slurShapeD = \shape #'(
                        ((0 . 0) (0 . 1.5) (0 . 1) (0 . 0))
                        ((0 . 2) (0 . 2) (0 . 1) (0 . 0))
                      ) \etc
slurShapeE = \shape #'((0 . 1) (0 . 1) (0 . 0) (0 . 0)) \etc
slurShapeF = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 2) (0 . 3.5))
                        ((0 . 3) (0 . 2) (0 . 0) (0 . 0))
                      ) \etc
slurShapeG = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 1) (0 . 1) (0 . 0))
                      ) \etc
slurShapeH = \shape #'((0 . 4) (0 . 3.5) (0 . 2) (0 . 0)) \etc
slurShapeI = \shape #'((0 . 4) (0 . 3.5) (0 . 2) (0 . 0)) \etc
slurShapeJ = \shape #'((0 . 0) (0 . 1) (0 . 2.5) (0 . 3)) \etc

moveTrillSpanA = \once \override TrillSpanner.extra-offset = #'(0.5 . 1)
moveTrillSpanB = \once \override TrillSpanner.extra-offset = #'(0 . 1)
moveTrillSpanC = \once \override TrillSpanner.extra-offset = #'(0 . 1)
moveTrillSpanD = \once \override TrillSpanner.extra-offset = #'(0 . 1)
moveTrillSpanE = \once \override TrillSpanner.extra-offset = #'(0 . 1)
moveTrillSpanF = \once \override TrillSpanner.extra-offset = #'(0 . 1)

extendArpeggioA = \once \override Staff.Arpeggio.positions = #'(-1 . 2)
extendArpeggioB = \once \override Staff.Arpeggio.positions = #'(0 . 5)

%%% Markup

legato = \markup \large \italic "legato"
pocoRitenuto = \markup \large \italic "poco ritenuto"
accellerSpanner = \makeSpanner \markup \large \italic \whiteout 
  \pad-markup #0.5 "accelerando"
smorzando = \markup \large \italic "smorzando"
fSostenuto = \markup \dynamic { f \normal-text \large \italic "sostenuto" }
ten = \markup \large \italic "ten."
leggier = \markup \large \italic "leggier"
mv = \markup \large \italic "m.v."
dolciss = \markup \large \italic "dolciss."
conForza = \markup \large \italic "con forza"
sotoVoce = \markup \large \italic "soto voce"
ritenuto = \markup \large \italic "ritenuto"
calandoSpanner = \makeSpanner \markup \large \italic "calando"

%%% Music

global = {
  \time 4/4
  \key af \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \omit TupletBracket
  \omit TupletNumber
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 6
  s4 \voiceOne ff''4-> ef-> eff-> |
  df4-> eff-> df-> c-> |
  
  \barNumberCheck 17
  b4-> c-> cf-> bf-> |
  s1 * 7 |
  
  \barNumberCheck 25
  s1 * 4 |
  \tuplet 3/2 { s4 ef4*1/2 s4 ff4*1/2 s4 ef4*1/2 s4 ff4*1/2 } |
  \tuplet 3/2 { s4 ef4*1/2 } s2. |
  s4 \tuplet 3/2 { c8( df bf } ef4-> \tuplet 3/2 { c8 df bf } |
  ef4-> \tuplet 3/2 { c8 df bf } ef4-> \tuplet 3/2 { c8 df bf) } |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  s1 * 4 |
  \oneVoice
  \undo \omit TupletNumber
  \tuplet 3/2 2 { df4\prall( c d  e f g } |
  af1 |
  \voiceOne g4 f af, bf |
  c2) \oneVoice <c ef>( |
  
  \barNumberCheck 57
  \voiceOne \extendArpeggioA <c ef>2\arpeggio <bf df>4. <af c>8 |
  \oneVoice \grace { c,8*1/2 c->[ ef af]~ } <af c>2) s |
  s1 * 6 |
  
  \barNumberCheck 65
  s1 * 8 |
  
  \barNumberCheck 73
  s1 * 8 |
  
  \barNumberCheck 81
  s1 * 8 |
  
  \barNumberCheck 89
  s1 * 8 |
  
  \barNumberCheck 97
  \voiceOne s4 ff'-> ef-> eff-> |
  df4-> eff-> df-> c-> |
  % ScrA has accents here too, to match bar 17
  b4-> c-> cf-> bf-> |
  s1 * 5 |
  
  \barNumberCheck 105
  s1 * 6 |
  \omit TupletNumber
  \tuplet 3/2 { s4 ef4*1/2 s4 ff4*1/2 s4 ef4*1/2 s4 ff4*1/2 } |
  \tuplet 3/2 { s4 ef4*1/2 } s2. |
  
  \barNumberCheck 113
  s4 \tuplet 3/2 { c8 df bf } ef4-> \tuplet 3/2 { c8 df bf } |
  ef4-> \tuplet 3/2 { c8 df bf } ef4-> \tuplet 3/2 { c8 df bf } |
  s1 * 2 |
  s4 \tuplet 3/2 { c8 df bf } ef4-> \tuplet 3/2 { c8 df bf } |
  ef4-> \tuplet 3/2 { c8 df bf } ef4-> \tuplet 3/2 { c8 df bf } |
}

rightHandLower = \relative {
  \omit TupletBracket
  \omit TupletNumber
  \tuplet 3/2 { ef'8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 {
    ef8(\prall d ef  c' g bf  af e g  f c e |
    df8 f, g  af c bf  af f af  g d f) |
  }
  \tuplet 3/2 { ef8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 { 
    ef8(\prall d ef  e f fs  g g' df  ef b c |
    g8 bf af  f c d  ef bf b  c cs d |
  }
  
  \barNumberCheck 9
  \tuplet 3/2 { ef8 e f }  gf4)~  \tuplet 3/2 { gf8 e( f } c'4)~ |
  \tuplet 3/2 { c8 ef,( f  \slashedGrace { af } gf f ef  f c ef } df4->)~ |
  \tuplet 3/2 { df8 c( df } ff4)~ \tuplet 3/2 { ff8 d( ef } bf'4~ |
  \tuplet 3/2 { bf8 df, ef \slashedGrace { g8 } f ef df  ef bf df } c4->)~ |
  \tuplet 3/2 { 
    c8\slurShapeA ( g af  c bf af  g bf c  df f ef |
    c8 g af  c bf af  g bf c  df f ef |
    c8 b c  \voiceTwo ff8 bf, cf  ef a, bf  eff af, bff | 
    df8 g, af  eff' af, bff  df g, af  c fs, g |
    
    \barNumberCheck 17
    % Third beat, missed an f-natural in the MS? f-natural penciled in 
    % in SrcA, in print in SrcB
    b8 f fs  c' fs, g  cf f, gf  bf e, f) | 
  }
  \oneVoice \tuplet 3/2 { f8( g af  bf c df } c4 bf) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  a gf' e }  f4) |
  \tuplet 3/2 { 
    bf,8->[(\prall a bf  af' fs g]  c,->[\prall b c  bf' g af]) |
    d,8->\slurShapeB ( ef f  g af a  bf c df  d f ef |
    \ottava 1 ef8 c'-> df,-1  bf'-> c,-1 af'->  bf,-1 g'-> af,-1
      f'-> g,-1 e'-> |
    c8-2 af'-> bf,-1  g'-> af,-1 f'-> \ottava 0 gf, ef'-> f,  df'-> ef, c'-> |
    
    \barNumberCheck 25
    ef8 df f-4  df-2 c ef  c-2 bf-1 df  bf af-1 c |
    af8 g bf  g f af  f ef g  ef df f |
    df8 c ef  dff cf ff  df c ef  dff cf ff |
    df8 c ef  dff cf ff  df c ef  dff cf ff |
    df8 c ef  dff cf ff  df c ef  dff cf ff |
  }
  \tuplet 3/2 { df8 c ef  dff cf e } \oneVoice f8^!) r\fermata <df, g>4->^( |
  <c af'>8) r \voiceTwo g'4 \tuplet 3/2 { af8 ef af } g4 |
  \tuplet 3/2 { af8 ef af } g4 \tuplet 3/2 { af8 ef af } g4 |
  
  \barNumberCheck 33
  \oneVoice \tuplet 3/2 { <af af'>8->( f' ef  df c bf  af f ef  df c bf } |
  \voiceThree \staffDown \tuplet 3/2 { af8 f ef  df c bf) } af4-> r |
  \staffUp \oneVoice c'2( f |
  g2 af |
  bf af4. bf8 |
  c2) b->( |
  c2 d4. ef8 |
  c2 df-> |
  
  \barNumberCheck 41
  bf2 c4 \grace { ef } df-. |
  bf2 af4. g8 |
  c,2 f |
  g2 af |
  bf1*1/2 \magnifyMusic 0.63 { \stemUp s8*1/2 bf[ bf bf c bf af bf] }
    \stemNeutral |
  c2) d( |
  e2 d4. c8 |
  d2) g,2*1/4->\slurShapeC ( \magnifyMusic 0.63 { \tuplet 13/3 { 
    \stemUp g8[ a g fs g b' af g f d e a, bf] } } \stemNeutral |
  
  \barNumberCheck 49
  \textUnderSlur c1)~^\ten |
  c2.. c8( |
  df4-> c f g |
  af2. c,4) |
  s1 * 2 |
  s2 \voiceTwo af~ |
  af2 s |
  
  \barNumberCheck 57
  g2 s |
  s2 \oneVoice r4 r8 c( |
  df4-> c f g |
  af2..) c,8( |
  \undo \omit TupletNumber
  \tuplet 13/8 { df8->\prall c c' b bf g e df c d e f g } |
  af4) r \grace { g16\slurShapeD ^([ a] } \afterGrace 7/8 { \moveTrillSpanA
    a2->\startTrillSpan } { g16[\stopTrillSpan a] } |
  \afterGrace 7/8 { \moveTrillSpanB bf2->\startTrillSpan } 
                  { af16[\stopTrillSpan bf] } 
    \afterGrace 7/8 { \moveTrillSpanC b2->\startTrillSpan } 
                    { as16[\stopTrillSpan b] } |
  c4-.) r df2->( |
  
  \barNumberCheck 65
  df,2 c |
  f2) r4 c( |
  df4->\prall c f g |
  af2..) c,8( |
  \omit TupletNumber
  \tuplet 3/2 { df8 c d  c ef c  e c f  c g' c, } |
  af'2..) g8( |
  \undo \omit TupletNumber
  \tuplet 15/8 { g8 af g fs g bf af e g fs c e df f, g) } |
  <af c>4 r <ef' c'>2-> |
  
  \barNumberCheck 73
  \tuplet 3/2 2 { <d b'>4-> <df bf'>-> <bf g'>-> <df f>-> <g, ef'> r8 
                  <bf df> } |
  \set tieWaitForNote = ##t
  \grace { c,8*1/2 c[^(~ ef~ af_~]) } <c, ef af c>2..-> c'8( |
  \tuplet 3/2 2 { df4->\trill c d e f g } |
  af2.) r8 c,( |
  \omit TupletNumber
  \tuplet 3/2 { c'8 c, cs  d df' <ef, ef'>  e' ef, f  fs g g' } |
  <af, af'>4) r \slashedGrace { a8 \slurShapeE ^( } \afterGrace 7/8 { 
    \moveTrillSpanD a2->\startTrillSpan } { gs16[\stopTrillSpan a] } |
  \afterGrace 7/8 { \moveTrillSpanE bf2->\startTrillSpan } 
                  { af16[\stopTrillSpan bf] } 
    \afterGrace 7/8 { \moveTrillSpanF b2->\startTrillSpan }
                    { as16[\stopTrillSpan b] } |
  \ottava 1 \slashedGrace { c8*1/128 } <c c'>4-!)\arpeggio r <df df'>2-> |
  
  \barNumberCheck 81
  \tuplet 17/16 { c16->( c' b bf g e c b \ottava 0 bf g e c b bf g ef df) } |
  \afterGrace 7/8 c2->\startTrillSpan { b16[\stopTrillSpan c] } 
    \afterGrace 7/8 df4->\trill { c16[ df] } 
    \afterGrace 7/8 d4->\trill { cs16[ d] } |
  \tuplet 3/2 { ef8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 {
    ef8(\prall d ef  c' g bf  af e g  f c e |
    df8 f, g  af c bf  af f af  g d f) |
  }
  \tuplet 3/2 { ef8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  g f' e }  ef4) |
  
  \barNumberCheck 89
  \tuplet 3/2 { 
    ef8(\prall d ef  e f fs  g g' df  ef b c |
    g8 bf af  f c d  ef bf b  c cs d |
  }
  \tuplet 3/2 { ef8 e f }  gf4)~  \tuplet 3/2 { gf8( e f } c'4~ |
  \tuplet 3/2 { c8 ef, f  \slashedGrace { af } gf f ef  f c ef } df4~ |
  % First three eighth-notes, sources differ, below is MS, but doesn't follow
  % the pattern.  SrcA has df c df which is the phrase from the earlier
  % passage, SrcB follows the MS
  \tuplet 3/2 { df8 d ef } ff4~ \tuplet 3/2 { ff8 d ef } bf'4~ |
  \tuplet 3/2 { bf8 df, ef  \slashedGrace { g } f ef df  ef bf df } c4)~ |
  \tuplet 3/2 { 
    c8\slurShapeF ( g af  c bf af  g bf c  df f ef |
    c8 g af  c bf af  g bf c  df f ef |
  
    \barNumberCheck 97
    \voiceTwo c8 b c  ff bf, cf  ef a, bf  eff af, bff |
    df8 g, af  eff' af, bff  df g, af  c fs, g |
    % third beat, missed f-natural in MS?  fs in ScrA, f-natural in SrcB
    b8 f fs  c' fs, g  cf f, gf  bf e, f | 
  }
  \oneVoice \tuplet 3/2 { f g af  bf c df } c4 bf) |
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  g f' e } ef4) | 
  \tuplet 3/2 { ef,8->[(\prall d ef  c' bf af]  a gf' e } f4) |
  \tuplet 3/2 { 
    bf,8->[(\prall a bf  af' fs g])  c,->[(\prall b c  bf' g af]) |
    d,->\slurShapeG ( ef f  g af a  bf c df  d f ef |
    
    \barNumberCheck 105
    \ottava 1 ef c'-> df,  bf'-> c, af'->  bf, g'-> af,  f'-> g, e'-> |
    % third beat, e-natural penciled in on MS, ef implicit in SrcA, explicit
    % in SrcB.  ef follows the patern from an ealier passge.
    c8 af'-> bf,  g'-> af, f'->  \ottava 0 gf, ef'-> f,  df'-> ef, c'-> |
    ef8 df f  df c ef  c bf df  bf af c |
    af8 g bf  g f af  f ef g  ef df f |
    df8 c ef  dff cf ff  df c ef  dff cf ff |
    df8 c ef  dff cf ff  df c ef  dff cf ff |
    \voiceTwo df8 c ef  dff cf ff  df c ef  dff cf ff |
  }
  \tuplet 3/2 { df c ef  dff cf e } f8) \oneVoice r\fermata <df, g>4->^( |
  
  \barNumberCheck 113
  <c af'>8) r \voiceTwo g'4\slurShapeH ^( \tuplet 3/2 { af8 ef af } g4 |
  \tuplet 3/2 { af8 ef af } g4 \tuplet 3/2 { af8 ef af } g4 |
  \oneVoice <af af'>8-.) r <c, e g>4^( <c f af> <df g bf> |
  <c af' c>4 <c e g> <c f af> <df g bf> |
  <c af' c>8-!) r \voiceTwo g'4\slurShapeI ^( \tuplet 3/2 { af8 ef af } g4 |
  \tuplet 3/2 { af8 ef af } g4 \tuplet 3/2 { af8 ef af } g4 |
  \oneVoice <af ef' c'>8-.)\arpeggio r <c, e g>4^( <c f af> <df g bf> |
  <c af' c>4 <c e g> <c f af> <df g bf> |
  
  \barNumberCheck 121
  <c af' c>8-.) r r4 r2 |
  r4 <c e g>-.^( <c f af>-. <df g bf>-. |
  <c af' c>4-.) r r2 |
  r2 <c f af>4-.^( <df g bf>-. |
  <c af' c>4-.) r r2 |
  q2-.^( q-. |
  q1-^)\fermata |
  \bar "|."
}

rightHand = <<
  \global
  \override Staff.Script.avoid-slur = #'inside
  \override Staff.Fingering.avoid-slur = #'inside
  \override Staff.TrillSpanner.avoid-slur = #'inside
  \override Staff.TrillSpanner.outside-staff-priority = ##f
  \set Score.tempoHideNote = ##t 
  \tempo "Allegro assai quasi presto" 4 = 144
  \new Voice \rightHandUpper
  \new Voice \rightHandLower
>>

leftHandUpper = \relative {
  \omit TupletBracket
  \omit TupletNumber
  \voiceThree
  s1 * 3 |
  s2 ef |
  s1 * 3 |
  s2. bf'4 |
  
  \barNumberCheck 9
  c4 bf a bf |
  a4 f bf af |
  g4 af g f |
  ff4 ef af, e' |
  f4 bf, ef g |
  af4 f ef g |
  af4 af g gf |
  f4 gf f e |
  
  \barNumberCheck 17
  ds4 e ef d |
  s1 * 7 |
  
  \barNumberCheck 25
  s1 * 2 |
  s4 d ef d |
  ef4 d ef d |
  ef4 d ef d |
  s1 * 3 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  <c' e>4 c, f' c, |
  <c' df>4 c, <c' f> c, |
  s1 |
  af'4( c <af f'> c) |
  <g bf>4( c <bf e> c) |
  af4( c <af f'> c) |
  s1 * 2 |
  
  \barNumberCheck 57
  s1 * 3 |
  af4( c <af f'> c) |
  <g bf>4( c <bf e> c |
  <af f'>4 c) <a gf'>( c) |
  s1 * 2 |
  
  \barNumberCheck 65
  s1 |
  af4( c <af f'> c) |
  <g bf>4( c <bf e> c) |
  af4( c <af f'> c) |
  <g bf>4( c <bf e> c) |
  af4( c <af f'> c) |
  s1 * 2 |
  
  \barNumberCheck 73
  s1 * 3 |
  af4 c <af f'> c |
  <g bf>4( c <bf e> c |
  <af f'>4 c) \extendArpeggioB <a gf'>(\arpeggio c) |
  s1 * 2 |
  
  \barNumberCheck 81
  s1 * 5 |
  s2 ef, |
  s1 * 2 |
  
  \barNumberCheck 89
  s1 |
  s2. bf'4 |
  c4 bf a bf |
  a4 f bf af |
  g4 af g f |
  ff4 ef af, e' |
  f4 bf, ef g |
  af4 f ef g |
  
  \barNumberCheck 97
  af4 af g gf |
  f4 gf f e |
  ds4 e ef d |
  s1 * 5 |
  
  \barNumberCheck 105
  s1 * 6
  ef4 d ef d |
}

leftHandLower = \relative {
  \omit TupletBracket
  \omit TupletNumber
  \tuplet 3/2 {
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    c8 ef' af,  c, e' af,  df, f' bf,  af f' bf, |
    df,8 df' bf  f df' bf  \voiceFour ef, df' bf  g df'! bf |
    \oneVoice af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    cf8 ef' a,  fs ef' a,  bf, ef' bf  g ef' bf |
    bf,8 d' bf  af d bf  ef, g' ef  \voiceFour bf g' ef |
    
    \barNumberCheck 9
    c8 gf' ef  bf gf' ef  a, f' ef  bf gf' ef |
    a,8 f' ef  f, f' c  bf f' df  af ff' bf, |
    g8 ef' bf  af ff' cf  g ef' bf  f d' af |
    ff8 df' af  ef df' g,  af, c' af  e c' af |
    f8 c' af  bf, d' af  ef ef' bf g ef' bf |
    af8 ef' c  f, d' bf  ef, ef' bf  g ef' bf |
    af8 ef' c  af ff' cf  g ef' bf  gf eff' bff |
    % last eight-note, gf in MS, g in SrcA, gf in SrcB
    f8 df' af  gf eff' bff  f df' af  e c' gf |
    
    \barNumberCheck 17
    ds8 b' fs  e c' g  ef cf' gf  d bf' f |
    \oneVoice df8 bf' f  bf, df' f,  ef c' af  ef df' g, |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    af,8 c' ef,  d c' ef,  c ef' a,  f ef' a, |
    d,8-> f' bf,  ef,-> g' bf,  e,-> g' c,  f,-> af' c, |
    \clef treble g8-> df'' g,  ef df' g,  bf, df' g,  ef df' g, |
    af,8-> c' af  ef c' af  \clef bass c,,-> e' c  bf e c |
    f,8-> f' c  af f' c  a, c' gf  ef c' gf |
    
    \barNumberCheck 25
    bf,8-> df' f,  c-> ef' a,  df,-> f' bf,  af f' bf, |
    df, f' bf,  af f' bf,  df, f' bf,  af f' bf, |
    ef,8 ef' af,  \voiceFour d, ff' af,  ef ef' af,  d, ff' af, |
    ef8 ef' af,  d, ff' af,  ef ef' af,  d, ff' af, |
    ef8 ef' af,  d, ff' af,  ef ef' af,  d, ff' af, |
  }
  \tuplet 3/2 { \oneVoice ef8 ef' af,  d, e' af, } f'8 r\fermata <ef, bf'>4 |
  \tuplet 3/2 { 
    af,8 c' ef,  d df' ef,  af, c' ef,  d df' ef, |
    af,8 c' ef,  d df' ef,  af, c' ef,  d df' ef, |
  }
  
  \barNumberCheck 33
  <af, ef' c'>4\arpeggio r r2 |
  \voiceFour r2 r4 g-> |
  \oneVoice r4 f-.( <c' af'> f,-. |
  <c' e bf'>4 c,-. <c' f af> f,-.) |
  r4 ef-.( <ef'g df'> ef,-. |
  <ef' af c> af,-. <g' d' f> g,-.) |
  r4 c-.( <g' b f'> g,-. |
  <g' ef'>4 c,-. <f a ef'> f,-.) |
  
  \barNumberCheck 41
  r4 bf-.( <f' a ef'> f,-. |
  <f' bf df>4 bf,-. <e bf' c> c-.) |
  r4 f,-.( <c' af'> f,-. |
  <c' e bf'>4 c,-. <c' f af> f,-.) |
  r4 ef-.( <ef' g df'> ef,-. |
  <ef' af c>4) af,-. <f' b d>( gs,-. |
  <e' b' d>4 gs,-. <e' a c> a,-. |
  % Much agonizing over the first-beat chord, does it have a df or d?
  % The MS says it's a df, but this makes an horribly dissonant chord. The
  % two other sources agree that it is a df, SrcA has an a natural pinceled in.
  % SrcB has an a-natural in print.  This still makes a very dissonant chord.
  <f' a d>4 f,-.) <g' b f'>\slurShapeJ ( g,-. |
  
  \barNumberCheck 49
  \voiceFour g'2 af |
  f2 af) |
  \oneVoice c,,4( c'' <g bf e> c) |
  \voiceFour f,1 |
  f1 |
  f1 |
  \oneVoice df,4-. bf''( <af f'> bf) |
  ef,,4-. ef'( <c' af'> ef,) |
  
  \barNumberCheck 57
  ef,4-. ef'( <df' g> ef,) |
  af,,4-. ef''( <c af' c> ef) |
  % third beat, MS has an ef, but this seems like a missed natural.  One 
  % source has the natural peciled in, another has it in print.
  c,4-. c''( <g bf e> c) |
  \voiceFour f,1 |
  f1~ |
  f2 ef |
  \oneVoice <d f f'>4( bf') <d, af' f'>( b') |
  <c, af' f'>4->( c' c' af) |
  
  \barNumberCheck 65
  c,,,4-.( c'' <g bf e> c) |
  \voiceFour f,1 |
  f1 |
  f1 |
  f1 |
  f1 |
  \oneVoice df,4-. bf''( <af f'> bf) |
  ef,,4-. ef'( <c' af'> ef,) |
  
  \barNumberCheck 73
  ef,4-. ef'( <bf' ef> ef,) |
  af,,4-. ef''( <c af' c> ef) |
  c,4-. c''( <bf e> c) |
  \voiceFour f,1 |
  f1 |
  f2 ef |
  \oneVoice <d f f'>4(\arpeggio bf') < df, af' f'>(\arpeggio b') |
  <c, af' f'>4\arpeggio c' af' f |
  
  \barNumberCheck 81
  <c, g' bf e>4\arpeggio r r2 |
  R1 |
  \tuplet 3/2 {
    af8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    c8 ef' af,  c, e' af,  df, f' bf,  af f' bf, |
    df,8 df' bf  f df' bf  \voiceFour ef, df' bf  g df'! bf |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    
    \barNumberCheck 89
    cf8 ef' a,  fs ef' a,  bf, ef' bf  g ef' bf |
    bf,8 d' bf  af d bf  ef, g' ef  \voiceFour bf g' ef |
    c8 gf' ef  bf gf' ef  a, f' ef  bf gf' ef |
    a,8 f' ef  f, f' c  bf f' df  af ff' bf, |
    g8 ef' bf  af ff' cf  g ef' bf  f d' af |
    ff8 df' af  ef df' g,  af, c' af  e c' af |
    f8 c' af  bf, d' af  ef ef' bf  g ef' bf |
    af8 ef' c  f, d' bf  ef, ef' bf  g ef' bf |
    
    \barNumberCheck 97
    af8 ef' c  af ff' cf  g ef' bf  gf eff' bff |
    f8 df' af  gf eff' bff  f df' af  e c' gf |
    ds8 b' fs  e c' g  ef cf' gf  d bf' f |
    df8 bf' f  bf, df' f,  ef c' af  ef df' g, |
    af,8 c' ef,  d c' ef,  bf df' ef,  d df' ef, |
    af,8 c' ef,  d c' ef,  c ef' a,  f ef' a, |
    d,-> f' bf,  ef,-> g' bf,  e,-> g' c,  f,-> af' c, |
    \clef treble g-> df'' g,  ef df' g,  bf, df' g,  ef df' g, |
    
    \barNumberCheck 105
    af,8-> c' af  ef c' af  \clef bass c,,-> e' c  bf e c | 
    f,8-> f' c  af f' c  a,-> c' gf  ef c' gf |
    bf,8-> df' f,  c-> ef' a,  df,-> f' bf,  af f' bf, |
    df,8 f' bf,  af f' bf,  df, f' bf,  af f' bf, |
    ef, ef' af,  d, ff' af,  ef ef' af,  d, ff' af, |
    ef ef' af,  d, ff' af,  ef ef' af,  d, ff' af, |
    ef ef' af,  d, ff'^> af,  ef ef' af,  d, ff'^> af, |
  }
  \tuplet 3/2 { ef ef' af,  d, e' af, } \oneVoice f'8 r\fermata <ef, bf'>4 |
  
  \barNumberCheck 113
  \tuplet 3/2 { af,8 c' ef,  d df' ef,  af, c' ef,  d df' ef, } |
  \tuplet 3/2 { af,8 c' ef,  d df' ef,  af, c' ef,  d df' ef, } |
  \oneVoice <af, ef' c'>8\arpeggio r c4 <f, f'> <ef ef'> |
  <af, af'>4 <c c'> <f f'> <ef ef'> |
  <af,af'>8 r \tuplet 3/2 { af'8 df' ef,  af, c' ef,  d df' ef, } |
  \tuplet 3/2 { af,8 c' ef,  d df' ef,  af, c' ef,  d df' ef, } |
  <af, ef' c'>8\arpeggio r c4 <f, f'> <ef ef'> |
  <af, af'>4 <c c'> <f f'> <ef ef'> |
  
  \barNumberCheck 121
  <af, af'>8 r r4 r2 |
  r4 <c c'> <f f'> <ef ef'> |
  <af, af'>4 r r2 |
  r2 <f' f'>4 <ef ef'> |
  <af, af'>4 r r2 |
  <af' ef'>2 q |
  q1 |
}

leftHand = <<
  \clef bass
  \global
  \mergeDifferentlyHeadedOn
  \new Voice \leftHandUpper
  \new Voice \leftHandLower
>>

dynamics = {
  \override TextScript.Y-offset = -0.5
  \tag layout { s4^\legato } \tag midi { s4\mp } s4..\< s16\! s4 |
  s4 s4..\< s16\! s4 |
  s4 s2\> s4\! |
  s1 |
  s4 s4..\< s16\! s4 |
  s4 s4..\< s16\! s4 |
  s2\< s8. s16\! s4 |
  s4\> s8. s16\! s4 s\< |
  
  \barNumberCheck 9
  s8. s16\! s4 s\< s\! |
  s4\> s8. s16\! s2 |
  s4\< s\! s\< s\! |
  s2\> s8. s16\! s4 |
  s2 s4\< s8. s16\! |
  s4\> s8. s16\! s4\< s8. s16\! |
  s4 s2\> s8. s16\! |
  s1 |
  
  \barNumberCheck 17
  s1 |
  s2\< s\! |
  s4 s4..\< s16\! s4 |
  s4 s4..\< s16\! s4 |
  s1\cresc |
  s2... s16\! |
  s1\f |
  s2 s^\pocoRitenuto |
  
  \barNumberCheck 25
  s2\> s8 \accellerSpanner s\startTextSpan s4 |
  s2... s16\!\stopTextSpan |
  s1  |
  s1\p |
  s4 s8 s^\smorzando s2
  s1 |
  s4 s2.\p |
  s1 |
  
  \barNumberCheck 33
  s1\f |
  s1 |
  \tag layout { s2.^\fSostenuto s4\< | }
  \tag midi   { s1\f\< }
  s2... s16\! |
  s1 * 4 |
  
  \barNumberCheck 41
  s1 |
  s4 s2\> s8 s\! |
  s4 s2.\< |
  s2... s16\! |
  s1 |
  s2 s\tweak X-offset -1.5 ^\ritenuto |
  s1 % \p | <-- retstore "P"
  s1 |
  
  \barNumberCheck 49
  s1 * 2 |
  s2..\f\< s8\! |
  s1 |
  s2..\p\< s8\! |
  s1 * 2 |
  s2 s\> |
  
  \barNumberCheck 57
  s2... s16\! |
  s2.. s8\f |
  s1\< |
  s8 s2.\! s8\p |
  s1^\leggier |
  s2 s\f\cresc |
  s1 |
  s2 s\ff |
  
  \barNumberCheck 65
  s1 |
  s2. s4\tweak X-offset -1 ^\mv |
  s2...\< s16\! |
  s1 |
  s4\p s2\< s8. s16\! |
  s1 |
  s1^\dolciss
  s2 s\tweak X-offset -2 ^\conForza |
  
  \barNumberCheck 73
  s1 |
  s2.. s8\tweak X-offset -2.5 ^\mv |
  s4 s2\< s8 s\! |
  s1 |
  s2...\f\< s16\! | 
  s2. s4\cresc |
  s1 |
  s2... s16\! |
  
  \barNumberCheck 81
  s1 |
  \afterGrace s2 { s8\< } s4... s32\! |
  s4 s4..\< s16\! s4 |
  s4 s4..\< s16\! s4 |
  s4 s2.\> |
  s2. s4\! |
  s1 * 2 |
  
  \barNumberCheck 89
  s2\< s\! |
  s1 * 5 |
  s2 s4..\< s16\! |
  s8.\> s16\! s4 s4..\< s16\! |
  
  \barNumberCheck 97
  s4 s2\> s8. s16\! |
  s4 s2\> s8. s16\! |
  s4 s2\> s8. s16\! |
  s4\< s8. s16\! s2 |
  s4 s2\< s4\! |
  s4 s2\< s4\! |
  s1\cresc |
  s2... s16\! |
  
  \barNumberCheck 105
  s1\f |
  s2 s^\pocoRitenuto |
  s2\> \accellerSpanner s\startTextSpan |
  s2... s16\!\stopTextSpan |
  s1\p |
  s1 |
  s2 s^\smorzando |
  s1 |
  
  \barNumberCheck 113
  s4 s2.\p |
  s1 |
  s4 s2.^\sotoVoce |
  s1 |
  s4 s2.\pp |
  s1 |
  s4 s2.^\sotoVoce |
  s1 |
  
  \barNumberCheck 121
  s1 |
  s4 \calandoSpanner s2.\startTextSpan |
  s1 * 2 |
  s4\stopTextSpan s2. |
}

pedal = {
  s4\sd s\su s\sd s\su |
  s4\sd s\su s\sd s\su |
  s4\sd s\su\sd s\su\sd s8. s16\su | 
  s1 * 3 |
  s2\sd s4..\su\sd s16\su |
  s2\sd s8.\su\sd s16\su s4 |
  
  \barNumberCheck 9
  s1 * 3 |
  s2 s8.\sd s16\su s4 |
  s4 s8.\sd s16\su s2 |
  s1 * 3 |
  
  \barNumberCheck 17
  s1 * 4
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2...\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  
  \barNumberCheck 25
  s4\sd s\su\sd s2\su\sd |
  s2... s16\su |
  s4 s8.\sd s16\su s4 s8.\sd s16\su |
  s4 s8.\sd s16\su s4 s8.\sd s16\su |
  s4 s8.\sd s16\su s4 s8.\sd s16\su |
  s4 s8.\sd s16\su s2 |
  s1 * 2 |
  
  \barNumberCheck 33
  s1 * 2 |
  s4 s2\sd s8. s16\su |
  s4\sd s8. s16\su s2 |
  s4 s2\sd s8. s16\su |
  s2 s4..\sd s16\su |
  s2 s4..\sd s16\su |
  s2 s4..\sd s16\su |
  
  \barNumberCheck 41
  s2 s4..\sd s16\su |
  s2 s4..\sd s16\su |
  s2 s4..\sd s16\su |
  s4..\sd s16\su s2 |
  s2 s4..\sd s16\su |
  s2 s4..\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4...\su\sd s32\su |
  
  \barNumberCheck 49
  s4..\sd s16\su s2 |
  s1 |
  s2...\sd s16\su |
  s1 * 2 |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 57
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s1 |
  s2 s4..\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 65
  s2...\sd s16\su |
  s2...\sd s16\su |
  s1 * 4 |
  s2...\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 73
  s2...\sd s16\su |
  s2...\sd s16\su |
  s1 * 3 |
  s2 s4..\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 81
  s2....\sd s32\su |
  s2\sd s4\su\sd s8..\su\sd s32\su |
  s1 * 6 |
  
  \barNumberCheck 89
  s1 * 5 |
  s2 s8.\sd s16\su s4 |
  s4 s8.\sd s16\su s2 |
  s1 |
  
  \barNumberCheck 97
  s1 * 8 |
  
  \barNumberCheck 105
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4\sd s\su\sd s2\su\sd |
  s2... s16\su |
  s4 s8.\sd s16\su s4 s8.\sd s16\su |
  s4 s8.\sd s16\su s4 s8.\sd s16\su |
  s4 s8.\sd s16\su s4 s8.\sd s16\su |
  s1 |
  
  \barNumberCheck 113
  s1 * 2 |
  s8.\sd s16\su s2. |
  s1 |
  \tag layout { s1\sd | s2... s16\su | }
  \tag midi   { s1 * 2 | }
  s8.\sd s16\su s2. |
}

tempi = {
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 7 |
  s2 \tempo 4 = 136 s |
  
  \barNumberCheck 25
  \tempo 4 = 128 s1 |
  \tempo 4 = 136 s1 |
  \tempo 4 = 144 s1 |
  \tempo 4 = 152 s1|
  \tempo 4 = 160 s1 |
  \tempo 4 = 168 s2 s8 \tempo 4 = 40 s8 \tempo 4 = 144 s4 |
  s1 * 2 |
  
  \barNumberCheck 33
  s1 * 8 |
  
  \barNumberCheck 41
  s1 * 5 |
  s2 \tempo 4 = 134 s |
  s1 * 2 |
  
  \barNumberCheck 49
  \tempo 4 = 144 s1 |
  s1 * 7
  
  \barNumberCheck 57
  s1 * 8 |
  
  \barNumberCheck 65
  s1 * 8 |
  
  \barNumberCheck 73
  s1 * 8 |
  
  \barNumberCheck 81
  s1 * 8 |
  
  \barNumberCheck 89
  s1 * 8 |
  
  \barNumberCheck 97
  s1 * 8 |
  
  \barNumberCheck 105
  s1 |
  s2 \tempo 4 = 136 s |
  \tempo 4 = 128 s1 |
  \tempo 4 = 136 s1 |
  \tempo 4 = 144 s1 |
  \tempo 4 = 152 s1 |
  \tempo 4 = 160 s1 |
  \tempo 4 = 168 s2 s8 \tempo 4 = 40 s8 \tempo 4 = 144 s4 |
  
  \barNumberCheck 113
  s1 * 8 |
  
  \barNumberCheck 121
  s1 * 5 |
  \tempo 4 = 124 s2 \tempo 4 = 104 s |
  \tempo 4 = 84 s1 |
}

%%% Output

\paper {
  ragged-right = ##f
  ragged-last-bottom = ##f
  min-systems-per-page = 5
  
  last-bottom-spacing = 
    #'((basic-distance . 6)
       (minimum-distance . 4)
       (padding . 3)
       (stretchability . 30)) % defaults 1, 0, 1, 30
    
  top-system-spacing.minimum-distance = 10
    
  #(set-paper-size "letter")
  
  two-sided = ##t
  inner-margin = 12\mm
  outer-margin = 8\mm
}

\layout {
  \context {
    \Score
    \omit BarNumber
    \override Slur.details.free-head-distance = 1
  }
  \context {
    \PianoStaff
    \consists #Span_stem_engraver
  } 
  \context {
    \Voice
    \override Tie.minimum-length = 2
  }
}

\midi {
  \context {
    \Staff
    \consists "Dynamic_performer"
  }
  \context {
    \Voice
    \remove "Dynamic_performer"
  } 
  \context {
    \Score
    midiMinimumVolume = #0.20
    midiMaximumVolume = #0.99
  }  
}

\score { 
  \keepWithTag #'layout
  \new PianoStaff \with { 
    instrumentName = \markup \huge "Piano"
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
  >>
  \layout {}
}

\include "articulate.ly"

\score { 
  \keepWithTag #'midi
  \articulate <<
    <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
  >>
  \midi {}
}