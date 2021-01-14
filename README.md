# Ensemble Techniques
## Data Description & Context: 
Parkinson’s Disease (PD) is a degenerative neurological disorder marked by decreased dopamine levels in the brain. It manifests itself through a deterioration of movement, including the presence of tremors and stiffness. There is commonly a marked effect on speech, including dysarthria (difficulty articulating sounds), hypophonia (lowered volume), and monotone (reduced pitch range). Additionally, cognitive impairments and changes in mood can occur, and risk of dementia is increased.Traditional diagnosis of Parkinson’s Disease involves a clinician taking a neurological history of the patient and observing motor skills in various situations. Since there is no definitive laboratory test to diagnose PD, diagnosis is often difficult, particularly in the early stages when motor effects are not yet severe. Monitoring progression of the disease over time requires repeated clinic visits by the patient. An effective screening process, particularly one that doesn’t require a clinic visit, would be beneficial. Since PD patients exhibit characteristic vocal features, voice recordings are a useful and non-invasive tool for diagnosis. If machine learning algorithms could be applied to a voice recording dataset to accurately diagnosis PD, this would be an effective screening step prior to an appointment with a clinician

## Domain:
Medicine

## Attribute Information:
1) name -ASCII subject name and recording  <br/>
2) vocal frequncy: <br/>
   &emsp; a) numberMDVP:Fo(Hz) -Average vocal fundamental frequency <br/> 
   &emsp; b) MDVP:Fhi(Hz) -Maximum vocal fundamental frequency <br/>
   &emsp; c) MDVP:Flo(Hz) -Minimum vocal fundamental frequency <br/>
3) Several measures of variation in fundamental frequency: <br/>
   &emsp; a) MDVP:Jitter(%) <br/>
   &emsp; b) MDVP:Jitter(Abs) <br/>
   &emsp; c) MDVP:RAP <br/>
   &emsp; d) MDVP:PPQ <br/>
   &emsp; e) Jitter:DDP <br/>
4) Several measures of variation in amplitudeNHR <br/>
   &emsp; a) MDVP:Shimmer <br/>
   &emsp; b) MDVP:Shimmer(dB) <br/>
   &emsp; c) Shimmer:APQ3  <br/>
   &emsp; d) Shimmer:APQ5  <br/>
   &emsp; e) MDVP:APQ  <br/>
   &emsp; f) Shimmer:DDA <br/>
5) Two measures of ratio of noise to tonal components in the voicestatus: <br/>
   &emsp; a) NHR <br/>
   &emsp; b) HNR <br/>
6) Health status of the subject: <br/>
   &emsp; a) status(1) -Parkinson's <br/>
   &emsp; b) status (0) -Healthy <br/>
7) Two nonlinear dynamical complexity measures: <br/>
   &emsp; a) RPDE <br/>
   &emsp; b) D2 <br/>
8) Signal fractal scaling exponents: <br/>
   &emsp; a) DFA <br/>
9) Three nonlinear measures of fundamental frequency: <br/>
     &emsp; a) spread1 <br/>
     &emsp; b) spread2 <br/>
     &emsp; a) PPE <br/> 

## Objective: 
Goal is to classify the patients into the respective labels using the attributes from their voice recordings
